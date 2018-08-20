package com.kqkd.controller;

import com.github.pagehelper.PageHelper;
import com.kqkd.pojo.Blog;
import com.kqkd.pojo.example.BlogExample;
import com.kqkd.service.BlogService;
import com.kqkd.util.DateUtil;
import com.kqkd.util.ResponseUtil;
import com.kqkd.util.StringUtil;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("")
public class BlogController {

    @Resource
    private BlogService blogService;

    @RequestMapping("flowPage")
    public void flow( Integer page, Integer limit, Integer size, HttpServletResponse response) throws Exception{
        JSONObject result=new JSONObject();
        BlogExample blogExample = new BlogExample();
        blogExample.setOrderByClause("release_date DESC");
        PageHelper.startPage(page,limit);
        List<Blog> blogList = blogService.selectByExample(blogExample);
        for(Blog b : blogList){
            String formatDate = DateUtil.formatDate(b.getReleaseDate(), "yyyy-MM-dd HH:mm");
            b.setReleaseDateStr(formatDate);
        }
        result.put("blogList", blogList);
        int pages=size%limit==0?size/limit:size/limit+1;
        result.put("pages", pages);
        ResponseUtil.write(response,result);
    }

    @RequestMapping("blog/{id}")
    public ModelAndView info(@PathVariable(value = "id") Integer id){
        ModelAndView mav = new ModelAndView();
        BlogExample blogExample = new BlogExample();
        blogExample.setOrderByClause("id DESC");
        BlogExample.Criteria criteria = blogExample.createCriteria();
        BlogExample blogExample2 = new BlogExample();
        BlogExample.Criteria criteria2 = blogExample2.createCriteria();
        criteria.andIdLessThan(id);
        criteria2.andIdGreaterThan(id);
        Blog blog = blogService.selectByPrimaryKey(id);
        blog.setCheckNum(blog.getCheckNum()+1);
        //更新查看次数
        blogService.updateByPrimaryKeySelective(blog);
        //上一篇
        PageHelper.offsetPage(0,1);
        List<Blog> previous = blogService.selectByExample(blogExample);
        //下一篇
        PageHelper.offsetPage(0,1);
        List<Blog> next = blogService.selectByExample(blogExample2);
        if(previous.size() > 0){
            mav.addObject("previous",previous.get(0));
        }
        if(next.size() > 0){
            mav.addObject("next",next.get(0));
        }
        mav.addObject("blog",blog);
        mav.setViewName("front/detail");
        return mav;
    }

    @RequestMapping("cate/{id}")
    public ModelAndView cate(@PathVariable("id") Integer id){
        ModelAndView mav = new ModelAndView();
        BlogExample blogExample = new BlogExample();
        BlogExample.Criteria criteria = blogExample.createCriteria();
        criteria.andTypeIdEqualTo(id);
        List<Blog> blogList = blogService.selectByExample(blogExample);
        if(blogList.size() > 0){
            mav.addObject("count", blogList.size());
        }
        mav.addObject("id",id);
        mav.setViewName("front/cate");
        return mav;
    }

    @RequestMapping("catePage/{id}")
    public void catePage(@PathVariable("id")Integer id, Integer page, Integer limit, HttpServletResponse response) throws Exception{
        JSONObject result = new JSONObject();
        BlogExample blogExample = new BlogExample();
        BlogExample.Criteria criteria = blogExample.createCriteria();
        criteria.andTypeIdEqualTo(id);
        PageHelper.startPage(page, limit);
        List<Blog> blogList = blogService.selectByExample(blogExample);
        if(blogList.size() > 0){
            for(Blog b : blogList){
                String formatDate = DateUtil.formatDate(b.getReleaseDate(), "yyyy-MM-dd HH:mm");
                b.setReleaseDateStr(formatDate);
            }
        }
        result.put("blogList", blogList);
        ResponseUtil.write(response,result);
    }

    @RequestMapping("life")
    public ModelAndView life(){
        ModelAndView mav = new ModelAndView();
        BlogExample blogExample = new BlogExample();
        blogExample.setOrderByClause("like_num DESC");
        BlogExample.Criteria criteria = blogExample.createCriteria();
        criteria.andKeywordsLike("%生活%");
        List<Blog> blogList = blogService.selectByExample(blogExample);
        mav.addObject("count",blogList.size());
        PageHelper.offsetPage(0, 8);
        List<Blog> pageBlogList = blogService.selectByExample(blogExample);
        mav.addObject("blogList",pageBlogList);
        mav.addObject("firstLimit",8);
        mav.setViewName("front/life");
        return mav;
    }

