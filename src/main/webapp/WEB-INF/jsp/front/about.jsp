<%--
  Created by IntelliJ IDEA.
  User: 可圈可丶
  Date: 2018/8/20
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html>
<head>
    <meta charset="gbk">
    <title>关于我</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../skin/more/css/index.css" tppabs="http://www.yangqq.com/more/skin/more/css/index.css" rel="stylesheet">
    <script src="../skin/more/js/jquery.min.js" tppabs="http://www.yangqq.com/more/skin/more/js/jquery.min.js" ></script>
    <script src="../skin/more/js/about.js" tppabs="http://www.yangqq.com/more/skin/more/js/about.js"></script>
    <script src="../skin/more/js/scrollReveal.js" tppabs="http://www.yangqq.com/more/skin/more/js/scrollReveal.js"></script>
    <!--[if lt IE 9]>
    <script src="../skin/more/js/modernizr.js" tppabs="http://www.yangqq.com/more/skin/more/js/modernizr.js"></script>
    <![endif]-->
</head>
<body>
<header class="header-navigation" id="header">
    <nav>
        <div class="logo"><a href="../index.htm" tppabs="http://www.yangqq.com/more/">杨青个人博客</a></div>
        <h2 id="mnavh"><span class="navicon"></span></h2>
        <ul id="starlist">
            <li><a href="../index.htm" tppabs="http://www.yangqq.com/more/" title="首页">网站首页</a></li>


            <li ><a href="../study/index.htm" tppabs="http://www.yangqq.com/more/study/">学无止境</a>
                <ul class="sub">            <li><a href="../study/3/index.htm" tppabs="http://www.yangqq.com/more/study/3/" >目录3</a></li>
                    <li><a href="../study/2/index.htm" tppabs="http://www.yangqq.com/more/study/2/" >目录2</a></li>
                    <li><a href="../study/1/index.htm" tppabs="http://www.yangqq.com/more/study/1/" >目录1</a></li>
                </ul></li>


            <li ><a href="../life/index.htm" tppabs="http://www.yangqq.com/more/life/">慢生活</a>
            </li>


            <li ><a href="../show/index.htm" tppabs="http://www.yangqq.com/more/show/">图片展示</a>
            </li>


            <li class="selected"><a href="index.htm" tppabs="http://www.yangqq.com/more/about/">关于我</a>
                <ul class="sub">      </ul></li>


            <li ><a href="../time/index.htm" tppabs="http://www.yangqq.com/more/time/">时间轴</a>
                <ul class="sub">      </ul></li>


            <li ><a href="../e/tool/gbook/-bid=1.htm" tppabs="http://www.yangqq.com/more/e/tool/gbook/?bid=1">留言</a>
                <ul class="sub">      </ul></li>

        </ul>
        <div class="searchbox">
            <div id="search_bar" class="search_bar">
                <form id="searchform" action="http://www.yangqq.com/more/e/search/index.php" method="post" name="searchform">
                    <input class="input" placeholder="想搜点什么呢.." type="text" name="keyboard" id="keyboard">
                    <input type="hidden" name="show" value="title">
                    <input type="hidden" name="tempid" value="1">
                    <input type="hidden" name="tbname" value="news">
                    <input type="hidden" name="Submit" value="搜索">
                    <p class="search_ico"> <span></span></p>
                </form>
            </div>
        </div>
    </nav>
</header>
<div class="pagebg">
    <img src="../../skin/852/images/blank.jpg" tppabs="http://www.yangqq.com/skin/852/images/blank.jpg" alt="关于我" >
