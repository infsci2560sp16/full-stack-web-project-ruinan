<!DOCTYPE html>
<html>
	<head>
		<title>Orders</title>


		<link href="stylesheets/bootstrap.css" rel="stylesheet"/>
		<link href="stylesheets/style1.css" rel="stylesheet" type="text/css" media="all" />
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

		<meta name="RUiNan device" content="width=device-width, initial-scale=1"/>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script>
		 $(function () {
			 $.ajax({
	              url :"/api/orders",
	              type : "get",
	              success : function(result) {
	                  var items = JSON.parse(result);

 						
	                  $("#orders1").prepend(
	                      '<div class="order-top">'+
	                        '<ul>'+
	                          '<li class="data order-special-a">'+
	                          	'<h4>'+items[0].name +'</h4>'+
	                           ' <p> Lahma Bi Ajeen</p>'+
								'<P> Margherita</P>'+
							'	<P> Calzone</P>'+
								'<P> Stromboli</P>'+


	                          '</li>'+
	                         '<li class="data order-special">'+
	                         	'<h4>Price</h4 >'+
								 '<div class="special-info grid_1 simpleCart_shelfItem" id = "suborders">'+
	                     			'<div class="pre-top">'+
									'<div class="pr-left">'+
									'<div class="item_add"><h6>ONLY $3.00</h6></div>'+
								'</div>'+
								'<div class="pr-right">'+
									'<div class="item_add"><a href="#">Pick</a></div>'+
								'</div>'+
									'<div class="clearfix"></div>'+
							'</div>'+
							'<div class="pre-top">'+
								'<div class="pr-left">'+
									'<div class="item_add"><h6>ONLY $6.00</h6></div>'+
								'</div>'+
								'<div class="pr-right">'+
									'<div class="item_add"><a href="#">Pick</a></div>'+
								'</div>'+
									'<div class="clearfix"></div>'+
							'</div>'+
							'<div class="pre-top">'+
								'<div class="pr-left">'+
									'<div class="item_add"><h6>ONLY $7.00</h6></div>'+
								'</div>'+
								'<div class="pr-right">'+
								'	<div class="item_add"><a href="#">Pick</a></div>'+
								'</div>'+
									'<div class="clearfix"></div>'+
							'</div>'+
							'<div class="pre-top">'+
								'<div class="pr-left">'+
									'<div class="item_add"><h6>ONLY $9.00</h6></div>'+
								'</div>'+
								'<div class="pr-right">'+
									'<div class="item_add"><a href="#">Pick</a></div>'+
								'</div>'+
									'<div class="clearfix"></div>'+
							'</div>'+
                     			 '</div>'+

							'</li>'+
						'</ul>'+
						'<div class="clearfix">'+
						'</div>'+
						'</div>'


	                    );

	                }// success
				});//ajax
			});//function

			
			 $(function () {
			 $.ajax({
	              url :"/api/suborders",
	              type : "get",
	              success : function(result) {
	                  var items = JSON.parse(result);

					for ( var i = 0; i < items.length; i++) {
	                 	 $("#suborders").prepend(               
	                      '<div class="pre-top">'+
	                        '<div class="pr-left">'+
	                          '<div class="item_add"><h6>'+items[i].childNodes[0].firstChild.nodeValue+'</h6></div>'+
	                        '</div>'+
	                        '<div class="pr-right">'+
	                          '<div class="item_add"><a href="#">Pick</a></div>'+
	                        '</div>'+
	                          '<div class="clearfix"></div>'+
	                      '</div>'
	                   	 );
						}//FOR
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
							<p>${welcome}</p>
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

		<div  id="top" class="">
			<ul class="rslides" id="slider3">
				<li>
					<div class="banner one">

							<div class="navigation text-center">

									<ul class="nav1">
										<li><a href="index.html">HOME</a></li>

										<li><a class="active" href="menu.html">MENU</a></li>


										<li><a href="contact.html">DELIVER</a></li>


									</ul>


							</div>



					</div>

				</li>
			</ul>
		</div>
		<!-- orders -->
		<div class="orders">
			<div class="container"  id = "orders1">

			</div>
      <div class="clearfix"></div>
    </div>
		</div>
<!-- order -->

	</body>
</html>
