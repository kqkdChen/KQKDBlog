package com.kqkd.service.impl;

import com.kqkd.util.DateUtil;
import com.kqkd.util.IpAddressUtil;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * @author kqkd
 * @date 2018/8/14 14:13
 */
public class VisitFilter implements Filter {

    private FilterConfig config;

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        ServletContext application = config.getServletContext();
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        String sessionId = request.getSession().getId();
        Map<String, Object> visitMap = (Map<String, Object>)application.getAttribute(sessionId);
        if(visitMap == null){
            String ip = IpAddressUtil.getIpAddr(request);
            String address = IpAddressUtil.getAddresses(ip, "UTF-8");
            visitMap = new LinkedHashMap<>();
            visitMap.put(ip, address);
        }
        String visitPath = request.getRequestURI();
        String validPath[] = {"article", "tag", "cate"};
        for(String validPathStr : validPath){
            if(visitPath.contains(validPathStr)){
                visitMap.put(DateUtil.formatDate(new Date(),"yyyy-MM-dd HH:mm:ss"), visitPath);
                application.setAttribute(sessionId,visitMap);
            }
        }
        filterChain.doFilter(request,response);
    }

    @Override
    public void init(FilterConfig config){
        this.config = config;
    }

    @Override
    public void destroy() {

    }
}
