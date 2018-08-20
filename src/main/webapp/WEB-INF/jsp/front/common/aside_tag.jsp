<%--
  Created by IntelliJ IDEA.
  User: 可圈可丶
  Date: 2018/8/17
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div class="cloud">
    <h2 class="hometitle" data-scroll-reveal="enter bottom over 1s">
        <i class="layui-icon layui-icon-note" style="font-size: 14px; margin-right: 4px;"></i>标签云团
    </h2>
    <ul>
        <c:forEach items="${tagList}" var="tag" varStatus="status">
            <c:if test="${status.index % 2 == 0}">
                <a data-scroll-reveal="enter top over 1s" class="sequenced" href="${path}/tag/${tag}">${tag}</a>
            </c:if>
            <c:if test="${status.index % 2 != 0}">
                <a data-scroll-reveal="enter bottom over 1s" class="sequenced" href="${path}/tag/${tag}">${tag}</a>
            </c:if>
        </c:forEach>
    </ul>
</div>