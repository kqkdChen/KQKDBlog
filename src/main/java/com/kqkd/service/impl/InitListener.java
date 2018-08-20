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
import java.text.ParseException;
import java.util.*;

@Component
public class InitListener implements HttpSessionListener, ServletContextListener, ApplicationContextAware {

    private static ApplicationContext applicationContext;

    private static Timer timer = null;

    @Override
    public void sessionCreated(HttpSessionEvent se){
        ServletContext application = se.getSession().getServletContext();
        /*统计在线人数*/
        Integer online = (Integer) application.getAttribute("online");
        if( null == online)
            online = 0;
        application.setAttribute("online", online+1);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        ServletContext application = se.getSession().getServletContext();
        Integer online = (Integer) application.getAttribute("online");
        if(online > 0){
            application.setAttribute("online", online-1);
        }
    }


    /**
     * 初始化博客全局内容
     * @param sce
     */
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext application = sce.getServletContext();
        BlogTypeService blogTypeService = (BlogTypeService) applicationContext.getBean("blogTypeService");
        BlogService blogService = (BlogService) applicationContext.getBean("blogService");
        LinkService linkService = (LinkService) applicationContext.getBean("linkService");
        /*侧边博客类别*/
        List<BlogType> blogTypeList = blogTypeService.countList();
        application.setAttribute("blogTypeList", blogTypeList);
        /* 本月最热 */
        BlogExample blogExample = new BlogExample();
        BlogExample.Criteria criteria = blogExample.createCriteria();
        criteria.andReleaseDateBetween(DateUtil.getMothFirstDay(), DateUtil.getMothLastDay());
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
            if(b != null){
                String[] keywordsArray = b.getKeywords().split(" ");
                for(String keyword : keywordsArray){
                    if(!keywordsStrList.contains(keyword)){
                        keywordsStrList.add(keyword);
                    }
                }
            }
        }
        application.setAttribute("tagList",keywordsStrList);
        /*友情链接*/
        LinkExample linkExample = new LinkExample();
        linkExample.setOrderByClause("sort");
        List<Link> linkList = linkService.selectByExample(linkExample);
        application.setAttribute("linkList",linkList);
        /* 今日浏览量 *//*
        SiteDataService siteDataService = (SiteDataService) applicationContext.getBean("siteDataService");
        SiteDataExample siteDataExample = new SiteDataExample();
        try {
            siteDataExample.createCriteria().andDateEqualTo(DateUtil.getCurrentDate("yyyy-MM-dd"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        List<SiteData> siteDataList = siteDataService.selectByExample(siteDataExample);
        if(siteDataList.size() != 0){
            application.setAttribute("dpv",siteDataList.get(0).getDpv());
        }
        *//* 设置定时器，准点保存今日dpv *//*
        timer = new Timer(true);
        Calendar todayEnd = Calendar.getInstance();
        todayEnd.set(Calendar.HOUR_OF_DAY, 23);
        todayEnd.set(Calendar.MINUTE, 59);
        todayEnd.set(Calendar.SECOND, 58);
        Date date = todayEnd.getTime();
        timer.schedule(new AutoRun(application, applicationContext),date);*/
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        InitListener.applicationContext = applicationContext;
    }


    /**
     *销毁定时器同时保存访问次数
     * @param sce
     */
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        /*timer.cancel();  //销毁定时器
        ServletContext application = sce.getServletContext();
        Integer dpv = (Integer) application.getAttribute("dpv");
        if(null == dpv)
            dpv = 0;
        SiteDataService siteDataService = (SiteDataService) applicationContext.getBean("siteDataService");
        SiteDataExample siteDataExample = new SiteDataExample();
        try {
            siteDataExample.createCriteria().andDateEqualTo(DateUtil.getCurrentDate("yyyy-MM-dd"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        List<SiteData> siteDataList = siteDataService.selectByExample(siteDataExample);
        Date date = new Date();
        if(siteDataList.size() == 0){
            siteDataService.insert(new SiteData(date, dpv));
        }else{
            SiteData siteData = siteDataList.get(0);
            siteData.setDpv(dpv);
            siteDataService.updateByPrimaryKey(siteData);
        }*/
    }
}