</div>
<div class="container">
    <h1 class="t_nav"><span>像“草根”一样，紧贴着地面，低调的存在，冬去春来，枯荣无恙。</span><a href="../index.htm" tppabs="http://www.yangqq.com/more/" class="n1">网站首页</a><a href="index.htm" tppabs="http://www.yangqq.com/more/about/" class="n2">关于我</a></h1>
    <div class="news_infos">
        <ul>
            <p>杨青，女，一个80后草根女站长！09年入行。一直潜心研究web前端技术，一边工作一边积累经验，分享一些个人博客模板，以及SEO优化等心得。我入行早，大家也亲切的叫我&ldquo;青姐&rdquo;。<br />
                <br />
                SEO奋斗了将近两年时间，个人博客网站百度排名也从之前的30页后，排到了第一页。期间有很多的不容易，但是都没有放弃过。入了这一行 ，就深深的喜欢上它。我喜欢一句话&ldquo;冥冥中该来则来，无处可逃&rdquo;。<br />
                <br />
                近几年我也发现个人博客排前几页的也有很多是我做过的模板，感谢各位站长的欣赏，我仔细看过他们的网站。他们在我原模板的基础上有修改，而且他们做的原创内容都是值得一读的。有时候甚至排名都超过了我个人博客网站的排名。<br />
                <br />
                现在很多人向我请教如何做好SEO，我想说的是，一是&ldquo;代码&rdquo;，一定要简单，布局要合理。二是&ldquo;内容&rdquo;，一定要有原创，伪原创也是可以的。三是&ldquo;持续&rdquo;，这是一个持续性过程，一定要有耐心，SEO不是马上生效的。<br />
                <br />
                自从入了这一行，也交到了不少朋友，QQ群也不断的壮大起来，280998807(交流群 <span style="color:#FF0000;">已满员</span>)&nbsp; 280998843（技术群），群里的小伙伴们也很积极的帮助新朋友解决问题，如果你想加入我们，这个大家庭的门，永远给你敞开！另外微信群已于2018.4.13日开通（已满100，只接受群主邀请，可加我个人微信进群 。我的个人微信号 yangqq_1987）</p>
            &nbsp;

            <h2>About my blog</h2>
            &nbsp;

            <p>域 名：www.yangqq.com 创建于2011年01月12日&nbsp;</p>
            &nbsp;

            <p>服务器：阿里云服务器&nbsp;&nbsp;<a href="javascript:if(confirm('https://promotion.aliyun.com/ntms/act/ambassador/sharetouser.html?userCode=8smrzoqa&productCode=vm  \n\n该文件未被 Teleport Pro 下载，因为 是一个使用未支持协议的地址(例如: gopher)。  \n\n你想要从服务器打开它吗?'))window.location='https://promotion.aliyun.com/ntms/act/ambassador/sharetouser.html?userCode=8smrzoqa&productCode=vm'" tppabs="https://promotion.aliyun.com/ntms/act/ambassador/sharetouser.html?userCode=8smrzoqa&productCode=vm" target="_blank"><span style="color:#FF0000;"><strong>前往阿里云官网购买&gt;&gt;</strong></span></a></p>
            &nbsp;

            <p>备案号：蜀ICP备11002373号-1</p>
            &nbsp;

            <p>程 序：PHP 帝国CMS7.5</p>
        </ul>
    </div>
    <div class="sidebar">

        <div class="about">
            <p class="avatar"> <img src="../skin/more/images/avatar.jpg" tppabs="http://www.yangqq.com/more/skin/more/images/avatar.jpg"> </p>
            <p class="abname">dancesmile | 杨青</p>
            <p class="abposition">Web前端设计师、网页设计</p>
            <p class="abtext"> 一个80后草根女站长！09年入行。一直潜心研究web前端技术，一边工作一边积累经验，分享一些个人博客模板，以及SEO优化等心得。 </p>
        </div>
        <div class="weixin">
            <h2 class="hometitle">微信关注</h2>
            <ul>
                <img src="../skin/more/images/wx.jpg" tppabs="http://www.yangqq.com/more/skin/more/images/wx.jpg">
            </ul>
        </div>
    </div>
</div>
<footer>
    <p>Design by <a href="javascript:if(confirm('http://www.yangqq.com/  \n\n该文件未被 Teleport Pro 下载，因为 它位于起始地址以设置的边界以外的域或路径中。  \n\n你想要从服务器打开它吗?'))window.location='http://www.yangqq.com/'" tppabs="http://www.yangqq.com/" target="_blank">杨青个人博客</a> <a href="javascript:if(confirm('http://www.yangqq.com/  \n\n该文件未被 Teleport Pro 下载，因为 它位于起始地址以设置的边界以外的域或路径中。  \n\n你想要从服务器打开它吗?'))window.location='http://www.yangqq.com/'" tppabs="http://www.yangqq.com/">蜀ICP备11002373号-1</a></p>
</footer>
<a href="#" class="cd-top">Top</a>
</body>
</html>
