package com.kqkd.service.impl;

import com.kqkd.pojo.BlogExample;
import com.kqkd.pojo.BlogType;
import com.kqkd.service.BlogService;
import com.kqkd.service.BlogTypeService;
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
        /*获得博客类别计数*/
        BlogTypeService blogTypeService = (BlogTypeService) applicationContext.getBean("blogTypeService");
        List<BlogType> blogTypes = blogTypeService.countList();
        application.setAttribute("blogTypes", blogTypes);
        /*首页轮播*/
        BlogService blogService = (BlogService) applicationContext.getBean("blogService");
        BlogExample blogExample = new BlogExample();
        BlogExample.Criteria criteria = blogExample.createCriteria();
        criteria.andTopEqualTo(1);
        blogService.selectByExample(blogExample);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        InitComponent.applicationContext = applicationContext;
    }
}
