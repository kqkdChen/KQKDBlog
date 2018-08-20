<%--
  Created by IntelliJ IDEA.
  User: 可圈可丶
  Date: 2018/8/17
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>
<head>
    <jsp:include page="common/head.jsp"/>
    <link href="${path}/static/layui/css/layui.css" rel="stylesheet">
    <script src="${path}/static/js/hide.js"></script>
</head>
<body>
<jsp:include page="common/nav.jsp"/>
<article>
    <main>
        <div class="banner">
            <div id="banner" class="fader">
                <c:forEach var="blog" end="3" items="${topList}">
                    <li class="slide" ><a href="${pageContext.request.contextPath}/blog/${blog.id}" target="_blank">
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
        <div class="blank"></div>
        <div class="blogsbox">
        </div>
    </main>
    <!--blogsbox end-->
    <aside class="sidebar">
        <div class="toppic">
            <li><a href="${path}" title="安静地做一个爱设计的女子" target="_blank"><i><img src="${path}"></i>
                <h2>安静地做一个爱设计的女子</h2>
                <span>慢生活</span> </a> </li>
            <li><a href="${path}" title="个人博客，属于我的小世界！" target="_blank"><i><img src="${path}"></i>
                <h2>个人博客，属于我的小世界！</h2>
                <span>慢生活</span> </a> </li>
        </div>
        <div class="zhuanti">
            <h2 class="hometitle">特别推荐</h2>
            <c:forEach var="blog" begin="4" items="${topList}">
            <ul>
                <li> <i><img src="${path}/${blog.cover}"></i>
                    <p>${blog.title}<span><a href="${path}/blog/${blog.id}" title="${blog.title}" target="_blank">${blog.blogType.name}</a></span> </p>
                </li>
            </ul>
            </c:forEach>
        </div>
        <jsp:include page="common/aside_hot.jsp"/>
        <jsp:include page="common/aside_blogType.jsp"/>
        <jsp:include page="common/aside_tag.jsp"/>
        <jsp:include page="common/aside_link.jsp"/>
        <jsp:include page="common/aside_followMe.jsp"/>
    </aside>
</article>
<input type="hidden" value="${path}" id="URL"/>
<jsp:include page="common/footer.jsp"/>
<script src="${path}/static/layui/layui.js"></script>
<script src="${path}/static/js/index.js"></script>
</body>
</html>

