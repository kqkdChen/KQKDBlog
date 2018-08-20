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
    ,layout: ['prev', 'page', 'next', 'limit', 'count']
    ,limits: [5,8,10,15]
    ,theme: '#EB6841'
    ,count: count  //数据总数，从服务端得到
    ,jump: function(obj, first){
      var curr =  obj.curr //当前页
      ,limit = obj.limit; //每页条数
      if(!first){
        location.href = url+'/life'+'?page='+curr+'&limit='+ limit;
      }
    }
  });
  setTimeout('$("#layPage").show()',500);
  setTimeout('$("#footer").show()',300);
});