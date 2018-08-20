<%--
  Created by IntelliJ IDEA.
  User: 可圈可丶
  Date: 2018/8/18
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>
<head>
    <jsp:include page="common/head.jsp"/>
    <link href="${path}/static/layui/css/layui.css" rel="stylesheet">
</head>
<body>
<jsp:include page="common/nav.jsp"/>
<article>
    <h1 class="t_nav"><span>您现在的位置是：<a href="${path}/index">首页</a>&nbsp;>&nbsp;<a href="">正文</a>&nbsp;>&nbsp;<a href="${path}/cate/${blog.typeId}">${blog.blogType.name}</a></span><a href="${path}/index" class="n1">网站首页</a><a href="" class="n2">正文</a></h1>
    <main class="layui-anim layui-anim-upbit">
        <div class="infosbox">
            <div class="newsview">
                <h3 class="news_title">${blog.title}</h3>
                <div class="bloginfo">
                    <ul>
                        <li class="author">${blog.blogger.nickName}</li>
                        <li class="lmname"><a href="${path}/cate/${blog.typeId}">${blog.blogType.name}</a></li>
                        <li class="timer"><fmt:formatDate value="${blog.releaseDate}" type="date" pattern="yyyy-MM-dd HH:ss"/></li>
                        <li class="view">${blog.checkNum}</li>
                        <li class="like">${blog.likeNum}</li>
                    </ul>
                </div>
                <div class="tags">
                    <c:forEach items="${fn:split(blog.keywords, ' ')}" var="keyword">
                        <c:if test="${!empty keyword}"><a href="${pageContext.request.contextPath}/tag/${keyword}" target="_blank">${keyword}</a> &nbsp;</c:if>
                    </c:forEach>
                </div>
                <div class="news_about"><strong>简介</strong>${blog.summary}</div>
                <div class="news_con">${blog.content}</div>
            </div>
            <div class="share">
                <p class="diggit"><a href=""> 很赞哦！</a>(<b id="diggnum">${blog.likeNum}</b>)</p>
                <p class="dasbox"><a href="javascript:void(0)" onClick="dashangToggle()" class="dashang" title="打赏，支持一下">打赏本站</a></p>
                <div class="hide_box"></div>
                <div class="shang_box"> <a class="shang_close" href="javascript:void(0)" onclick="dashangToggle()" title="关闭">关闭</a>
                    <div class="shang_tit">
                        <p>感谢您的支持，我会继续努力的!</p>
                    </div>
                    <div class="shang_payimg"> <img src="../../skin/more/images/alipayimg.jpg" tppabs="http://www.yangqq.com/more/skin/more/images/alipayimg.jpg" alt="扫码支持" title="扫一扫"> </div>
                    <div class="pay_explain">扫码打赏，你说多少就多少</div>
                    <div class="shang_payselect">
                        <div class="pay_item checked" data-id="alipay"> <span class="radiobox"></span> <span class="pay_logo"><img src="../../skin/more/images/alipay.jpg" tppabs="http://www.yangqq.com/more/skin/more/images/alipay.jpg" alt="支付宝"></span> </div>
                        <div class="pay_item" data-id="weipay"> <span class="radiobox"></span> <span class="pay_logo"><img src="../../skin/more/images/wechat.jpg" tppabs="http://www.yangqq.com/more/skin/more/images/wechat.jpg" alt="微信"></span> </div>
                    </div>
                    <script type="text/javascript">
                      $(function(){
                        $(".pay_item").click(function(){
                          $(this).addClass('checked').siblings('.pay_item').removeClass('checked');
                          var dataid=$(this).attr('data-id');
                          $(".shang_payimg img").attr("src","/more/skin/more/images/"+dataid+"img.jpg");
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
                <p>上一篇：<a href="${path}/blog/${previous.id}">${previous.title}</a></p>
                <p>下一篇：<a href="${path}/blog/${next.id}">${next.title}</a></p>
            </div>
            <div class="otherlink">
                <h2>相关文章</h2>
                <ul>无相关信息</ul>
            </div>
            <div class="news_pl">
                <h2>文章评论</h2>
                <ul>
                    <div class="gbko"> <script>
                      function CheckPl(obj)
                      {
                        if(obj.saytext.value=="")
                        {
                          alert("您没什么话要说吗？");
                          obj.saytext.focus();
                          return false;
                        }
                        return true;
                      }
                    </script><form action="http://www.yangqq.com/more/e/pl/doaction.php" method="post" name="saypl" id="saypl" onsubmit="return CheckPl(document.saypl)">
                        <div id="plpost">
                            <p class="saying"><span><a href="../../e/pl/-classid=3&id=17.htm" tppabs="http://www.yangqq.com/more/e/pl/?classid=3&id=17">共有<script type="text/javascript" src="../../e/public/ViewClick/-classid=3&id=17&down=2" tppabs="http://www.yangqq.com/more/e/public/ViewClick/?classid=3&id=17&down=2"></script>条评论</a></span>来说两句吧...</p>
                            <p class="yname"><span>用户名:</span><input name="username" type="text" class="inputText" id="username" value="" size="16" /></p>
                            <p class="yzm"><span>验证码:</span><input name="key" type="text" class="inputText" size="16" />
                                <img src="../../e/ShowKey/-v=pl.jpg" tppabs="http://www.yangqq.com/more/e/ShowKey/?v=pl" align="absmiddle" name="plKeyImg" id="plKeyImg" onclick="plKeyImg.src='/more/e/ShowKey/?v=pl&t='+Math.random()" title="看不清楚,点击刷新" /> </p>
                            <input name="nomember"  type="hidden" id="nomember" value="1" checked="checked" />
                            <textarea name="saytext" rows="6" id="saytext"></textarea><input name="imageField" type="submit" value="提交"/>
                            <input name="id" type="hidden" id="id" value="17" />
                            <input name="classid" type="hidden" id="classid" value="3" />
                            <input name="enews" type="hidden" id="enews" value="AddPl" />
                            <input name="repid" type="hidden" id="repid" value="0" />
                            <input type="hidden" name="ecmsfrom" value="/more/study/2/17.html"></td>
                        </div></form></div>
                </ul>
            </div>
        </div>
    </main>
    <aside class="sidebar">
        <jsp:include page="common/aside_hot.jsp"/>
        <jsp:include page="common/aside_blogType.jsp"/>
        <jsp:include page="common/aside_tag.jsp"/>
        <jsp:include page="common/aside_link.jsp"/>
        <jsp:include page="common/aside_followMe.jsp"/>
    </aside>
</article>
<jsp:include page="common/footer.jsp"/>
</html>
