<%--
  Created by IntelliJ IDEA.
  User: 可圈可丶
  Date: 2018/8/18
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div class="guanzhu" id="follow-us">
    <h2 class="hometitle" data-scroll-reveal="enter bottom over 1s">
        <i class="layui-icon layui-icon-add-1" style="margin-right: 4px;"></i>欢迎关注
    </h2>
    <ul>
        <li data-scroll-reveal="enter right over 1s" class="sina"><a href="https://weibo.com/u/3372790652" target="_blank"><span>新浪微博</span>漓丶陳</a></li>
        <li data-scroll-reveal="enter left over 1s" class="qq"><a href="" target="_blank"><span>QQ号</span>657424056</a></li>
        <li data-scroll-reveal="enter right over 1s" class="email"><a href="" target="_blank"><span>邮箱帐号</span>657424056@qq.com</a></li>
        <li data-scroll-reveal="enter left over 1s" class="wxgzh"><a href="" target="_blank"><span>微信号</span>coolchen_programmer</a></li>
        <li data-scroll-reveal="enter right over 1s" class="wx"><img src="${path}/static/images/wx.jpg"></li>
    </ul>
</div>
