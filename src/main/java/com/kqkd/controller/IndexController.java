package com.kqkd.controller;

import com.github.pagehelper.PageHelper;
import com.kqkd.pojo.Blog;
import com.kqkd.pojo.BlogExample;
import com.kqkd.service.BlogService;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("")
public class IndexController {

    @Resource
    private BlogService blogService;

    @RequestMapping("index")
    public ModelAndView index(){
        ModelAndView mav = new ModelAndView();
        PageHelper.offsetPage(0, 10);
        BlogExample blogExample = new BlogExample();
        blogExample.setOrderByClause("release_date DESC");
        List<Blog> blogList = blogService.selectByExampleWithBLOBs(blogExample);
        for(Blog b:blogList){
            String content = b.getContent();
            Document doc = Jsoup.parse(content);
            Elements elements = doc.select("img[src$=.jpg]");
            if(elements.size() > 0){
                String cover = elements.get(0).attr("src");
                b.setCover(cover);
            }else{
                b.setCover("暂无图片");
            }

        }
        mav.addObject("blogList", blogList);
        mav.setViewName("index");
        return mav;
    }

}
