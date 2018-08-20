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
    ,limit: 10
    ,layout: ['prev', 'page', 'next', 'limit']
    ,limits: [10,15,20,25]
    ,theme: '#3690CF'
    ,count: count  //数据总数，从服务端得到
    ,jump: function(obj, first){
      var curr =  obj.curr //当前页
      ,limit = obj.limit //每页条数
      ,lis = [];
      $.post(url+'/timePage', {page:curr, limit:limit}, function (data) {
        layui.each(data.blogList, function(index, blog) {
          lis.push(
            '<li><span>'+blog.releaseDateStr+'</span><a href="'+url+'/blog/'+blog.id+'" target="_blank">'+blog.title+'</a></li>'
          );
        });
        $("#time").html(lis);
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

