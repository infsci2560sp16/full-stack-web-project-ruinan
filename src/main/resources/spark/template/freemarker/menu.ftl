<!DOCTYPE html>
<html>
	<head>
		<title>Menu</title>
		<link href="stylesheets/bootstrap.css" rel="stylesheet"/>
		<link href="stylesheets/style1.css" rel="stylesheet" type="text/css" media="all" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<meta name="RUiNan device" content="width=device-width, initial-scale=1"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<script >
		$(function () {
							 $.ajax({
               url : "/api/menu",
               type : "post",
              success : function(result) {
                  var items = JSON.parse(result);
                  console.log(result);
                  for ( var i = 0; i < items.length; i++) {
                    $("#menus").prepend(
                      '<div class="order-top">'+
                        '<ul>'+
                        '<li class="im-g"><a href="#"><img src="'+items[i].imageurl+'" class="img-responsive" alt=""></a></li>'+
                        '<li class="data">'+
                          '<h3>'+items[i].price+'</h3>'+
                          '<h4>'+items[i].name+'</h4>'+
                          '<p>'+items[i].content+'</p>'+
                        '</li>'+
                        '<li class="bt-nn">'+
                        '<a class="hvr-shutter-in-horizontal button" href="orders.html">EXPLORE</a>'+
                        '</li>'+
                      '</ul>'+
                      '<div class="clearfix"></div>'+
                      '</div>'
                      );
                    }// for
                }// success
							});//ajax
		});//function
		</script>
	<!-- head scripts-->


	</head>

	<body>
		<div class="header">
			<div class="container">
				<div class="top-header">
						<div class="header-left">
							<p>Welcome</p>
						</div>
						<div class="login-section">
							<ul>
								<li><a href="login.html">Login</a>  </li>
								<li><a href="register.html">Register</a> </li>
							</ul>
						</div>



				</div>
			</div>
		</div>
		<!-- //header -->
		<#include "submenu.ftl">

		<div class="menu">
			<div class="container">
				<div class="menu-info">
					<h3>${indicator}</h3>
					<div class="strip-line"></div>
				</div>

				<div class="our-menu-grids" id = "menus">

					</div>
				</div>
			</div>
		</div>
	</body>
</html>
