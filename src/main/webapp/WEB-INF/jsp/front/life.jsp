<%--
  Created by IntelliJ IDEA.
  User: 可圈可丶
  Date: 2018/8/19
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
    <jsp:include page="common/head.jsp"/>
    <script src="${path}/static/js/scrollreveal.min.js"></script>
    <script src="${path}/static/js/animateInit.js"></script>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/shadow.css">
    <link rel="stylesheet" type="text/css" href="${path}/static/layui/css/layui.css">
    <style>
       /* #life { perspective: 800px; }*/
    </style>
</head>
<body>
<jsp:include page="common/nav.jsp"/>
<div class="pagebg">
    <img src="${path}/static/images/blank.jpg" alt="图片展示" >
</div>
<div class="container">
    <h1 class="t_nav"><span>我现在不想听他娘的什么狗屁爱情故事，我现在就想搞钱，光羡慕人家有什么用？我们要行动起来，要变的比他们更有钱！</span><a href="${path}/index" class="n1">网站首页</a><a href="${path}/life" class="n2">慢生活</a></h1>
    <div class="share">
        <ul id="life">
            <c:forEach var="blog" items="${blogList}">
                <li class="anim" data-scroll-reveal="enter bottom over 1s"> <div class="shareli"><a href="${path}/blog/${blog.id}" target="_blank">
                    <i><img src="${path}/${blog.cover}"></i>
                    <h2><b>${blog.title}</b></h2>
                    <span>喜欢 | ${blog.likeNum}</span></a></div>
                </li>
            </c:forEach>
        </ul>
        <div id="layPage" class="pagelist"></div>
    </div>
</div>
<input type="hidden" value="${path}" id="url"/>
<input type="hidden" value="${count}" id="count"/>
<input type="hidden" value="${firstLimit}" id="firstLimit"/>
<jsp:include page="common/footer.jsp"/>
<script src="${path}/static/layui/layui.js"></script>
<script src="${path}/static/js/lifeFlow.js"></script>
<script>
  sr.reveal('#life', { container: '.share', duration:1500, rotate: {x: 180} });
</script>
</body>
</html>
