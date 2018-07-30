/**

 @Name：kqkdBlog 可圈可点分享圈模块
 @Author：可圈可丶
 @License：MIT
 @Site：http://www.kqkd.com/

 */
layui.define(['flow'], function(exports){
  var flow = layui.flow
  ,$ = layui.jquery;
  var URL = $("#URL").val();
  flow.load({
    elem: '#blogList' //指定列表容器
    ,end: ' '
    ,done: function(page, next){ //到达临界点（默认滚动触发），触发下一页
      var lis = [];
      setTimeout(function(){
        $.post(URL+'/list',{page:page,limit:6,size:12}, function(res){
          layui.each(res.blogList, function(index, blog){
            lis.push(
              '<div class=\"blogs\" data-scroll-reveal=\"enter bottom over 1s\" >'+
              '<h3 class=\"blogtitle\"><a href=\"'+URL+'/article/'+blog.id+'\" target=\"_blank\">'+blog.title+'</a></h3>'+
              '<span class=\"blogpic\"><a href=\"'+URL+'/article/'+blog.id+'\" title=\"\"><img src=\"'+URL+'/static/images/toppic01.jpg\" alt=\"\"></a></span>'+
              '<p class=\"blogtext\">'+blog.summary+'</p>'+
              '<div class=\"bloginfo\"><ul>'+
              '<li class=\"author\"><a href=\"/\">'+blog.blogger.nickName+'</a></li>'+
              '<li class=\"lmname\"><a href=\"'+URL+'/cate/'+blog.typeId+'\">'+blog.blogType.name+'</a></li>'+
              '<li class=\"timer\">'+blog.releaseDateStr+'</li>'+
              '<li class=\"view\"><span>'+blog.checkNum+'</span>已阅读</li>'+
              '<li class=\"like\">'+blog.likeNum+'</li></ul></div></div>'
            );
          });
          //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
          next(lis.join(''), page < res.pages);
          scrollReveal.init();
        },'json');
      },500);
    }
  });





  exports('blog', {}); //注意，这里是模块输出的核心，模块名必须和use时的模块名一致
});