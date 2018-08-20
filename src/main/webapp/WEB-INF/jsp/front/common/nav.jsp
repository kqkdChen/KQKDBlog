<%--
  Created by IntelliJ IDEA.
  User: 可圈可丶
  Date: 2018/8/17
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<header class="header-navigation" id="header">
    <nav>
        <div class="logo"><a href="${path}/index">可圈可点博客</a></div>
        <h2 id="mnavh"><span class="navicon"></span></h2>
        <ul id="starlist">
            <li><a href="${path}/index">网站首页</a></li>
            <li><a href="${path}/blog">轻博客</a></li>
            <li><a href="${path}/life">慢生活</a></li>
            <li><a href="${path}/down">资源下载</a></li>
            <li><a href="${path}/time">时间轴</a></li>
            <li><a href="${path}/about">关于</a></li>
            <li><a href="${path}/talk">留言</a></li>
        </ul>
        <div class="searchbox">
            <div id="search_bar" class="search_bar">
                <form id="searchform" action="${path}/" method="post" name="searchform">
                    <input class="input" placeholder="想搜点什么呢.." type="text" name="keyboard" id="keyboard">
                    <input type="hidden" name="show" value="title">
                    <input type="hidden" name="tempid" value="1">
                    <input type="hidden" name="tbname" value="news">
                    <input type="hidden" name="Submit" value="搜索">
                    <p class="search_ico"> <span></span></p>
                </form>
            </div>
        </div>
    </nav>
    <hr style="height: 2px; margin: 0;">
</header>
