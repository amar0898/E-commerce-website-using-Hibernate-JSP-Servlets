<%@page import="com.mycompany.ecommerce.website.entities.User"%>
<%
    User user1 = (User)session.getAttribute("current-user");
    
    
    
%>

<!doctype html>
<html lang=''>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script>
       (function($) {

  $.fn.menumaker = function(options) {
      
      var cssmenu = $(this), settings = $.extend({
        title: "Menu",
        format: "dropdown",
        breakpoint: 768,
        sticky: false
      }, options);

      return this.each(function() {
        cssmenu.find('li ul').parent().addClass('has-sub');
        if (settings.format != 'select') {
          cssmenu.prepend('<div id="menu-button">' + settings.title + '</div>');
          $(this).find("#menu-button").on('click', function(){
            $(this).toggleClass('menu-opened');
            var mainmenu = $(this).next('ul');
            if (mainmenu.hasClass('open')) { 
              mainmenu.hide().removeClass('open');
            }
            else {
              mainmenu.show().addClass('open');
              if (settings.format === "dropdown") {
                mainmenu.find('ul').show();
              }
            }
          });

          multiTg = function() {
            cssmenu.find(".has-sub").prepend('<span class="submenu-button"></span>');
            cssmenu.find('.submenu-button').on('click', function() {
              $(this).toggleClass('submenu-opened');
              if ($(this).siblings('ul').hasClass('open')) {
                $(this).siblings('ul').removeClass('open').hide();
              }
              else {
                $(this).siblings('ul').addClass('open').show();
              }
            });
          };

          if (settings.format === 'multitoggle') multiTg();
          else cssmenu.addClass('dropdown');
        }

        else if (settings.format === 'select')
        {
          cssmenu.append('<select style="width: 100%"/>').addClass('select-list');
          var selectList = cssmenu.find('select');
          selectList.append('<option>' + settings.title + '</option>', {
                                                         "selected": "selected",
                                                         "value": ""});
          cssmenu.find('a').each(function() {
            var element = $(this), indentation = "";
            for (i = 1; i < element.parents('ul').length; i++)
            {
              indentation += '-';
            }
            selectList.append('<option value="' + $(this).attr('href') + '">' + indentation + element.text() + '</option');
          });
          selectList.on('change', function() {
            window.location = $(this).find("option:selected").val();
          });
        }

        if (settings.sticky === true) cssmenu.css('position', 'fixed');

        resizeFix = function() {
          if ($(window).width() > settings.breakpoint) {
            cssmenu.find('ul').show();
            cssmenu.removeClass('small-screen');
            if (settings.format === 'select') {
              cssmenu.find('select').hide();
            }
            else {
              cssmenu.find("#menu-button").removeClass("menu-opened");
            }
          }

          if ($(window).width() <= settings.breakpoint && !cssmenu.hasClass("small-screen")) {
            cssmenu.find('ul').hide().removeClass('open');
            cssmenu.addClass('small-screen');
            if (settings.format === 'select') {
              cssmenu.find('select').show();
            }
          }
        };
        resizeFix();
        return $(window).on('resize', resizeFix);

      });
  };
})(jQuery);

$(document).ready(function() {
	$(".fa-search").click(function() {
	   $(".togglesearch").toggle();
	   $("input[type='text']").focus();
	 });
});

(function($){
$(document).ready(function(){

$(document).ready(function() {
  $("#cssmenu").menumaker({
    title: "Menu",
    format: "dropdown"
  });

  $("#cssmenu a").each(function() {
  	var linkTitle = $(this).text();
  	$(this).attr('data-title', linkTitle);
  });
});

});
})(jQuery);

       
   </script>
   <title>CSS MenuMaker</title>
   
