<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="gbk">
<title>首页_杨青个人博客 - 一个站在web前端设计之路的女技术员个人博客网站</title>
<meta name="keywords" content="个人博客,杨青个人博客,个人博客模板,杨青" />
<meta name="description" content="杨青个人博客，是一个站在web前端设计之路的女程序员个人网站，提供个人博客模板免费资源下载的个人原创网站。" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath }/static/css/base.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/static/css/index.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/static/css/m.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/static/layui/css/layui.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/static/js/jquery.min.js" ></script>
<script src="${pageContext.request.contextPath }/static/js/jquery.easyfader.min.js"></script>
<script src="${pageContext.request.contextPath }/static/js/hc-sticky.js"></script>
<script src="${pageContext.request.contextPath }/static/js/comm.js"></script>
<script src="${pageContext.request.contextPath }/static/js/scrollReveal.js"></script>
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
<jsp:include page="/WEB-INF/jsp/front/common/header.jsp"/>;
<article>
  <main>
    <div class="place" id="pageContents">
      <span class="layui-breadcrumb" lay-separator=">>">
      <a href="${pageContext.request.contextPath}/index" style="margin-left: 15px;">首页</a>
      <a href="${pageContext.request.contextPath}/blog/cate/${blogType.id}">${blogType.name}</a>
      </span>
    </div>
    <c:forEach var="blog" items="${blogList }">
      <div class="blogs" id="blogs" >
        <h3 class="blogtitle"><a href="${pageContext.request.contextPath}/blog/info/${blog.id }" target="_blank">${blog.title }</a></h3>
        <span class="blogpic"><a href="${pageContext.request.contextPath}/blog/info/${blog.id }" title=""><img src="${pageContext.request.contextPath}/${blog.img}"></a></span>
        <p class="blogtext">${blog.summary }</p>
        <div class="bloginfo">
          <ul>
            <li class="author"><a href="/">杨青</a></li>
            <li class="lmname"><a href="${pageContext.request.contextPath}/blog/cate/${blogType.id}">${blogType.name }</a></li>
            <li class="timer"><fmt:formatDate value="${blog.releaseDate }" type="date" pattern="yyyy-MM-dd HH:mm"/></li>
            <li class="view"><span>${blog.checkNum }</span>已阅读</li>
            <li class="like">9999</li>
          </ul>
        </div>
      </div>
    </c:forEach>
  </main>
  <aside class="r_box" >
      <div class="wdxc">
        <h2>图文精选</h2>
        <ul>
          <li><a href="/"><img src="images/7.jpg"></a></li>
          <li><a href="/"><img src="images/8.jpg"></a></li>
          <li><a href="/"><img src="images/9.jpg"></a></li>
          <li><a href="/"><img src="images/10.jpg"></a></li>
          <li><a href="/"><img src="images/11.jpg"></a></li>
          <li><a href="/"><img src="images/12.jpg"></a></li>
        </ul>
      </div>
      <div class="cloud">
        <h2>标签云</h2>
        <ul>
          <a href="/">陌上花开</a> <a href="/">校园生活</a> <a href="/">html5</a> <a href="/">SumSung</a> <a href="/">青春</a> <a href="/">温暖</a> <a href="/">阳光</a> <a href="/">三星</a><a href="/">索尼</a> <a href="/">华维荣耀</a> <a href="/">三星</a> <a href="/">索尼</a>
        </ul>
      </div>
      <div class="tuijian">
        <h2 id="tab"><a href="#"class="current">点击排行</a><a href="#">站长推荐</a></h2>
        <div id="content">
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
          <img src="images/wx.jpg">
        </ul>
      </div>

  </aside>
</article>
<jsp:include page="/WEB-INF/jsp/front/common/footer.jsp"/>
<script src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
</body>
</html>
