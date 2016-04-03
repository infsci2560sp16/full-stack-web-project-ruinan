<!DOCTYPE html>
<html>
	<head>
	<#include "header.ftl">
	</head>

	<body>
		<div class="header">
			<div class="container">
				<div class="top-header">
						<div class="header-left">
							<p>${title}</p>
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

		<div  >
			<ul class="rslides" >
				<li>
					<div class="banner one">

							<div class="navigation">

									<ul class="nav1" id = "menu_1">
										<script>
										$(function () {
															 $.ajax({
															 url : "/api/showmenu",
															 type : "get",
															success : function(result) {
																	var items = JSON.parse(result);
																	console.log(result);
																	$("#menu_1").

																}// success
															});//ajax
										});//function

										</script>
										<li><a class="active" href="index.html">HOME</a></li>
										<li><a href="menu.html">MENU</a></li>

										<li><a href="contact.html">DELIVER</a></li>

									</ul>


							</div>



					</div>

				</li>
			</ul>
		</div>
	<!-- footer -->
		<div class="footer">
			<div class="container">
				<div class="footer-left">
					<p>Copyright &copy; 2016 Rui Nan  </p>
					<p>Web Homework  </p>
				</div>

				<div class="clearfix"></div>
			</div>
		</div>

<!-- //footer -->

	</body>
</html>
