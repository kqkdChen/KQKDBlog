<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  <script src="${pageContext.request.contextPath}/static/js/scrollReveal.js"></script>
  <script src="${pageContext.request.contextPath}/static/js/jquery.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/static/js/jquery.easyfader.min.js"></script>
  <script src="${pageContext.request.contextPath}/static/js/common.js"></script>
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
<a name="" id="anchor"></a><!--js跳转到锚点-->
<div class="pagebg sh"></div>
<div class="container">
  <h1 class="t_nav"><span>${checkNumList[0].blogger.introduction}</span><a href="/" class="n1">网站首页</a><a href="${pageContext.request.contextPath}/articles/2" class="n2">慢生活</a></h1>
  <!--blogsbox begin-->
  <div class="blogsbox" id="blogs">
  </div>
  <jsp:include page="common/aside.jsp"/>
  <div id="page" style="float: left; width: 100%;"></div>
  <!--blogsbox end-->
</div>
<input id="count" type="hidden" value="${count}"/>
<input type="hidden" id="URL" value="${pageContext.request.contextPath}"/>
<input type="hidden" id="flag" value="${flag}"/>
<jsp:include page="common/footer.jsp"/>
<script src="${pageContext.request.contextPath}/static/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/static/js/articles.js"></script>
</body>
</html>
