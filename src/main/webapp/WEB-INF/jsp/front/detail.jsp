<%--
  Created by IntelliJ IDEA.
  User: 可圈可丶
  Date: 2018/7/30
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
    <meta charset="gbk">
    <title>可圈可点分享站</title>
    <meta name="keywords" content="个人博客,可圈可点个人博客,软件,可圈可点" />
    <meta name="description" content="可圈可点个人博客，Java后台程序员网站，原创吐槽已经定时分享一些精品软件。" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/static/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/m.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/layui/css/layui.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.easyfader.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/scrollReveal.js"></script>
</head>
<body>
<header class="header-navigation" id="header">
    <nav>
        <div class="logo"><a href="${pageContext.request.contextPath}/index">可圈可点个人博客</a></div>
        <h2 id="mnavh"><span class="navicon"></span></h2>
        <ul id="starlist">
            <li><a href="${pageContext.request.contextPath}/index"><i class="layui-icon layui-icon-home"></i>&nbsp;首页</a></li>
            <li><a href="${pageContext.request.contextPath}/articles/1">轻博客</a></li>
            <li><a href="${pageContext.request.contextPath}/articles/2">慢生活</a></li>
            <li><a href="time.html">精品软件</a></li>
            <li class="menu"><a href="about.html">关于我们</a>
                <ul class="sub">
                    <li><a href="#">关于博主</a></li>
                    <li><a href="#">关于本站</a></li>
                </ul>
            </li>
        </ul>
        <div class="searchbox">
            <div id="search_bar" class="search_bar">
                <form  id="searchform" action="[!--news.url--]e/search/index.php" method="post" name="searchform">
                    <input class="input" placeholder="想搜点什么呢.." type="text" name="keyboard" id="keyboard">
                    <input type="hidden" name="show" value="title" />
                    <input type="hidden" name="tempid" value="1" />
                    <input type="hidden" name="tbname" value="news">
                    <input type="hidden" name="Submit" value="搜索" />
                    <p class="search_ico"> <span></span></p>
                </form>
            </div>
        </div>
    </nav>
</header>
<article>
    <h1 class="t_nav"><span>您现在的位置是：首页 > <a href="${pageContext.request.contextPath}/articles/1">轻博客</a> > 正文</span><a href="${pageContext.request.contextPath}/index" class="n1">首页</a><a href="${pageContext.request.contextPath}/article" class="n2">轻博客</a></h1>
    <div class="infosbox">
        <div class="newsview">
            <h3 class="news_title">${blog.title}</h3>
            <div class="bloginfo">
                <ul>
                    <li class="author"><a href="/">${blog.blogger.nickName}</a></li>
                    <li class="lmname"><a href="${pageContext.request.contextPath}/cate/${blog.typeId}">${blog.blogType.name}</a></li>
                    <li class="timer"><fmt:formatDate value="${blog.releaseDate}" type="date" pattern="yyyy-MM-dd HH:mm"/></li>
                    <li class="view">${blog.checkNum}</li>
                    <li class="like">${blog.likeNum}</li>
                </ul>
            </div>
            <div class="tags"><c:forEach items="${fn:split(blog.keywords, ' ')}" var="keyword">
                <c:if test="${!empty keyword}"><a href="${pageContext.request.contextPath}/tag/${keyword}" target="_blank">${keyword}</a> &nbsp;</c:if>
            </c:forEach></div>
            <div class="news_about"><strong>简介</strong>${blog.summary}</div>
            <div class="news_con">${blog.content}</div>
        </div>
        <div class="share">
            <p class="diggit"><a href="JavaScript:makeRequest('/e/public/digg/?classid=3&amp;id=19&amp;dotop=1&amp;doajax=1&amp;ajaxarea=diggnum','EchoReturnedText','GET','');"> 点赞！ </a>(<b id="diggnum"><script type="text/javascript" src="/e/public/ViewClick/?classid=2&id=20&down=5"></script>13</b>)</p>
            <p class="dasbox"><a href="javascript:void(0)" onClick="dashangToggle()" class="dashang" title="打赏，支持一下">打赏本站</a></p>
            <div class="hide_box"></div>
            <div class="shang_box"> <a class="shang_close" href="javascript:void(0)" onclick="dashangToggle()" title="关闭">关闭</a>
                <div class="shang_tit">
                    <p>感谢您的支持，我会继续努力的!</p>
                </div>
                <div class="shang_payimg"> <img src="images/alipayimg.jpg" alt="扫码支持" title="扫一扫"> </div>
                <div class="pay_explain">扫码打赏，一分也是爱</div>
                <div class="shang_payselect">
                    <div class="pay_item checked" data-id="alipay"> <span class="radiobox"></span> <span class="pay_logo"><img src="images/alipay.jpg" alt="支付宝"></span> </div>
                    <div class="pay_item" data-id="weipay"> <span class="radiobox"></span> <span class="pay_logo"><img src="images/wechat.jpg" alt="微信"></span> </div>
                </div>
                <script type="text/javascript">
                    $(function(){
                        $(".pay_item").click(function(){
                            $(this).addClass('checked').siblings('.pay_item').removeClass('checked');
                            var dataid=$(this).attr('data-id');
                            $(".shang_payimg img").attr("src","images/"+dataid+"img.jpg");
                            $("#shang_pay_txt").text(dataid=="alipay"?"支付宝":"微信");
                        });
                    });
                    function dashangToggle(){
                        $(".hide_box").fadeToggle();
                        $(".shang_box").fadeToggle();
                    }
                </script>
            </div>
        </div>
        <div class="nextinfo">
            <c:choose>
                <c:when test="${!empty previous}">
                    <p>上一篇：<a href="${pageContext.request.contextPath}/article/${previous.id}">${previous.title}</a></p>
                </c:when>
                <c:otherwise>
                    <p>上一篇：没有了哦</p>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${!empty next}">
                    <p>下一篇：<a href="${pageContext.request.contextPath}/article/${next.id}">${next.title}</a></p>
                </c:when>
                <c:otherwise>
                    <p>下一篇：没有了哦</p>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="news_pl">
            <h2>文章评论</h2>
            <ul>
                <div class="gbko"> </div>
            </ul>
        </div>
    </div>
    <jsp:include page="common/aside.jsp"/>
</article>
<jsp:include page="common/footer.jsp"/>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
</body>
</html>
