package com.kqkd.pojo;

public class Blogger {
    private Integer id;

    private String phoneNum;

    private String email;

    private String nickName;

    private String password;

    private Integer sex;

    private String trueName;

    private String introduction;

    private String headImg;

    private String ip;

    private Integer identifyLabel;

    private Integer bloggerIs;

    private String basicInfo;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum == null ? null : phoneNum.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName == null ? null : nickName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName == null ? null : trueName.trim();
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    public String getHeadImg() {
        return headImg;
    }

    public void setHeadImg(String headImg) {
        this.headImg = headImg == null ? null : headImg.trim();
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public Integer getIdentifyLabel() {
        return identifyLabel;
    }

    public void setIdentifyLabel(Integer identifyLabel) {
        this.identifyLabel = identifyLabel;
    }

    public Integer getBloggerIs() {
        return bloggerIs;
    }

    public void setBloggerIs(Integer bloggerIs) {
        this.bloggerIs = bloggerIs;
    }

    public String getBasicInfo() {
        return basicInfo;
    }

    public void setBasicInfo(String basicInfo) {
        this.basicInfo = basicInfo == null ? null : basicInfo.trim();
    }
}