<style>
@import url(http://fonts.googleapis.com/css?family=Raleway);
#cssmenu,
#cssmenu ul,
#cssmenu ul li,
#cssmenu ul li a,
#cssmenu #menu-button {
  margin: 0;
  padding: 0;
  border: 0;
  list-style: none;
  line-height: 1;
  display: block;
  position: relative;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
#cssmenu:after,
#cssmenu > ul:after {
  content: ".";
  display: block;
  clear: both;
  visibility: hidden;
  line-height: 0;
  height: 0;
}
#cssmenu #menu-button {
  display: none;
}
#cssmenu {
  width: auto;
  font-family: Raleway, sans-serif;
  line-height: 1;
}
#cssmenu > ul {
  background: black;
}
#cssmenu > ul > li {
  float: left;
  -webkit-perspective: 1000px;
  -moz-perspective: 1000px;
  perspective: 1000px;
}
#cssmenu.align-center > ul {
  font-size: 10px;
  text-align: center;
}
#cssmenu.align-center > ul > li {
  display: inline-block;
  float: none;
}
#cssmenu.align-right > ul > li {
  float: right;
}
#cssmenu > ul > li > a {
  padding: 16px 20px;
  font-size: 19px;
  color: #ffffff;
  letter-spacing: 1px;
  text-transform: uppercase;
  text-decoration: none;
  background: black;
  -webkit-transition: all .3s;
  -moz-transition: all .3s;
  -o-transition: all .3s;
  transition: all .3s;
  -webkit-transform-origin: 50% 0;
  -moz-transform-origin: 50% 0;
  transform-origin: 50% 0;
  -webkit-transform-style: preserve-3d;
  -moz-transform-style: preserve-3d;
  transform-style: preserve-3d;
}
#cssmenu > ul > li.active > a {
  color: white;
}
#cssmenu > ul > li:hover > a,
#cssmenu > ul > li > a:hover {
  color: green;
  -webkit-transform: rotateX(90deg) translateY(-23px);
  -moz-transform: rotateX(90deg) translateY(-23px);
  transform: rotateX(90deg) translateY(-23px);
  -ms-transform: none;
}
#cssmenu > ul > li > a::before {
  position: absolute;
  top: 100%;
  left: 0;
  z-index: -1;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  width: 100%;
  height: 100%;
  padding: 16px 20px;
  color: black;
  font-weight:bold;
  background: yellow;
  content: attr(data-title);
  -webkit-transition: background 0.3s;
  -moz-transition: background 0.3s;
  transition: background 0.3s;
  -webkit-transform: rotateX(-90deg);
  -moz-transform: rotateX(-90deg);
  transform: rotateX(-90deg);
  -webkit-transform-origin: 50% 0;
  -moz-transform-origin: 50% 0;
  transform-origin: 50% 0;
  -ms-transform: translateY(-18px);
}
#cssmenu > ul > li:hover > a::before,
#cssmenu > ul > li > a:hover::before {
    background: #ff3333;
}
#cssmenu.small-screen {
  width: 100%;
}
#cssmenu.small-screen > ul,
#cssmenu.small-screen.align-center > ul {
  width: 100%;
  text-align: left;
}
#cssmenu.small-screen > ul > li,
#cssmenu.small-screen.align-center {
  float: none;
  display: block;
  border-top: 1px solid rgba(100, 100, 100, 0.1);
}
#cssmenu.small-screen > ul > li:hover > a,
#cssmenu.small-screen > ul > li > a:hover {
  color: #dff2fa;
  -webkit-transform: none;
  -moz-transform: none;
  transform: none;
  -ms-transform: none;
}
#cssmenu.small-screen > ul > li > a::before {
  display: none;
}
#cssmenu.small-screen #menu-button {
  display: block;
  padding: 16px 20px;
  cursor: pointer;
  font-size: 14px;
  text-decoration: none;
  color: #ffffff;
  text-transform: uppercase;
  letter-spacing: 1px;
  background: #3db2e1;
}
#cssmenu.small-screen #menu-button:after {
  content: "";
  position: absolute;
  right: 20px;
  top: 17px;
  display: block;
  -webkit-box-sizing: content-box;
  -moz-box-sizing: content-box;
  box-sizing: content-box;
  border-top: 2px solid #ffffff;
  border-bottom: 2px solid #ffffff;
  width: 22px;
  height: 3px;
}
#cssmenu.small-screen #menu-button.menu-opened:after {
  border-top: 2px solid #dff2fa;
  border-bottom: 2px solid #dff2fa;
}
#cssmenu.small-screen #menu-button:before {
  content: "";
  position: absolute;
  right: 20px;
  top: 27px;
  display: block;
  width: 22px;
  height: 2px;
  background: #ffffff;
}
#cssmenu.small-screen #menu-button.menu-opened:before {
  background: #dff2fa;
}


