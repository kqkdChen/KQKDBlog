<%--
  Created by IntelliJ IDEA.
  User: 可圈可丶
  Date: 2018/7/30
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="cloud">
    <h2 class="hometitle"><i class="layui-icon layui-icon-note" style="font-size: 14px;"></i>&nbsp;标签云</h2>
    <ul>
        <%--<a href="/">陌上花开</a> <a href="/">校园生活</a> <a href="/">html5</a> <a href="/">SumSung</a> <a href="/">青春</a> <a href="/">温暖</a> <a href="/">阳光</a> <a href="/">三星</a><a href="/">索尼</a> <a href="/">华维荣耀</a> <a href="/">三星</a> <a href="/">索尼</a>--%>
        <c:forEach items="${keywordsList}" var="keyword">
            <a href="${pageContext.request.contextPath}/blog/tag/${keyword}">${keyword}</a>
        </c:forEach>
    </ul>
</div>
<div class="links">
    <h2 class="hometitle"><i class="layui-icon layui-icon-link" style="font-size: 14px;"></i>&nbsp;友情链接</h2>
    <ul>
        <c:forEach items="${linkList}" var="link">
            <li><a href="${link.url}" target="_blank">${link.name}</a></li>
        </c:forEach>
    </ul>
</div>
<div class="guanzhu" id="follow-us">
    <h2 class="hometitle">关注我 么么哒！</h2>
    <ul>
        <li class="sina"><a href="https://weibo.com/u/3372790652" target="_blank"><span>新浪微博</span>漓丶陳</a></li>
        <li class="qq"><a href="/" target="_blank"><span>QQ号</span>657424056</a></li>
        <li class="email"><a href="/" target="_blank"><span>邮箱帐号</span>657424056@qq.com</a></li>
        <li class="wxgzh"><a href="/" target="_blank"><span>微信号</span>coolchen_programmer</a></li>
        <li class="wx"><img src="${pageContext.request.contextPath}/static/images/wx.jpg"></li>
    </ul>
</div>
