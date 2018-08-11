package com.kqkd.controller;

import com.kqkd.pojo.Blog;
import com.kqkd.pojo.example.BlogExample;
import com.kqkd.service.BlogService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.*;

@Controller
@RequestMapping("")
public class IndexController {

    @Resource
    private BlogService blogService;

    @RequestMapping("index")
    public ModelAndView index(){
        ModelAndView mav = new ModelAndView();
        BlogExample blogExample = new BlogExample();
        /* 首页轮播,1表示置顶,按照点赞数量排序 */
        BlogExample.Criteria criteria = blogExample.createCriteria();
        criteria.andTopEqualTo(1);
        List<Blog> topList = blogService.selectByExample(blogExample);
        mav.addObject("topList", topList);
        mav.setViewName("front/index");
        return mav;
    }

}
