<%--
  Created by IntelliJ IDEA.
  User: 可圈可丶
  Date: 2018/8/18
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<div class="pagebg">
    <img src="">
</div>
<div class="container">
    <h1 class="t_nav"><span>不要轻易放弃。学习成长的路上，我们长路漫漫，只因学无止境。</span><a href="${path}/index" class="n1">网站首页</a><a href="${path}/blog" class="n2">轻博客</a></h1>
    <main>
        <div class="blogsbox">
        </div>
        <div class="pagelist" id="layPage"></div>
    </main>
    <aside class="sidebar">
        <jsp:include page="common/aside_hot.jsp"/>
        <jsp:include page="common/aside_blogType.jsp"/>
        <jsp:include page="common/aside_tag.jsp"/>
        <jsp:include page="common/aside_link.jsp"/>
        <jsp:include page="common/aside_followMe.jsp"/>
    </aside>
</div>
<input type="hidden" value="${path}" id="url"/>
<input type="hidden" value="${count}" id="count"/>
<input type="hidden" value="${id}" id="id"/>
<jsp:include page="common/footer.jsp"/>
<script src="${path}/static/layui/layui.js"></script>
<script src="${path}/static/js/cate.js"></script>
</body>
</html>

