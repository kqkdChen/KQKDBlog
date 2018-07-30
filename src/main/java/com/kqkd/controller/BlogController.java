package com.kqkd.controller;

import com.github.pagehelper.PageHelper;
import com.kqkd.pojo.Blog;
import com.kqkd.pojo.BlogExample;
import com.kqkd.pojo.BlogType;
import com.kqkd.service.BlogService;
import com.kqkd.service.BlogTypeService;
import com.kqkd.util.ResponseUtil;
import net.sf.json.JSONObject;
import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;

@Controller
@RequestMapping("")
public class BlogController {

    @Resource
    private BlogService blogService;

    @Resource
    private BlogTypeService blogTypeService;

    @RequestMapping("/list")
    public void articles(@RequestParam(value = "page",required = false) Integer page,
                         @RequestParam(value = "limit",required = false) Integer limit,
                         @RequestParam(value = "size",required = false) Integer size,
                         HttpServletResponse response) throws Exception{
        Integer pages = null;
        JSONObject result=new JSONObject();
        BlogExample blogExample = new BlogExample();
        blogExample.setOrderByClause("release_date DESC");
        if(size % limit == 0){
            pages = size/limit;
        }else{
            pages = (size/limit)+1;
        }
        PageHelper.startPage(page,limit);
        List<Blog> blogList = blogService.selectByExample(blogExample);
        SimpleDateFormat simpleFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        for(Blog b : blogList){
            String releaseDateStr = simpleFormatter.format(b.getReleaseDate());
            b.setReleaseDateStr(releaseDateStr);
        }
        result.put("blogList", blogList);
        result.put("pages", pages);
        ResponseUtil.write(response,result);
    }

    @RequestMapping("/article/{id}")
    public ModelAndView info(@PathVariable(value = "id",required = false) Integer id){
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
        mav.setViewName("detail");
        return mav;
    }

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
