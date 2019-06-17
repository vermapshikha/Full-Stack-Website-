<!DOCTYPE HTML>
<html>
<head>
<title>Food Treats</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body class="landing">
	<div id="page-wrapper">
		<section style="background-color: #000">
			<!-- Header -->

			<header id="header" class="alt" style="background-color: #000">
				<h1>
					<a href="FoodTreatsHome">Food Treats</a>
				</h1>
				<nav id="nav">
					<ul>
						<li><a href="FoodTreatsHome">Home</a></li>
						<li><a href="FoodTreatsSignout" class="button">Sign Out</a></li>
					</ul>
				</nav>
			</header>

		</section>

		<br />
		<!-- Banner -->
		<section>
			<!-- Main -->			
			<section class="box">
				<div class="row uniform 50%">
					<div class="2u">
					</div>

					<div class="7u">
						<%@ page import="java.util.*"%>
						<%@ page import="Project.*"%>
						<%
							Object id = request.getParameter("id");
						
							if(id == null)
							{
								id = request.getAttribute("id");
							}
						
							Restaurant selectedRestaurant = RestaurantDataStore.getInstance().restaurants.get(Integer.parseInt(id.toString()));
							if (selectedRestaurant == null) 
							{
						%>
								<h3>Invalid restaurant ID</h3>
						<%		
							}
							else
							{						
								
						%>
								<table style="width:100%">
								  <tr>
								    <td colspan="4" align="center"><h4>Menu</h4></td>							    
								  </tr>
								  <tr>
								  	<th>Name</th>
								  	<th>Price</th>
								  	<th>Quantity</th>
								  	<th></th>
								  </tr>
								  <%		
								  	for(MenuItem item : selectedRestaurant.resturantMenu.menuItems.values())
								  	{
								  %>
									  <tr>
									  	<form action="FoodTreatsCartManagement" method="post">
										    <td width="40%"><%=item.mealName %></td>
										    <td width="20%">$<%=item.mealPrice %></td>
										    <td width="20%"> 
												<input type="number" name="quantity" min="1" required>
											</td>	
											<td width="20%">
												<input type="hidden" name="itemname" Value="<%=item.mealName%>"/>
												<input type="hidden" name="resid" Value="<%=selectedRestaurant.id%>"/>
												<input type="submit" name="submitid" Value="AddToCart"/>
											</td>	
										</form>					    
									  </tr>
								  <%
								  	}
								  %>
								</table>
						<%
							}
						%>
					</div>
				<br />
			</div>
		</section>
			<!-- CTA -->

			<!-- Footer -->
			<footer id="footer">
				<ul class="icons">
					<li><a href="#" class="icon fa-twitter"><span
							class="label">Twitter</span></a></li>
					<li><a href="#" class="icon fa-facebook"><span
							class="label">Facebook</span></a></li>
					<li><a href="#" class="icon fa-instagram"><span
							class="label">Instagram</span></a></li>
					<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
					<li><a href="#" class="icon fa-dribbble"><span
							class="label">Dribbble</span></a></li>
					<li><a href="#" class="icon fa-google-plus"><span
							class="label">Google+</span></a></li>
				</ul>
				<ul class="copyright">
					<li>&copy; Food Treats</li>
					<li><a href="index.jsp"> Food Treats:</a> A place where you
						will find great quality of food</li>
				</ul>
			</footer>
	</div>

	<!-- Scripts -->
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.dropotron.min.js"></script>
	<script src="js/jquery.scrollgress.min.js"></script>
	<script src="js/skel.min.js"></script>
	<script src="js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="js/main.js"></script>

</body>
</html>