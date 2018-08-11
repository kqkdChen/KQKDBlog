<%--
  Created by IntelliJ IDEA.
  User: ��Ȧ��ؼ
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
    <title>��Ȧ�ɵ����վ</title>
    <meta name="keywords" content="���˲���,��Ȧ�ɵ���˲���,���,��Ȧ�ɵ�" />
    <meta name="description" content="��Ȧ�ɵ���˲��ͣ�Java��̨����Ա��վ��ԭ���²��Ѿ���ʱ����һЩ��Ʒ�����" />
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
        <div class="logo"><a href="${pageContext.request.contextPath}/index">��Ȧ�ɵ���˲���</a></div>
        <h2 id="mnavh"><span class="navicon"></span></h2>
        <ul id="starlist">
            <li><a href="${pageContext.request.contextPath}/index"><i class="layui-icon layui-icon-home"></i>&nbsp;��ҳ</a></li>
            <li><a href="${pageContext.request.contextPath}/articles/1">�Ჩ��</a></li>
            <li><a href="${pageContext.request.contextPath}/articles/2">������</a></li>
            <li><a href="time.html">��Ʒ���</a></li>
            <li class="menu"><a href="about.html">��������</a>
                <ul class="sub">
                    <li><a href="#">���ڲ���</a></li>
                    <li><a href="#">���ڱ�վ</a></li>
                </ul>
            </li>
        </ul>
        <div class="searchbox">
            <div id="search_bar" class="search_bar">
                <form  id="searchform" action="[!--news.url--]e/search/index.php" method="post" name="searchform">
                    <input class="input" placeholder="���ѵ�ʲô��.." type="text" name="keyboard" id="keyboard">
                    <input type="hidden" name="show" value="title" />
                    <input type="hidden" name="tempid" value="1" />
                    <input type="hidden" name="tbname" value="news">
                    <input type="hidden" name="Submit" value="����" />
                    <p class="search_ico"> <span></span></p>
                </form>
            </div>
        </div>
    </nav>
</header>
<article>
    <h1 class="t_nav"><span>�����ڵ�λ���ǣ���ҳ > <a href="${pageContext.request.contextPath}/articles/1">�Ჩ��</a> > ����</span><a href="${pageContext.request.contextPath}/index" class="n1">��ҳ</a><a href="${pageContext.request.contextPath}/article" class="n2">�Ჩ��</a></h1>
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
            <div class="news_about"><strong>���</strong>${blog.summary}</div>
            <div class="news_con">${blog.content}</div>
        </div>
        <div class="share">
            <p class="diggit"><a href="JavaScript:makeRequest('/e/public/digg/?classid=3&amp;id=19&amp;dotop=1&amp;doajax=1&amp;ajaxarea=diggnum','EchoReturnedText','GET','');"> ���ޣ� </a>(<b id="diggnum"><script type="text/javascript" src="/e/public/ViewClick/?classid=2&id=20&down=5"></script>13</b>)</p>
            <p class="dasbox"><a href="javascript:void(0)" onClick="dashangToggle()" class="dashang" title="���ͣ�֧��һ��">���ͱ�վ</a></p>
            <div class="hide_box"></div>
            <div class="shang_box"> <a class="shang_close" href="javascript:void(0)" onclick="dashangToggle()" title="�ر�">�ر�</a>
                <div class="shang_tit">
                    <p>��л����֧�֣��һ����Ŭ����!</p>
                </div>
                <div class="shang_payimg"> <img src="images/alipayimg.jpg" alt="ɨ��֧��" title="ɨһɨ"> </div>
                <div class="pay_explain">ɨ����ͣ�һ��Ҳ�ǰ�</div>
                <div class="shang_payselect">
                    <div class="pay_item checked" data-id="alipay"> <span class="radiobox"></span> <span class="pay_logo"><img src="images/alipay.jpg" alt="֧����"></span> </div>
                    <div class="pay_item" data-id="weipay"> <span class="radiobox"></span> <span class="pay_logo"><img src="images/wechat.jpg" alt="΢��"></span> </div>
                </div>
                <script type="text/javascript">
                    $(function(){
                        $(".pay_item").click(function(){
                            $(this).addClass('checked').siblings('.pay_item').removeClass('checked');
                            var dataid=$(this).attr('data-id');
                            $(".shang_payimg img").attr("src","images/"+dataid+"img.jpg");
                            $("#shang_pay_txt").text(dataid=="alipay"?"֧����":"΢��");
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
                    <p>��һƪ��<a href="${pageContext.request.contextPath}/article/${previous.id}">${previous.title}</a></p>
                </c:when>
                <c:otherwise>
                    <p>��һƪ��û����Ŷ</p>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${!empty next}">
                    <p>��һƪ��<a href="${pageContext.request.contextPath}/article/${next.id}">${next.title}</a></p>
                </c:when>
                <c:otherwise>
                    <p>��һƪ��û����Ŷ</p>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="news_pl">
            <h2>��������</h2>
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
