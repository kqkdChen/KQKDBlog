/**

 @Name：kqkdBlog 可圈可点分享圈模块
 @Author：可圈可丶
 @License：MIT
 @Site：http://www.kqkd.com/

 */
layui.use(['laypage','jquery'], function(){
  var $ = layui.jquery
  ,laypage = layui.laypage ;
  var url = $("#url").val()
  ,count = $("#count").val();

  /*博客分页*/
  laypage.render({
    elem: 'layPage'
    ,limit: 8
    ,layout: ['prev', 'page', 'next', 'limit']
    ,limits: [5,8,10,15]
    ,theme: '#3690CF'
    ,count: count  //数据总数，从服务端得到
    ,jump: function(obj, first){
      var curr =  obj.curr //当前页
      ,limit = obj.limit //每页条数
      ,lis = [];
      $.post(url+'/blogPage', {page:curr, limit:limit}, function (data) {
        layui.each(data.blogList, function(index, blog) {
          lis.push(
            '<div class=\"blogs\" data-scroll-reveal=\"enter bottom over 1s\" >'+
            '<h2 class=\"blogtitle\"><a href=\"'+url+'/blog/'+blog.id+'\" target=\"_blank\">'+blog.title+'</a></h2>'+
            '<span class=\"blogpic\"><a href=\"'+url+'/blog/'+blog.id+'\" title=\"\"><img src="'+url+'/'+blog.cover+'" alt=\"\"></a></span>'+
            '<p class=\"blogtext\">'+blog.summary+'</p>'+
            '<div class=\"bloginfo\"><ul>'+
            '<li class=\"author\"><a href=\"/\">'+blog.blogger.nickName+'</a></li>'+
            '<li class=\"lmname\"><a href=\"'+url+'/cate/'+blog.typeId+'\">'+blog.blogType.name+'</a></li>'+
            '<li class=\"timer\">'+blog.releaseDateStr+'</li>'+
            '<li class=\"view\"><span>'+blog.checkNum+'</span>已阅读</li>'+
            '<li class=\"like\">'+blog.likeNum+'</li></ul></div></div>'
          );
        });
        $(".blogsbox").html(lis);
        scrollReveal.init();
        $('body,html').animate({
            scrollTop: 0
          }, 500
        );
      },"json",false);
    }
  });
  setTimeout('$("#layPage").show()',700);
  setTimeout('$("#footer").show()',700);
});

