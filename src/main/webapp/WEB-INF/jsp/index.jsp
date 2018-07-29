<%--
  Created by IntelliJ IDEA.
  User: ��Ȧ��ؼ
  Date: 2018/7/27
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="gb2312"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
    <meta charset="gbk">
    <title>��ҳ_������˲��� - һ��վ��webǰ�����֮·��Ů����Ա���˲�����վ</title>
    <meta name="keywords" content="���˲���,������˲���,���˲���ģ��,����" />
    <meta name="description" content="������˲��ͣ���һ��վ��webǰ�����֮·��Ů����Ա������վ���ṩ���˲���ģ�������Դ���صĸ���ԭ����վ��" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/static/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/m.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.easyfader.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/scrollReveal.js"></script>
</head>
<body>
<header class="header-navigation" id="header">
    <nav>
        <div class="logo"><a href="http://www.yangqq.com">������˲���</a></div>
        <h2 id="mnavh"><span class="navicon"></span></h2>
        <ul id="starlist">
            <li><a href="index.html"><i class="layui-icon layui-icon-home"></i>&nbsp;��ҳ</a></li>
            <li><a href="share.html">�Ჩ��</a></li>
            <li><a href="list.html">������</a></li>
            <li><a href="time.html">��Ʒ���</a></li>
            <li class="menu"><a href="about.html">��������</a>
                <ul class="sub">
                    <li><a href="#">���ڲ���</a></li>
                    <li><a href="#">���ڱ�վ</a></li>
                </ul>
            </li>
        </ul>
        <div class="searchbox">
            <div id="search_bar" class="search_bar">
                <form  id="searchform" action="[!--news.url--]e/search/index.php" method="post" name="searchform">
                    <input class="input" placeholder="���ѵ�ʲô��.." type="text" name="keyboard" id="keyboard">
                    <input type="hidden" name="show" value="title" />
                    <input type="hidden" name="tempid" value="1" />
                    <input type="hidden" name="tbname" value="news">
                    <input type="hidden" name="Submit" value="����" />
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
                    <li class="slide" ><a href="${pageContext.request.contextPath}/blog/article/${blog.id}" target="_blank">
                        <img src="${pageContext.request.contextPath}/static/images/banner01.jpg">
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
            <li> <a href="/" target="_blank"> <i><img src="${pageContext.request.contextPath}/static/images/toppic01.jpg"></i>
                <h2>������Щ���ĵ���·�����������ҳ���!</h2>
                <span>ѧ��ֹ��</span> </a> </li>
            <li> <a href="/" target="_blank"> <i><img src="${pageContext.request.contextPath}/static/images/zd01.jpg"></i>
                <h2>���˲��ͣ������ҵ�С���磡</h2>
                <span>ѧ��ֹ��</span> </a> </li>
        </div>
    </div>
    <div class="blank"></div>
    <!--blogsbox begin-->
    <div class="blogsbox">
        <c:forEach var="blog" items="${blogList}">
            <div class="blogs" data-scroll-reveal="enter bottom over 1s" >
                <h3 class="blogtitle"><a href="${pageContext.request.contextPath}/blog/article/${blog.id}" target="_blank">${blog.title}</a></h3>
                <c:choose>
                    <c:when test="${blog.coverStrList.size()>1}">
                        <span class="bplist"><a href="${pageContext.request.contextPath}/blog/article/${blog.id}" title="�������">
                        <c:forEach var="img" items="${blog.coverStrList}">
                            <li><img src="${pageContext.request.contextPath}/static/images/avatar.jpg" alt=""></li>
                        </c:forEach>
                        </a></span>
                    </c:when>
                    <c:otherwise>
                        <span class="blogpic">
                            <a href="${pageContext.request.contextPath}/blog/article/${blog.id}" title="">
                            <img src="${pageContext.request.contextPath}/static/images/toppic01.jpg" alt=""></a>
                        </span>
                    </c:otherwise>
                </c:choose>
                <p class="blogtext">${blog.summary}</p>
                <div class="bloginfo">
                    <ul>
                        <li class="author"><a href="/">${blog.blogger.nickName}</a></li>
                        <li class="lmname"><a href="/">${blog.blogType.name}</a></li>
                        <li class="timer"><fmt:formatDate value="${blog.releaseDate}" type="date" pattern="yyyy-MM-dd HH:mm"/> </li>
                        <li class="view"><span>${blog.checkNum}</span></li>
                        <li class="like">${blog.likeNum}</li>
                    </ul>
                </div>
            </div>
        </c:forEach>
    </div>
    <!--blogsbox end-->
    <div class="sidebar">
        <div class="tuijian">
            <h2 id="tab" class="hometitle"><a href="javascript:(0);">�������&nbsp;&nbsp;</a><a style="margin: 0 10px;" href="javascript:(0);">��������&nbsp;&nbsp;</a><a href="javascript:(0);">���ͷ���&nbsp;&nbsp;</a></h2>
            <div id="content">
                <ul class="sidenews" style="display: block">
                    <c:forEach var="blog" items="${checkNumList}">
                        <li><i><img src="${pageContext.request.contextPath}/static/images/toppic01.jpg"></i>
                            <p><a href="${pageContext.request.contextPath}/blog/article/${blog.id}">${blog.title}</a></p>
                            <span>${blog.checkNum}�β鿴</span> </li>
                    </c:forEach>
                </ul>
                <ul class="sidenews">
                    <c:forEach var="blog" items="${likeNumList}">
                        <li><i><img src="${pageContext.request.contextPath}/static/images/toppic01.jpg"></i>
                            <p><a href="${pageContext.request.contextPath}/blog/article/${blog.id}">${blog.title}</a></p>
                            <span>${blog.likeNum}�ε���</span></li>
                    </c:forEach>
                </ul>
                <ul class="sidenews">
                    <c:forEach var="blogType" items="${blogTypeList}">
                       <p><li style="text-align: center">
                       <a style="margin: 0 auto;" href="${pageContext.request.contextPath}/blog/cate/${blogType.id}">
                       ${blogType.name}(${blogType.total}ƪ)</a></li></p>
                        <hr style="margin: 12px 0;">
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="cloud">
            <h2 class="hometitle">��ǩ��</h2>
            <ul>
                <a href="/">İ�ϻ���</a> <a href="/">У԰����</a> <a href="/">html5</a> <a href="/">SumSung</a> <a href="/">�ഺ</a> <a href="/">��ů</a> <a href="/">����</a> <a href="/">����</a><a href="/">����</a> <a href="/">��ά��ҫ</a> <a href="/">����</a> <a href="/">����</a>
            </ul>
        </div>
        <div class="links">
            <h2 class="hometitle">��������</h2>
            <ul>
                <c:forEach items="${linkList}" var="link">
                    <li><a href="${link.url}" target="_blank">${link.name}</a></li>
                </c:forEach>
            </ul>
        </div>
        <div class="guanzhu" id="follow-us">
            <h2 class="hometitle">��ע�� ôô�գ�</h2>
            <ul>
                <li class="sina"><a href="/" target="_blank"><span>����΢��</span>��ؼ��</a></li>
                <li class="qq"><a href="/" target="_blank"><span>QQ��</span>657424056</a></li>
                <li class="email"><a href="/" target="_blank"><span>�����ʺ�</span>657424056@qq.com</a></li>
                <li class="wxgzh"><a href="/" target="_blank"><span>΢�ź�</span>coolchen_programmer</a></li>
                <li class="wx"><img src="${pageContext.request.contextPath}/static/images/wx.jpg"></li>
            </ul>
        </div>
    </div>
</article>
<footer>
    <p>Design by <a href="http://www.yangqq.com" target="_blank">������˲���</a> <a href="/">��ICP��11002373��-1</a></p>
</footer>
<a href="#" class="cd-top">Top</a>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
</body>
</html>

