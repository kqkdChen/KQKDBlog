<%--
  Created by IntelliJ IDEA.
  User: 可圈可丶
  Date: 2018/8/17
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<div class="tuijian">
    <h2 data-scroll-reveal="enter bottom over 1s" class="hometitle">
        <i class="layui-icon layui-icon-release" style="margin-right: 5px;"></i>分类导航
    </h2>
    <ul class="sidenews">
        <c:forEach var="blogType" items="${blogTypeList}">
            <p class="sequenced"><li style="text-align: center" data-scroll-reveal="enter bottom over 1s">
            <a style="margin: 0 auto;" href="${path}/cate/${blogType.id}">
                    ${blogType.name}(${blogType.total}篇)</a></li></p>
            <hr style="margin: 12px 0;">
        </c:forEach>
    </ul>
</div>
