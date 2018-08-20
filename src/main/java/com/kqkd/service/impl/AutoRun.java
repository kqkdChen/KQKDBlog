package com.kqkd.service.impl;

import com.kqkd.pojo.SiteData;
import com.kqkd.pojo.example.SiteDataExample;
import com.kqkd.service.SiteDataService;
import com.kqkd.util.DateUtil;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.TimerTask;

/**
 * @author kqkd
 * @date 2018/8/14 16:09
 */

public class AutoRun extends TimerTask {

    private static boolean isRunning = false;
    private ServletContext application;
    private ApplicationContext applicationContext;

    public AutoRun() {
        super();
    }

    public AutoRun(ServletContext application, ApplicationContext applicationContext) {
        this.application = application;
        this.applicationContext = applicationContext;
    }

    @Override
    public void run() {
        if(!isRunning){
            SiteDataService siteDataService = (SiteDataService) applicationContext.getBean("siteDataService");
            Integer dpv = (Integer) application.getAttribute("dpv");
            if(null == dpv)
                dpv = 0;
            SiteDataExample siteDataExample = new SiteDataExample();
            try {
                siteDataExample.createCriteria().andDateEqualTo(DateUtil.getCurrentDate("yyyy-MM-dd"));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            List<SiteData> siteDataList = siteDataService.selectByExample(siteDataExample);
            Date date = new Date();
            if (siteDataList.size() != 0) {
                SiteData siteData = siteDataList.get(0);
                siteData.setDpv(dpv);
                siteDataService.updateByPrimaryKey(siteData);
            } else {
                siteDataService.insert(new SiteData(date, dpv));
            }
            SiteData dvp = siteDataService.findDvp();
            application.setAttribute("dp",dvp.getDpv()); //更新总浏览量
            application.setAttribute("dpv",0); //清空dpv
            isRunning = false;
    }
}
}
