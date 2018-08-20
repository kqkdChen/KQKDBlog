<%--
  Created by IntelliJ IDEA.
  User: 可圈可丶
  Date: 2018/8/17
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div class="links">
    <h2 class="hometitle" data-scroll-reveal="enter bottom over 1s">
        <i class="layui-icon layui-icon-link" style="font-size: 14px; margin-right: 4px;"></i>友情链接
    </h2>
    <ul>
        <c:forEach items="${linkList}" var="link" varStatus="status">
            <c:if test="${status.index % 2 == 0}">
                <li data-scroll-reveal="enter top over 1s"><a class="sequenced" href="${link.url}" target="_blank">${link.name}</a></li>
            </c:if>
            <c:if test="${status.index % 2 != 0}">
                <li data-scroll-reveal="enter bottom over 1s"><a class="sequenced" href="${link.url}" target="_blank">${link.name}</a></li>
            </c:if>
        </c:forEach>
    </ul>
</div>
