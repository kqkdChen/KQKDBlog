package com.kqkd.service.impl;

import com.github.pagehelper.PageHelper;
import com.kqkd.pojo.*;
import com.kqkd.service.BlogService;
import com.kqkd.service.BlogTypeService;
import com.kqkd.service.LinkService;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;

@Component
public class InitComponent implements ServletContextListener, ApplicationContextAware {

    private static ApplicationContext applicationContext;

    @Override
    public void contextInitialized(ServletContextEvent sce) {

        ServletContext application = sce.getServletContext();
        /*侧边博客类别*/
        BlogTypeService blogTypeService = (BlogTypeService) applicationContext.getBean("blogTypeService");
        List<BlogType> blogTypeList = blogTypeService.countList();
        application.setAttribute("blogTypeList", blogTypeList);
        /*侧边点击排行*/
        BlogService blogService = (BlogService) applicationContext.getBean("blogService");
        BlogExample blogExample = new BlogExample();
        blogExample.setOrderByClause("check_num DESC");
        PageHelper.offsetPage(0,4);
        List<Blog> checkNumList = blogService.selectByExample(blogExample);
        application.setAttribute("checkNumList",checkNumList);
        /*侧边点赞排行*/
        PageHelper.offsetPage(0,4);
        blogExample.setOrderByClause("like_num DESC");
        List<Blog> likeNumList = blogService.selectByExample(blogExample);
        application.setAttribute("likeNumList",likeNumList);
        /*首页轮播*/
        BlogExample.Criteria criteria = blogExample.createCriteria();
        criteria.andTopEqualTo(1);
        List<Blog> topList = blogService.selectByExample(blogExample);
        application.setAttribute("topList",topList);
        /*友情链接*/
        LinkService linkService = (LinkService) applicationContext.getBean("linkService");
        LinkExample linkExample = new LinkExample();
        linkExample.setOrderByClause("sort DESC");
        List<Link> linkList = linkService.selectByExample(linkExample);
        application.setAttribute(":linkList",linkList);

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        InitComponent.applicationContext = applicationContext;
    }
}
