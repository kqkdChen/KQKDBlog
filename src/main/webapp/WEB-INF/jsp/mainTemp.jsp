<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>可圈可点个人博客</title>
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
<jsp:include page="/WEB-INF/jsp/front/common/header.jsp"/>
<article>
  <!--banner begin-->
  <div class="banner">
    <div id="banner" class="fader">
      <li class="slide" ><a href="/" target="_blank"><img src="${pageContext.request.contextPath }/static/images/1.jpg"><span class="imginfo">别让这些闹心的套路，毁了你的网页设计!</span></a></li>
      <li class="slide" ><a href="/" target="_blank"><img src="${pageContext.request.contextPath }/static/images/2.jpg"><span class="imginfo">网页中图片属性固定宽度，如何用js改变大小</span></a></li>
      <li class="slide" ><a href="/" target="_blank"><img src="${pageContext.request.contextPath }/static/images/321541.jpg"><span class="imginfo">个人博客，属于我的小世界！</span></a></li>
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
  	<c:forEach var="blog" items="${blogList }">
    <div class="blogs" id="blogs" >
      <h3 class="blogtitle"><a href="${pageContext.request.contextPath}/blog/info/${blog.id }" target="_blank">${blog.title }</a></h3>
      <span class="blogpic"><a href="${pageContext.request.contextPath}/blog/info/${blog.id }" title=""><img src="${pageContext.request.contextPath}/${blog.img}"></a></span>
      <p class="blogtext">${blog.summary }</p>
      <div class="bloginfo">
        <ul>
          <li class="author"><a href="/">杨青</a></li>
          <li class="lmname"><a href="${pageContext.request.contextPath}/blog/cate/${blog.blogType.id}">${blog.blogType.name }</a></li>
          <li class="timer"><fmt:formatDate value="${blog.releaseDate }" type="date" pattern="yyyy-MM-dd HH:mm"/></li>
          <li class="view"><span>${blog.checkNum }</span>已阅读</li>
          <li class="like">9999</li>
        </ul>
      </div>
    </div>
    </c:forEach>
  </div>
  </main>
  <jsp:include page="/WEB-INF/jsp/front/common/aside.jsp"/>
</article>
<jsp:include page="/WEB-INF/jsp/front/common/footer.jsp"/>
<input type="hidden" id="PageContext" value="${pageContext.request.contextPath }"/>
<script src="${pageContext.request.contextPath }/static/layui/layui.js"></script>
<script type="text/javascript">
 if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
	sr.reveal('#blogs ',{origin:'right',duration: 600,delay: 100,distance: '10px',easing:'cubic-bezier(0.6,0.6,0.6,0.6)'});
    };
</script>
</body>
</html>
