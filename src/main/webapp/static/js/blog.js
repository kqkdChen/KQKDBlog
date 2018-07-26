/**

 @Name：可圈可丶模块
 @Author：李陈
 @License：MIT
 @Site：
    
 */
layui.use(['flow'],function(exports){
  var $ = layui.jquery
  ,flow = layui.flow
  ,URL = $("#PageContext").val();
  
  //流加载
  flow.load({
	elem: '#blogList'
	,mb: '1000'
	,done: function(page, next){
	  var lis = [],size;
	  setTimeout(function () {
		if(page == 1){
			size = 6;
		}else{
			size = 4;
		}
	    $.post(URL+'/blog/list', {page:page, size:size, limit:13}, function(res){
	      layui.each(res.data, function(index, item){
	        lis.push(
	          '<div class="blogs" id="blogs">'+
	          '<h3 class="blogtitle"><a href="'+URL+'/blog/articles/'+item.id+' " target="_blank">'+item.title+'</a></h3>'+
	          '<span class="blogpic"><a href="/" title="">'+item.imgStr+'</a></span>'+
	          '<p class="blogtext">'+item.summary+'</p>'+
	          '<div class="bloginfo"><ul>'+
	          '<li class="author"><a href="/">杨青</a></li>'+
	          '<li class="lmname"><a href="/">学无止境</a></li>'+
	          '<li class="timer">'+item.releaseDateStr+'</li>'+
	          '<li class="view"><span>'+item.clickhit+'</span> 已阅读</li>'+
	          '<li class="like">9999</li>'+
	          '</ul></div></div>'
	    		  );
	        }); 
	      sr.sync(); //使异步加载的动画生效
	        //当前页数小于总页数才会继续加载
	        next(lis.join(''), page < res.pages); 
	    },'json');
	  },500);
	}
  });
  $("#blogList").trigger("create"); //重新渲染动画
});  
