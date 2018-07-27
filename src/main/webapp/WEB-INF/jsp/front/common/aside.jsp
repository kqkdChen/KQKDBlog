<%--
  Created by IntelliJ IDEA.
  User: 可圈可丶
  Date: 2018/7/26
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<aside class="r_box" >
    <div class="fenlei">
        <h2>文章分类</h2>
        <ul style="text-align: center;font-size: 15px;">
            <c:forEach  var="blogType" items="${blogTypes}">
                <li><a href="${pageContext.request.contextPath}/blog/cate/${blogType.id}">${blogType.name}（${blogType.total}篇）</a></li>
                <hr class="layui-bg-gray" >
            </c:forEach>
        </ul>
    </div>
    <div class="tuijian">
        <h2 id="tab"><a href="javascript:void(0);"class="current">点击排行</a><a href="javascript:void(0);">本站公告</a><a href="javascript:void(0);">站长推荐</a></h2>
        <div id="content">
            <ul>
                <li><a href="/">你是什么人便会遇上什么人</a></li>
                <li><a href="/">帝国cms 列表页调用子栏目，没有则不显示栏目名称</a></li>
                <li><a href="/">第二届 优秀个人博客模板比赛参选活动</a></li>
                <li><a href="/">个人博客模板《绅士》后台管理</a></li>
                <li><a href="/">你是什么人便会遇上什么人</a></li>
                <li><a href="/">帝国cms 列表页调用子栏目，没有则不显示栏目名称</a></li>
                <li><a href="/">第二届 优秀个人博客模板比赛参选活动</a></li>
                <li><a href="/">黑色质感时间轴html5个人博客模板</a></li>
            </ul>
            <ul style="display:block;">
                <li><a href="/">第二届 优秀个人博客模板比赛参选活动</a></li>
                <li><a href="/">【活动作品】柠檬绿兔小白个人博客模板</a></li>
                <li><a href="/">帝国cms 列表页调用子栏目，没有则不显示栏目名称</a></li>
                <li><a href="/">2014年度优秀个人博客评选活动</a></li>
                <li><a href="/">你是什么人便会遇上什么人</a></li>
                <li><a href="/">帝国cms 列表页调用子栏目，没有则不显示栏目名称</a></li>
                <li><a href="/">第二届 优秀个人博客模板比赛参选活动</a></li>
                <li><a href="/">个人博客模板《绅士》后台管理</a></li>
            </ul>
            <ul>
                <li><a href="/">个人博客，我为什么要用帝国cms？</a></li>
                <li><a href="/">D设计师博客-一个热爱生活的设计师</a></li>
                <li><a href="/">东轩博客，我看到了你的坚持！</a></li>
                <li><a href="/">程序员创业，就得“豁得出去”！</a></li>
                <li><a href="/">张建华 一个90后年轻站长！我们是对手亦是朋友！</a></li>
                <li><a href="/">《奋斗电商》看知名微商如何做博客引流？</a></li>
                <li><a href="/">《寻之旅》一个关于旅游，游记的个人博客</a></li>
                <li><a href="/">【匆匆那些年】总结个人博客经历的这四年</a></li>
            </ul>
        </div>
    </div>
    <div class="guanzhu">
        <h2>关注我 么么哒</h2>
        <ul>
            <li><img src="${pageContext.request.contextPath }/static/images/wx.jpg"></li>
        </ul>
    </div>

</aside>
