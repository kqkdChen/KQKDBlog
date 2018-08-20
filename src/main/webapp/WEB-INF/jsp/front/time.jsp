<%--
  Created by IntelliJ IDEA.
  User: 可圈可丶
  Date: 2018/8/20
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>
<head>
    <jsp:include page="common/head.jsp"/>
    <script src="${path}/static/js/hide.js"></script>
    <link href="${path}/static/layui/css/layui.css" rel="stylesheet">
</head>
<body>
<jsp:include page="common/nav.jsp"/>
<div class="pagebg">
    <img src="${path}/static/images/time.jpg" alt="时间轴" >
</div>
<div class="container">
    <h1 class="t_nav"><span>时光飞逝，机会就在我们眼前，何时找到了灵感，就要把握机遇，我们需要智慧和勇气去把握机会。</span><a href="" class="n1">网站首页</a><a href="" class="n2">时间轴</a></h1>
    <div class="timebox">
        <ul id="time">
            <li><span>2018-07-15</span><a href="" target="_blank">某一人似曾相识、某一刻似曾经历</a></li>
        </ul>
    </div>
    <div class="pagelist" id="layPage"></div>
</div>
<jsp:include page="common/footer.jsp"/>
<input type="hidden" value="${path}" id="url"/>
<input type="hidden" value="${count}" id="count"/>
<script src="${path}/static/layui/layui.js"></script>
<script src="${path}/static/js/time.js"></script>
</body>
</html>