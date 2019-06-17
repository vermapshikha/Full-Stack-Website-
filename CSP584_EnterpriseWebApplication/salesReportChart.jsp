<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Food Treats</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/sticky.min.js"></script>
<script type="text/javascript" src="js/custom.js"></script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
	
		var obj = '<%= request.getAttribute("RestaurantSalesJson") %>';
		var jsonData = JSON.parse(obj); 
		
		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'RestaurantName');
		data.addColumn('number', 'TotalSales');
		
		for (var key in jsonData) {
		   var value = jsonData[key];
		   data.addRow([key, value]);
		}	
	
		// Set chart options
		var options = {
				'title':'Sales Report : Restaurant Name vs Sale Count',
				'width':1000,
				'height':1000
		};
	
		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>

<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
<title>Food Treats</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="css/main.css" />
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css"/><![endif]-->
<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
}

.carousel-inner {
	width: 100%;
	max-height: 300px !important;
}

table, th, td {
	border: 1px solid black;
	padding: 5px;
}

table {
	border-spacing: 15px;
}
</style>
</head>
<body class="landing">
	<div id="page-wrapper">
		<section style="background-color: #000">
			<!-- Header -->

			<header id="header" class="alt" style="background-color: #000">
				<h1>
					<a href="FoodTreatsHome">Food Treats</a>
				</h1>
			</header>

		</section>

		<br />
		<!-- Banner -->
		<section>

			<!-- Main -->
			<section class="box">
				<div class="row uniform 50%">
					<div class="2u">
						<ul>
							<ul class="alt">
								<li><a href="FoodTreatsHome">Home</a></li>
							</ul>
						</ul>
					</div>						
					<div id="chart_div">						
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