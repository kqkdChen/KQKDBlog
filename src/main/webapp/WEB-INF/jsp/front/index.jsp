<%--
  Created by IntelliJ IDEA.
  User: 可圈可丶
  Date: 2018/7/27
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
    <meta charset="gbk">
    <title>可圈可点分享站</title>
    <meta name="keywords" content="个人博客,可圈可点个人博客,软件,可圈可点" />
    <meta name="description" content="可圈可点个人博客，Java后台程序员网站，原创吐槽已经定时分享一些精品软件。" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/static/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/m.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/scrollreveal.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/animateInit.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/scrollReveal.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.easyfader.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/common.js"></script>
    <style>
        .toppic { perspective: 800px; }
    </style>
</head>
<body>
<header class="header-navigation" id="header">
    <nav>
        <div class="logo"><a href="${pageContext.request.contextPath}/index">可圈可点个人博客</a></div>
        <h2 id="mnavh"><span class="navicon"></span></h2>
        <ul id="starlist">
            <li><a href="${pageContext.request.contextPath}/index"><i class="layui-icon layui-icon-home"></i>&nbsp;首页</a></li>
            <li><a href="${pageContext.request.contextPath}/articles/1">轻博客</a></li>
            <li><a href="${pageContext.request.contextPath}/articles/2">慢生活</a></li>
            <li><a href="time.html">精品软件</a></li>
            <li class="menu"><a href="about.html">关于我们</a>
                <ul class="sub">
                    <li><a href="#">关于博主</a></li>
                    <li><a href="#">关于本站</a></li>
                </ul>
            </li>
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
<article>
    <!--banner begin-->
    <div class="picsbox">
        <div class="banner">
            <div id="banner" class="fader">
                <c:forEach var="blog" items="${topList}">
                    <li class="slide" ><a href="${pageContext.request.contextPath}/article/${blog.id}" target="_blank">
                        <img src="${pageContext.request.contextPath}/${blog.cover}">
                        <span class="imginfo">${blog.title}</span>
                    </a></li>
                </c:forEach>
                <div class="fader_controls">
                    <div class="page prev" data-target="prev">&lsaquo;</div>
                    <div class="page next" data-target="next">&rsaquo;</div>
                    <ul class="pager_list">
                    </ul>
                </div>
            </div>
        </div>
        <!--banner end-->
        <div class="toppic">
            <li class="top"> <a href="/" target="_blank"> <i><img src="${pageContext.request.contextPath}/static/images/toppic01.jpg"></i>
                <h2>别让这些闹心的套路，毁了你的网页设计!</h2>
                <span>学无止境</span> </a> </li>
            <li class="top"> <a href="/" target="_blank"> <i><img src="${pageContext.request.contextPath}/static/images/zd01.jpg"></i>
                <h2>个人博客，属于我的小世界！</h2>
                <span>学无止境</span> </a> </li>
        </div>
    </div>
    <div class="blank"></div>
    <!--blogsbox begin-->
    <div class="blogsbox" id="blogList">
        <input type="hidden" id="URL" value="${pageContext.request.contextPath}"/>
    </div>
    <!--blogsbox end-->
    <jsp:include page="common/aside.jsp"/>
</article>
<jsp:include page="common/footer.jsp"/>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/index.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/myAnimate.js"></script>
</body>
</html>

