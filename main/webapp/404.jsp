<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
	<title>Winku Social Network Toolkit</title>
    <link rel="icon" href="images/fav.png" type="image/png" sizes="16x16"> 
    

                <link rel="stylesheet" href="<%= request.getContextPath() %>/template/css/main.min.css">
                <link rel="stylesheet" href="<%= request.getContextPath() %>/template/css/style.css">
                <link rel="stylesheet" href="<%= request.getContextPath() %>/template/css/color.css">
                <link rel="stylesheet" href="<%= request.getContextPath() %>/template/css/responsive.css">

</head>
<body>
<!--<div class="se-pre-con"></div>-->
<div class="theme-layout">
	<div class="container-fluid pdng0">
		<div class="row">
			<div class="col-lg-12">
				<div class="error-page">
					<div class="bg-image" style="background-image: url(<%= request.getContextPath() %>/template/images/resources/404.jpg)"></div>
					<div class="error-meta">
						<h1>whoops!</h1>
						<span>page introuvable ! </span>
						<a href="<%= request.getContextPath() %>/include/landing.jsp" title="" data-ripple="">Retourner sur le site</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
	<script src="js/main.min.js"></script>
	<script src="js/script.js"></script>

</body>	

</html>