package com.kqkd.controller;

import com.github.pagehelper.PageHelper;
import com.kqkd.pojo.Blog;
import com.kqkd.pojo.BlogExample;
import com.kqkd.pojo.BlogType;
import com.kqkd.service.BlogService;
import com.kqkd.service.BlogTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/blog")
public class BlogController {

    @Resource
    private BlogService blogService;

    @Resource
    private BlogTypeService blogTypeService;

    /**
     * 博客详情
     * @param id
     * @return mav
     */
    @RequestMapping("/articles/{id}")
    public ModelAndView info(@PathVariable("id") Integer id){
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
        PageHelper.offsetPage(0,1);
        //上一篇
        List<Blog> previous = blogService.selectByExample(blogExample);
        //下一篇
        List<Blog> next = blogService.selectByExample(blogExample2);
        if(previous.size() > 0){
            mav.addObject("previous",previous.get(0));
        }
        if(next.size() > 0){
            mav.addObject("next",next.get(0));
        }
        mav.addObject("blog",blog);
        mav.setViewName("info");
        return mav;
    }

    /**
     * 博客类别集合
     * @param id
     * @return mav
     */
    @RequestMapping("/cate/{id}")
    public ModelAndView cate(@PathVariable("id") Integer id){
        ModelAndView mav = new ModelAndView();
        BlogType blogType = blogTypeService.selectByPrimaryKey(id);
        BlogExample blogExample = new BlogExample();
        BlogExample.Criteria criteria = blogExample.createCriteria();
        criteria.andTypeIdEqualTo(id);
        List<Blog> blogList = blogService.selectByExample(blogExample);
        mav.addObject("blogList",blogList);
        mav.addObject("blogType",blogType);
        mav.setViewName("cate");
        return mav;
    }

}
