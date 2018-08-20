

layui.use(['flow'], function(){
  var flow = layui.flow
    ,$ = layui.jquery
  var URL = $("#url").val()
    ,count = $("#count").val()
    ,firstLimit = $("#firstLimit").val();
  flow.load({
    elem: '#life' //指定列表容器
    ,end: ' '
    ,mb: 200
    ,done: function(page, next) { //到达临界点（默认滚动触发），触发下一页
      var lis = [];
      setTimeout(function () {
        var limit = 4;
        var firstPage = firstLimit/limit;
        var pages = count % limit === 0 ? count/limit : count/limit+1;
        if(pages > firstPage){
            page += firstPage;
          $.post(URL + '/lifeFlow', {page: page, limit: limit, size: count}, function (data) {
            layui.each(data.blogList, function (index, blog) {
              lis.push(
                '<li class="anim" data-scroll-reveal="enter bottom over 1s"><div class="shareli"><a href="' + URL + '/blog/' + blog.id + '" target="_blank"> <i><img src="' + URL + '/' + blog.cover + '"></i>' +
                '<h2><b>'+ blog.title +'</b></h2>' +
                '<span>喜欢 | '+blog.likeNum+'</span></a></div></li>'
              );
            });
            scrollReveal.init();
            next(lis.join(''), page < pages);
          }, "json", false);
        }
      }, 400);
    }
  });
  setTimeout('$("#footer").show()',1200);
});
