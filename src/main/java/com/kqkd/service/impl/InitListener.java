package com.kqkd.service.impl;

import com.github.pagehelper.PageHelper;
import com.kqkd.pojo.Blog;
import com.kqkd.pojo.BlogType;
import com.kqkd.pojo.Link;
import com.kqkd.pojo.SiteData;
import com.kqkd.pojo.example.BlogExample;
import com.kqkd.pojo.example.LinkExample;
import com.kqkd.pojo.example.SiteDataExample;
import com.kqkd.service.BlogService;
import com.kqkd.service.BlogTypeService;
import com.kqkd.service.LinkService;
import com.kqkd.service.SiteDataService;
import com.kqkd.util.DateUtil;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.temporal.TemporalAdjusters;
import java.util.*;

@Component
public class InitListener implements HttpSessionListener, ServletContextListener, ApplicationContextAware {

    private static ApplicationContext applicationContext;


    /**
     * 统计在线人数以及日访问量（DPV）
     * @param se
     */
    @Override
    public void sessionCreated(HttpSessionEvent se){
        ServletContext application = se.getSession().getServletContext();
        SiteDataService siteDataService = (SiteDataService)applicationContext.getBean("siteDataService");
        SiteDataExample siteDataExample = new SiteDataExample();
        siteDataExample.setOrderByClause("date DESC");
        PageHelper.offsetPage(0, 1);
        List<SiteData> siteDataList = siteDataService.selectByExample(siteDataExample);
        Date date = new Date();
        String formatDateStr = DateUtil.formatDate(date, "yyyy-MM-dd");
        Date currentDate = null;
        try {
            currentDate = DateUtil.formatString(formatDateStr, "yyyy-MM-dd");
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(siteDataList.size() == 0){
            /*初始化dpv*/
            SiteData siteData = new SiteData(currentDate,1);
            siteDataService.insert(siteData);
            application.setAttribute("dpv",1);

        }else{
            /*如果当前时间大于表中最大时间，则表明是下一天，否则还是当天*/
            if(currentDate.compareTo(siteDataList.get(0).getDate()) > 0){
                SiteData siteData = new SiteData(currentDate,1);
                siteDataService.insert(siteData);
                application.setAttribute("dpv",1);
            }else{
                SiteData siteData = siteDataList.get(0);
                Integer id = siteData.getId();
                Integer dpv = siteData.getDpv()+1;
                siteData.setDpv(dpv);
                siteData.setId(id);
                siteDataService.updateByPrimaryKeySelective(siteData);
                application.setAttribute("dpv",dpv);
            }
        }
        /*统计在线人数*/
        Integer online = (Integer) application.getAttribute("online");
        if(null == online){
            online = 0;
        }
        online++;
        application.setAttribute("online",online);
    }

    /**
     * session过期即用户下线
     * @param se
     */
    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        ServletContext application = se.getSession().getServletContext();
        Integer online = (Integer) application.getAttribute("online");
        if(null == online){
            online = 0;
        }else{
            online--;
        }
        application.setAttribute("online",online);
    }

    /**
     * 初始化博客全局内容
     * @param sce
     */
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext application = sce.getServletContext();
        BlogTypeService blogTypeService = (BlogTypeService) applicationContext.getBean("blogTypeService");
        /*侧边博客类别*/
        List<BlogType> blogTypeList = blogTypeService.countList();
        application.setAttribute("blogTypeList", blogTypeList);

        BlogService blogService = (BlogService) applicationContext.getBean("blogService");
        /* 本月最热 */
        BlogExample blogExample = new BlogExample();
        BlogExample.Criteria criteria = blogExample.createCriteria();
        /* 计算属于本月时间段内的博客 */
        LocalDate today = LocalDate.now();
        LocalDate firstDay = LocalDate.of(today.getYear(),today.getMonth(),1);
        LocalDate lastDay =today.with(TemporalAdjusters.lastDayOfMonth());
        ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime first = firstDay.atStartOfDay(zoneId);
        ZonedDateTime last = lastDay.atStartOfDay(zoneId);
        Date firstDayDate = Date.from(first.toInstant());
        Date lastDayDate = Date.from(last.toInstant());
        criteria.andReleaseDateBetween(firstDayDate, lastDayDate);
        PageHelper.offsetPage(0,5);
        List<Blog> blogList = blogService.selectByExample(blogExample);
        List<Blog> hotList = new ArrayList<>();
        int sum, checkWeights;
        int likeWeights;
        List<Integer> sumList = new ArrayList<>();
        /* 计算热力值 */
        if(blogList.size() > 0){
            for(Blog b : blogList){
                checkWeights = b.getCheckNum();
                likeWeights = b.getLikeNum()*5;
                sum = checkWeights+likeWeights;
                sumList.add(sum);
            }
            Collections.sort(sumList);
            for(int i = sumList.size(); i > 0; i--){
                Integer currentSum = sumList.get(i-1);
                for(Blog b : blogList){
                    if(b.getCheckNum()+b.getLikeNum()*5 == currentSum){
                        b.setHotNum(currentSum);
                        hotList.add(b);
                        blogList.remove(b);
                        break;
                    }
                }
            }
        }
        application.setAttribute("hotList", hotList);
        /*侧边标签云*/
        List<Blog> keywordsList = blogService.selectKeywords();
        List<String> keywordsStrList = new LinkedList<>();
        for(Blog b : keywordsList){
            /*剔除空格和重复的关键字*/
            if(b!=null){
                String[] keywordsArray = b.getKeywords().split(" ");
                for(String keyword : keywordsArray){
                    if(!keywordsStrList.contains(keyword)){
                        keywordsStrList.add(keyword);
                    }
                }
            }
        }
        application.setAttribute("keywordsList",keywordsStrList);
        /*友情链接*/
        LinkService linkService = (LinkService) applicationContext.getBean("linkService");
        LinkExample linkExample = new LinkExample();
        linkExample.setOrderByClause("sort");
        List<Link> linkList = linkService.selectByExample(linkExample);
        application.setAttribute("linkList",linkList);

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        InitListener.applicationContext = applicationContext;
    }

}
