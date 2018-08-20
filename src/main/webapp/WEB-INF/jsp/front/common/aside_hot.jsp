<%--
  Created by IntelliJ IDEA.
  User: 可圈可丶
  Date: 2018/8/17
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div>
    <h2 data-scroll-reveal="enter bottom over 1s" class="hometitle">
        <i class="layui-icon layui-icon-fire" style="margin-right: 5px;"></i>本月最热
    </h2>
    <ul class="tjpic" data-scroll-reveal="enter bottom over 1s">
        <i><a href="${path}/blog/${hotList[0].id}">
            <img src="${path}/${hotList[0].cover}"></a>
        </i>
        <p><a href="${path}/blog/${hotList[0].id}">${hotList[0].title}</a></p>
    </ul>
    <ul class="sidenews" style="display: block">
        <c:forEach var="blog" items="${hotList}" begin="1" varStatus="status">
            <li data-scroll-reveal="enter bottom over 1s" class="sequenced">
                <i><a href="${path}/blog/${blog.id}">
                    <img src="${path}/${blog.cover}"></a>
                </i>
                <p><a href="${path}/blog/${blog.id}">${blog.title}</a></p>
                <span style="margin: 10px 0 0 30px; font-size: 13px;">${blog.hotNum}热力值</span>
            </li>
        </c:forEach>
    </ul>
</div>
