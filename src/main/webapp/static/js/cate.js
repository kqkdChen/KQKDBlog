/**

 @Name：kqkdBlog 可圈可点分享圈模块
 @Author：可圈可丶
 @License：MIT
 @Site：http://www.kqkd.com/

 */
layui.use(['laypage','jquery'], function(){
  var $ = layui.jquery
  ,laypage = layui.laypage ;
  var URL = $("#URL").val()
  ,count = $("#count").val()
  ,id = $("#id").val();

  /*博客分页*/
  laypage.render({
    elem: 'page'
    ,limit: 8
    ,layout: ['prev', 'page', 'next', 'limit']
    ,limits: [5,8,10,15]
    ,theme: '#2AB39A'
    ,count: count  //数据总数，从服务端得到
    ,jump: function(obj, first){
      var curr =  obj.curr //当前页
      ,limit = obj.limit //每页条数
      ,lis = [];
      $.post(URL+'/catePage/'+id, {page:curr, limit:limit}, function (data) {
        layui.each(data.blogList, function(index, blog) {
          lis.push(
            '<div class=\"blogs\" data-scroll-reveal=\"enter bottom over 1s\" >'+
            '<h2 class=\"blogtitle\"><a href=\"'+URL+'/article/'+blog.id+'\" target=\"_blank\">'+blog.title+'</a></h2>'+
            '<span class=\"blogpic\"><a href=\"'+URL+'/article/'+blog.id+'\" title=\"\"><img src="'+URL+'/'+blog.cover+'" alt=\"\"></a></span>'+
            '<p class=\"blogtext\">'+blog.summary+'</p>'+
            '<div class=\"bloginfo\"><ul>'+
            '<li class=\"author\"><a href=\"/\">'+blog.blogger.nickName+'</a></li>'+
            '<li class=\"lmname\"><a href=\"'+URL+'/cate/'+blog.typeId+'\">'+blog.blogType.name+'</a></li>'+
            '<li class=\"timer\">'+blog.releaseDateStr+'</li>'+
            '<li class=\"view\"><span>'+blog.checkNum+'</span>已阅读</li>'+
            '<li class=\"like\">'+blog.likeNum+'</li></ul></div></div>'
          );
        });
        $("#blogs").html(lis);
        scrollReveal.init();
        document.getElementById('anchor').scrollIntoView(true); //回到顶点
      },"json",false);
    }
  });
});