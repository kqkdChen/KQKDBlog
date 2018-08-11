<%--
  Created by IntelliJ IDEA.
  User: 可圈可丶
  Date: 2018/7/30
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="sidebar">
    <div class="tuijian">
        <h2 data-scroll-reveal="enter bottom over 1s" class="hometitle">
            <i class="layui-icon layui-icon-fire" style="margin-right: 5px;"></i>本周最热
        </h2>
        <ul class="tjpic" data-scroll-reveal="enter bottom over 1s">
            <i><a href="${pageContext.request.contextPath}/article/${hotList[0].id}">
                <img src="${pageContext.request.contextPath}/${hotList[0].cover}"></a>
            </i>
            <p><a href="${pageContext.request.contextPath}/article/${hotList[0].id}">${hotList[0].title}</a></p>
        </ul>
        <ul class="sidenews" style="display: block">
            <c:forEach var="blog" items="${hotList}" begin="1" varStatus="status">
                <li data-scroll-reveal="enter bottom over 1s" class="sequenced">
                    <i><a href="${pageContext.request.contextPath}/article/${blog.id}">
                        <img src="${pageContext.request.contextPath}/${blog.cover}"></a>
                    </i>
                    <p><a href="${pageContext.request.contextPath}/article/${blog.id}">${blog.title}</a></p>
                    <span style="margin: 10px 0 0 30px; font-size: 13px;">${blog.hotNum}热力值</span>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div class="tuijian">
        <h2 data-scroll-reveal="enter bottom over 1s" class="hometitle">
            <i class="layui-icon layui-icon-release" style="margin-right: 5px;"></i>分类导航
        </h2>
        <ul class="sidenews">
            <c:forEach var="blogType" items="${blogTypeList}">
                <p class="sequenced"><li style="text-align: center" data-scroll-reveal="enter bottom over 1s">
                <a style="margin: 0 auto;" href="${pageContext.request.contextPath}/cate/${blogType.id}">
                        ${blogType.name}(${blogType.total}篇)</a></li></p>
                <hr style="margin: 12px 0;">
            </c:forEach>
        </ul>
    </div>
    <div class="cloud">
        <h2 class="hometitle" data-scroll-reveal="enter bottom over 1s">
            <i class="layui-icon layui-icon-note" style="font-size: 14px; margin-right: 4px;"></i>标签云团
        </h2>
        <ul>
            <%--<a href="/">陌上花开</a> <a href="/">校园生活</a> <a href="/">html5</a> <a href="/">SumSung</a> <a href="/">青春</a> <a href="/">温暖</a> <a href="/">阳光</a> <a href="/">三星</a><a href="/">索尼</a> <a href="/">华维荣耀</a> <a href="/">三星</a> <a href="/">索尼</a>--%>
            <c:forEach items="${keywordsList}" var="keyword" varStatus="status">
                <c:if test="${status.index%2==0}">
                    <a data-scroll-reveal="enter top over 1s" class="sequenced" href="${pageContext.request.contextPath}/tag/${keyword}">${keyword}</a>
                </c:if>
                <c:if test="${status.index%2!=0}">
                    <a data-scroll-reveal="enter bottom over 1s" class="sequenced" href="${pageContext.request.contextPath}/tag/${keyword}">${keyword}</a>
                </c:if>
            </c:forEach>
        </ul>
    </div>
    <div class="links">
        <h2 class="hometitle" data-scroll-reveal="enter bottom over 1s">
            <i class="layui-icon layui-icon-link" style="font-size: 14px; margin-right: 4px;"></i>友情链接
        </h2>
        <ul>
            <c:forEach items="${linkList}" var="link" varStatus="status">
                <c:if test="${status.index%2==0}">
                    <li data-scroll-reveal="enter top over 1s"><a class="sequenced" href="${link.url}" target="_blank">${link.name}</a></li>
                </c:if>
                <c:if test="${status.index%2!=0}">
                    <li data-scroll-reveal="enter bottom over 1s"><a class="sequenced" href="${link.url}" target="_blank">${link.name}</a></li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
    <div class="guanzhu" id="follow-us">
        <h2 class="hometitle" data-scroll-reveal="enter bottom over 1s">
            <i class="layui-icon layui-icon-add-1" style="margin-right: 4px;"></i>欢迎关注
        </h2>
        <ul>
            <li data-scroll-reveal="enter right over 1s" class="sina"><a href="https://weibo.com/u/3372790652" target="_blank"><span>新浪微博</span>漓丶陳</a></li>
            <li data-scroll-reveal="enter left over 1s" class="qq"><a href="/" target="_blank"><span>QQ号</span>657424056</a></li>
            <li data-scroll-reveal="enter right over 1s" class="email"><a href="/" target="_blank"><span>邮箱帐号</span>657424056@qq.com</a></li>
            <li data-scroll-reveal="enter left over 1s" class="wxgzh"><a href="/" target="_blank"><span>微信号</span>coolchen_programmer</a></li>
            <li data-scroll-reveal="enter right over 1s" class="wx"><img src="${pageContext.request.contextPath}/static/images/wx.jpg"></li>
        </ul>
    </div>
</div>