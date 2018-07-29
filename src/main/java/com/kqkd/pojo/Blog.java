package com.kqkd.pojo;

import java.util.Date;
import java.util.List;

public class Blog {
    private Integer id;

    private Integer bloggerId;

    private Integer typeId;

    private Date releaseDate;

    private String title;

    private String summary;

    private String cover;

    private Integer checkNum;

    private Integer commentNum;

    private Integer likeNum;

    private String keywords;

    private Integer top;

    private Integer blogIs;

    private String content;

    private BlogType blogType;

    private Blogger blogger;

    /**非博客实体属性*/
    private List<String> coverStrList; //封面集合

    public List<String> getCoverStrList() {
        return coverStrList;
    }

    public void setCoverStrList(List<String> coverStrList) {
        this.coverStrList = coverStrList;
    }

    public Blogger getBlogger() {
        return blogger;
    }

    public void setBlogger(Blogger blogger) {
        this.blogger = blogger;
    }

    public BlogType getBlogType() {
        return blogType;
    }

    public void setBlogType(BlogType blogType) {
        this.blogType = blogType;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBloggerId() {
        return bloggerId;
    }

    public void setBloggerId(Integer bloggerId) {
        this.bloggerId = bloggerId;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary == null ? null : summary.trim();
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover == null ? null : cover.trim();
    }

    public Integer getCheckNum() {
        return checkNum;
    }

    public void setCheckNum(Integer checkNum) {
        this.checkNum = checkNum;
    }

    public Integer getCommentNum() {
        return commentNum;
    }

    public void setCommentNum(Integer commentNum) {
        this.commentNum = commentNum;
    }

    public Integer getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(Integer likeNum) {
        this.likeNum = likeNum;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords == null ? null : keywords.trim();
    }

    public Integer getTop() {
        return top;
    }

    public void setTop(Integer top) {
        this.top = top;
    }

    public Integer getBlogIs() {
        return blogIs;
    }

    public void setBlogIs(Integer blogIs) {
        this.blogIs = blogIs;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}