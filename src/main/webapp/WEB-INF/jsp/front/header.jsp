<%--
  Created by IntelliJ IDEA.
  User: 可圈可丶
  Date: 2018/7/26
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="header-navigation" id="header">
    <nav>
        <div class="logo"><a href="${pageContext.request.contextPath }/index">杨青个人博客</a></div>
        <h2 id="mnavh"><span class="navicon"></span></h2>
        <ul id="starlist">
            <li><a href="index.html">网站首页</a></li>
            <li><a href="about.html">关于我</a></li>
            <li><a href="share.html">模板分享</a></li>
            <li><a href="list.html">博客日记</a></li>
            <li class="menu"><a href="fengmian.html">学无止境</a>
                <ul class="sub">
                    <li><a href="#">慢生活</a></li>
                    <li><a href="#">美文欣赏</a></li>
                </ul>
            </li>
            <li><a href="time.html">时间轴</a></li>
        </ul>
        <div class="searchbox">
            <div id="search_bar" class="search_bar">
                <form  id="searchform" action="[!--news.url--]e/search/index.php" method="post" name="searchform">
                    <input class="input" placeholder="想搜点什么呢.." type="text" name="keyboard" id="keyboard">
                    <input type="hidden" name="show" value="title" />
                    <input type="hidden" name="tempid" value="1" />
                    <input type="hidden" name="tbname" value="news">
                    <input type="hidden" name="Submit" value="搜索" />
                    <p class="search_ico"> <span></span></p>
                </form>
            </div>
        </div>
    </nav>
</header>
