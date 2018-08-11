/**

 @Name：kqkdBlog 可圈可点分享圈模块
 @Author：可圈可丶
 @License：MIT
 @Site：http://www.kqkd.com/

 */
layui.use(['flow','laypage'], function(){
  var flow = layui.flow
  ,$ = layui.jquery
  ,laypage = layui.laypage ;
  var URL = $("#URL").val()
  ,count = $("#count").val()
  ,flag = $("#flag").val();

  flow.load({
    elem: '#blogList' //指定列表容器
    ,end: ' '
    ,mb: 1200
    ,done: function(page, next){ //到达临界点（默认滚动触发），触发下一页
      var lis = [];
      setTimeout(function(){
        $.post(URL+'/flow',{page:page,limit:5,size:10}, function(data){
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
          //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
          next(lis.join(''), page < data.pages);
          scrollReveal.init();
        },'json');
      },500);
    }
  });

});