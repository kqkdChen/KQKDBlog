<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="gbk">
<title>${pageTitle }</title>
<meta name="keywords" content="可圈可点个人博客" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="${pageContext.request.contextPath }/static/js/scrollreveal.min.js"></script>
<script type="text/javascript">
      window.sr  =  ScrollReveal({reset: true}); 
</script>
<link href="${pageContext.request.contextPath }/static/css/base.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/static/css/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/static/css/index.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/static/css/m.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/static/layui/css/layui.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/static/js/jquery.min.js" ></script>
<script src="${pageContext.request.contextPath }/static/js/jquery.easyfader.min.js"></script>
<script src="${pageContext.request.contextPath }/static/js/hc-sticky.js"></script>
<script src="${pageContext.request.contextPath }/static/js/comm.js"></script>
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
<jsp:include page="/WEB-INF/jsp/front/header.jsp"/>
<article>
  <!--banner begin-->
  <div class="banner">
    <div id="banner" class="fader">
      <li class="slide" ><a href="/" target="_blank"><img src="${pageContext.request.contextPath }/static/images/1.jpg"><span class="imginfo">别让这些闹心的套路，毁了你的网页设计!</span></a></li>
      <li class="slide" ><a href="/" target="_blank"><img src="${pageContext.request.contextPath }/static/images/2.jpg"><span class="imginfo">网页中图片属性固定宽度，如何用js改变大小</span></a></li>
      <li class="slide" ><a href="/" target="_blank"><img src="${pageContext.request.contextPath }/static/images/3.jpg"><span class="imginfo">个人博客，属于我的小世界！</span></a></li>
      <div class="fader_controls">
        <div class="page prev" data-target="prev">&lsaquo;</div>
        <div class="page next" data-target="next">&rsaquo;</div>
        <ul class="pager_list">
        </ul>
      </div>
    </div>
  </div>
  <!--banner end-->
  <div class="toppic">
    <li> <a href="/" target="_blank"> <i><img src="${pageContext.request.contextPath }/static/images/1.jpg"></i>
      <h2>安静地做一个爱设计的女子</h2>
      <span>学无止境</span> </a> </li>
    <li> <a href="/" target="_blank"> <i><img src="${pageContext.request.contextPath }/static/images/2.jpg"></i>
      <h2>个人博客，属于我的小世界！</h2>
      <span>学无止境</span> </a> </li>
  </div>
  <main>
  <div class="news_box">
    <ul>
      <li><i><a href="/"><img src="${pageContext.request.contextPath }/static/images/1.jpg"></a></i>
        <h3><a href="/">html5个人博客模板《simple》</a></h3>
      </li>
      <li><i><a href="/"><img src="${pageContext.request.contextPath }/static/images/2.jpg"></a></i>
        <h3><a href="/">html5古典个人博客模板《青砖屋檐》</a></h3>
      </li>
    </ul>
  </div>
  <%-- <div class="pics">
    <ul>
      <li><i><a href="/news/life/2018-06-17/873.html" target="_blank"><img src="${pageContext.request.contextPath }/static/images/p1.jpg"></a></i><span>安静地做一个爱设计的女子</span></li>
      <li><i><a href="/news/life/2018-04-27/816.html" target="_blank"><img src="${pageContext.request.contextPath }/static/images/p2.jpg"></a></i><span>个人博客，属于我的小世界！（可以是广告）</span></li>
      <li><i><a href="/jstt/bj/2015-01-09/740.html" target="_blank"><img src="${pageContext.request.contextPath }/static/images/p3.jpg"></a></i><span>【匆匆那些年】总结个人博客经历的这四年…</span></li>
    </ul>
  </div> --%>
  
  <div class="blogtab" id="blogList">
    <ul id="blogtab">
      <li class="current">最新文章</li>
      <li><a href="list.html">心得笔记</a></li>
      <li><a href="list.html">CSS3|Html5</a></li>
      <li><a href="list.html">网站建设</a></li>
      <li><a href="list.html">文字标签</a></li>
      <li><a href="list.html">文字广告</a></li>
    </ul> 
  	<c:forEach var="blog" items="${blogs }">
    <div class="blogs" id="blogs" >
      <h3 class="blogtitle"><a href="${pageContext.request.contextPath}/blog/articles/${blog.id }" target="_blank">${blog.title }</a></h3>
      <span class="blogpic"><a href="${pageContext.request.contextPath}/blog/articles/${blog.id }" title=""><img src="${pageContext.request.contextPath}/${blog.imgSrc}"></a></span>
      <p class="blogtext">${blog.summary }</p>
      <div class="bloginfo">
        <ul>
          <li class="author"><a href="/">杨青</a></li>
          <li class="lmname"><a href="/">${blog.blogType.typeName }</a></li>
          <li class="timer"><fmt:formatDate value="${blog.releaseDate }" type="date" pattern="yyyy-MM-dd HH:mm"/></li>
          <li class="view"><span>${blog.checkNum }</span>已阅读</li>
          <li class="like">9999</li>
        </ul>
      </div>
    </div>
    </c:forEach>
  </div>
    <div id="page" style="margin:0 auto;"></div>
  </main>
  <aside class="r_box" >
      <div class="about_me">
        <h2>博主简介</h2>
        <ul>
          <i><img src="${pageContext.request.contextPath }/static/images/4.jpg"></i>
          <p><b>杨青</b>，一个80后草根女站长！09年入行。一直潜心研究web前端技术，一边工作一边积累经验，分享一些个人博客模板，以及SEO优化等心得。</p>
        </ul>
      </div>
      <%-- <div class="wdxc">
        <h2>图片精选</h2>
        <ul>
          <li><a href="/"><img src="${pageContext.request.contextPath }/static/images/7.jpg"></a></li>
          <li><a href="/"><img src="${pageContext.request.contextPath }/static/images/8.jpg"></a></li>
          <li><a href="/"><img src="${pageContext.request.contextPath }/static/images/9.jpg"></a></li>
          <li><a href="/"><img src="${pageContext.request.contextPath }/static/images/10.jpg"></a></li>
          <li><a href="/"><img src="${pageContext.request.contextPath }/static/images/11.jpg"></a></li>
          <li><a href="/"><img src="${pageContext.request.contextPath }/static/images/12.jpg"></a></li>
        </ul>
      </div> --%>
      <div class="fenlei">
        <h2>文章分类</h2>
        <ul>
          <li><a href="/">学无止境（33）</a></li>
          <li><a href="/">日记（19）</a></li>
          <li><a href="/">慢生活（520）</a></li>
          <li><a href="/">美文欣赏（40）</a></li>
        </ul>
      </div>
      <div class="tuijian">
        <h2 id="tab"><a href="#"class="current">活动公告</a><a href="#">点击排行</a><a href="#">站长推荐</a></h2>
        
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
          <li><a href="/">你是什么人便会遇上什么人</a></li>
          <li><a href="/">帝国cms 列表页调用子栏目，没有则不显示栏目名称</a></li>
          <li><a href="/">第二届 优秀个人博客模板比赛参选活动</a></li>
          <li><a href="/">个人博客模板《绅士》后台管理</a></li>
          <li><a href="/">你是什么人便会遇上什么人</a></li>
          <li><a href="/">帝国cms 列表页调用子栏目，没有则不显示栏目名称</a></li>
          <li><a href="/">第二届 优秀个人博客模板比赛参选活动</a></li>
          <li><a href="/">黑色质感时间轴html5个人博客模板</a></li>
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
</article>
<jsp:include page="/WEB-INF/jsp/front/footer.jsp"/>
<input type="hidden" id="PageContext" value="${pageContext.request.contextPath }"/>
<script src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
<script type="text/javascript">
 if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
	sr.reveal('#blogs ',{origin:'right',duration: 600,delay: 100,distance: '10px',easing:'cubic-bezier(0.6,0.6,0.6,0.6)'});
    };
</script>
</body>
</html>
