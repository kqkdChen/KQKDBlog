$(document).ready(function () {

	//banner
  $('#banner').easyFader();
	//nav
	var oH2 = document.getElementById("mnavh"); 
	var oUl = document.getElementById("starlist");  
	oH2.onclick = function ()
	{
		var style = oUl.style;
		style.display = style.display == "block" ? "none" : "block";
		oH2.className = style.display == "block" ? "open" : ""
	}

  var url = window.location.href
  ,As=document.getElementById('starlist').getElementsByTagName('a');
  var obj = As[0];
  for(var i=1;i<As.length;i++){
    if(url.search('blog') > -1 || url.search('cate') > -1 || url.search('tag') > -1){
      obj=As[1];
    }else if(url.search('life') > -1){
      obj=As[2];
    }else if(url.search('down') > -1){
      obj=As[3];
    }else if(url.search('time') > -1){
      obj=As[4];
    }else if(url.search('about') > -1){
      obj=As[5];
    }else if(url.search('talk') > -1){
      obj=As[6];
    }
  }
  obj.id='selected';

  $("#starlist>li:nth-child(2)").addClass("menu");

  $(".menu").click(function(){
    $(".sub").toggle();
    $(".sub").addClass("disblo");
    $(".menu").toggleClass("open");

  });

//header
	var new_scroll_position = 0;
	var last_scroll_position;
	var header = document.getElementById("header");

	window.addEventListener('scroll', function(e) {
	  last_scroll_position = window.scrollY;
	  if (new_scroll_position < last_scroll_position && last_scroll_position > 80) {
		header.classList.remove("slideDown");
		header.classList.add("slideUp");
	  } else if (new_scroll_position > last_scroll_position) {
		header.classList.remove("slideUp");
		header.classList.add("slideDown");
	  }
	  new_scroll_position = last_scroll_position;
	});
  /*
  search
  */
  $('.search_ico').click(function () {
    $('.search_bar').toggleClass('search_open');
    if ($('#keyboard').val().length > 2) {
        $('#keyboard').val('');
        $('#searchform').submit();
    } else {
        return false;
    }
  });
	//scroll to top
  var offset = 300,
  offset_opacity = 1200,
  scroll_top_duration = 700,
  $back_to_top = $('.cd-top');

  $(window).scroll(function () {
      ($(this).scrollTop() > offset) ? $back_to_top.addClass('cd-is-visible') : $back_to_top.removeClass('cd-is-visible cd-fade-out');
      if ($(this).scrollTop() > offset_opacity) {
          $back_to_top.addClass('cd-fade-out');
      }
  });
  $back_to_top.on('click', function (event) {
      event.preventDefault();
      $('body,html').animate({
              scrollTop: 0
          }, scroll_top_duration
      );
  });
	


//scroll
  if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
      window.scrollReveal = new scrollReveal({reset: true});
  };
	
	//aside
    /*var Sticky = new hcSticky('aside', {
      stickTo: 'main',
      innerTop: 200,
      followScroll: false,
      queries: {
        480: {
          disable: true,
          stickTo: 'body'
        }
      }
    });*/
	
});