.togglesearch{
  background: #E8E8E4;
  position: absolute;
  top: 54px;
  right: 28.7%;
  width: 350px;
  height: 65px;
  line-height: 60px;
  box-shadow: 0 0 10px rgba(0,0,0,0.5);
  border-top:4px solid #D80B15;
  display: none;
}
.togglesearch:before{
  content: "";
  position: absolute;
  top: -32px;
  right: 13px;
  border-left: 12px solid transparent;
  border-right: 12px solid transparent;
  border-top: 14px solid transparent;
  border-bottom: 14px solid #D80B15;
}
.togglesearch input[type="text"]{
  width: 200px;
  height:40px;
  padding: 5px 10px;
  margin-left: 23px;
  border: 1px solid #D80B15;
  outline: none;
  margin-top:-1px;
}
 input[type="submit"]{
  width: 80px;
  color:white;
  font-weight:bold;
  padding: 10px 10px;
  text-align: center;
  background-color: red;
  margin-top: -52px;
  margin-left: 224px;
  position:absolute;
  
}
.fa-search{
    color:white;
    margin-top: 17px;
    margin-right: 10px;
}
.fa{
    color:white;
}
</style>
   
</head>
<body>

<div id='cssmenu'>
<ul>
    <li><a href='index.jsp'>Apna Bazaar</a></li>
   <li class='active'><a href='index.jsp'><i class="fa fa-fw fa-home fa-lg"></i> Home</a></li>
   <li><a href='about.jsp'><i class="fa fa-fw fa-user fa-lg"></i> About</a></li>
   <li><a href='#'><i class="fa fa-fw fa-product-hunt fa-lg"></i> Products</a></li>
   <li><a href='#'><i class="fa fa-fw fa-list fa-lg"></i> Categories</a></li>
   
   <li><a href='#'><i class="fa fa-fw fa-envelope fa-lg"></i> Contact</a></li>
   
   <% 
    if(user1==null){
        
   %>
        
        
     <li style="float:right;">
         <a href="login.jsp" type="button"><i class="fa fa-fw fa-sign-in-alt fa-lg"></i> Log In</a>
     </li>
     <li style="float:right;">
        <a href="signup.jsp" type="button"><i class="fa fa-fw fa-user-plus fa-lg" aria-hidden="true"></i>  Sign Up</a>
     </li>
        
        <%
    }
    else{
      
       %>
      
     <li style="float:right;">
        <a href="LogoutServlet" type="button"><i class="fa fa-fw fa-sign-in-alt fa-lg"></i> Log Out</a>
     </li>
      <li style="float:right;">
        <a href="#!" type="button"><i class="fa fa-fw fa-user-circle-o fa-lg"></i> <%= user1.getUserName() %></a>
     </li>
       
       <%

    }
   
       %>
   
      <li class="searchbar" style="float:right;">
        <i class="fa fa-fw fa-search fa-lg"></i>
         <div class="togglesearch">
            <input type="text" placeholder=""/>
            <a href="https://www.youtube.com/" class="link1"><input class="btn btn-outline-dark btn-md btn-rounded btn-navbar waves-effect waves-light" type="submit" value="Search"/></a>
        </div>
    </li>
</ul>
    
    
    
  
</div>

</body>
<html>