    @RequestMapping("lifeFlow")
    public void lifePage(Integer page, Integer limit, HttpServletResponse response) throws Exception {
        JSONObject result = new JSONObject();
        BlogExample blogExample = new BlogExample();
        blogExample.setOrderByClause("like_num DESC");
        BlogExample.Criteria criteria = blogExample.createCriteria();
        criteria.andKeywordsLike("%生活%");
        PageHelper.startPage(page,limit);
        List<Blog> blogList = blogService.selectByExample(blogExample);
        result.put("blogList",blogList);
        ResponseUtil.write(response,result);
    }


    @RequestMapping("blog")
    public ModelAndView blog(){
        ModelAndView mav = new ModelAndView();
        List<Blog> blogList = blogService.selectByExample(new BlogExample());
        mav.addObject("count",blogList.size());
        mav.setViewName("front/blog");
        return mav;
    }

    @RequestMapping("blogPage")
    public void blogPage(Integer page, Integer limit, HttpServletResponse response) throws Exception {
        JSONObject result = new JSONObject();
        BlogExample blogExample = new BlogExample();
        blogExample.setOrderByClause("release_date DESC");
        PageHelper.startPage(page,limit);
        List<Blog> blogList = blogService.selectByExample(blogExample);
        if(blogList.size() > 0){
            for(Blog b : blogList){
                String formatDate = DateUtil.formatDate(b.getReleaseDate(), "yyyy-MM-dd HH:mm");
                b.setReleaseDateStr(formatDate);
            }
        }
        result.put("blogList",blogList);
        ResponseUtil.write(response,result);
    }


    @RequestMapping("tag/{tagName}")
    public ModelAndView tag(@PathVariable("tagName")String tagName){
        ModelAndView mav = new ModelAndView();
        BlogExample blogExample = new BlogExample();
        BlogExample.Criteria criteria = blogExample.createCriteria();
        criteria.andKeywordsLike(StringUtil.formatLike(tagName));
        List<Blog> blogList = blogService.selectByExample(blogExample);
        if(blogList.size() > 0){
            mav.addObject("count", blogList.size());
        }
        mav.addObject("tagName", tagName);
        mav.setViewName("front/tag");
        return mav;
    }

    @RequestMapping("tagPage/{tagName}")
    public void tagPage(@PathVariable("tagName")String tagName,Integer page, Integer limit, HttpServletResponse response) throws Exception{
        JSONObject result = new JSONObject();
        BlogExample blogExample = new BlogExample();
        blogExample.setOrderByClause("release_date DESC");
        BlogExample.Criteria criteria = blogExample.createCriteria();
        criteria.andKeywordsLike(StringUtil.formatLike(tagName));
        PageHelper.startPage(page, limit);
        List<Blog> blogList = blogService.selectByExample(blogExample);
        if(blogList.size() > 0){
            for(Blog b : blogList){
                String formatDate = DateUtil.formatDate(b.getReleaseDate(), "yyyy-MM-dd HH:mm");
                b.setReleaseDateStr(formatDate);
            }
        }
        result.put("blogList", blogList);
        ResponseUtil.write(response,result);
    }

    @RequestMapping("time")
    public ModelAndView time() {
        ModelAndView mav = new ModelAndView();
        List<Blog> blogList = blogService.selectByExample(new BlogExample());
        mav.addObject("count",blogList.size());
        mav.setViewName("front/time");
        return mav;
    }


    @RequestMapping("timePage")
    public void timePage(Integer page, Integer limit, HttpServletResponse response) throws Exception {
        JSONObject result = new JSONObject();
        BlogExample blogExample = new BlogExample();
        blogExample.setOrderByClause("release_date DESC");
        PageHelper.startPage(page,limit);
        List<Blog> blogList = blogService.selectByExample(blogExample);
        if(blogList.size() > 0){
            for(Blog b : blogList){
                String formatDate = DateUtil.formatDate(b.getReleaseDate(), "yyyy-MM-dd");
                b.setReleaseDateStr(formatDate);
            }
        }
        result.put("blogList",blogList);
        ResponseUtil.write(response,result);
    }

}
