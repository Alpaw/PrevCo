<!DOCTYPE html>
<html lang="en">
<head>
<%@ page import="BeanPackage.*" %>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">




    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <title>Réseau Social PrevCo</title>
    <link rel="icon" href="<%= request.getContextPath() %>/template/images/fav.png" type="image/png" sizes="16x16">

    <link rel="stylesheet" href="<%= request.getContextPath() %>/template/css/main.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/template/css/style.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/template/css/color.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/template/css/responsive.css">

</head>


<%

 session = request.getSession();

if(session.getAttribute("current_user")==null){
	request.getRequestDispatcher( "/include/landing.jsp" ).forward( request, response );

}else{
	UserBean u= (UserBean) session.getAttribute("current_user");
	if(!(u.getRang().equals("administrateur"))){
		request.getRequestDispatcher( "/include/landing.jsp" ).forward( request, response );
	}
}	

%>


<body>
    <!--<div class="se-pre-con"></div>-->
    <div class="theme-layout">
        <div class="container-fluid pdng0">
            <div class="row merged">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="land-featurearea">
                        <div class="land-meta">
                            <h1>PrevCo</h1>
                            <p>
                                Préviens tes copains, préviens du covid.
                                <br> Sois connecté, reste en sécurité.
                            </p>
                            <div class="friend-logo">
                                <span><img src="<%= request.getContextPath() %>/template/images/wink.png" alt=""></span>
                            </div>
                            <a href="#" title="" class="folow-me">Follow Us on</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="login-reg-bg">
                        <div class="log-reg-area sign">
                            <h2 class="log-title">Choose an option</h2>
                            <form action="<%= request.getContextPath() %>/admin_dashboard/adminDashboard.jsp" method="post">
                            <button type="submit" class="btn btn-dark">Admin dashboard</button>
                            </form>
 								<form action="<%= request.getContextPath() %>/include/newsfeed.jsp" method="post">
                            <button type="submit" class="btn btn-secondary">Simple user</button>
                            </form>                            
                        </div>
                     
                    </div>
                </div>
            </div>
        </div>
    </div>

<%
/*
if ("POST".equalsIgnoreCase(request.getMethod())) {
    //Form was submitted.
    System.out.println("Congrats Bro . you have done a great job .");

} else {
    //It may be a GET request.
    System.out.println(" Bro . did you do a great job?? .");

}
*/

/*
System.out.println("CHECK");

String check_register = request.getParameter("registerBtn");
System.out.println("CHECK");
if(check_register!=null ){
    System.out.println("Congrats Bro . you have done a great job .");

}else{
	System.out.println("pas pressé");
}
*/
/*
if((request.getParameter("registerBtn") == null)?false:true){
    for(int i =0;i<=100;i++){
         out.println("Congrts Bro . you have done a great job .");
    }
}
else{
	
    out.println("Not pressed ?");

	
	<form name="form_logon" method="POST" action ="logonHome.jsp">
<input type="submit" value="Click for Finger Verification" name="btnLogon">
</form>
	
	
	
}
*/
%>



  <%   //je sais pas a quoi ça sert...
  //<script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script> %>
    <script src="<%= request.getContextPath() %>/template/js/main.min.js"></script>
    <script src="<%= request.getContextPath() %>/template/js/script.js"></script>
    <script src="jquery-3.2.1.min.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
  
	<script>
	function validation(){
		
		<% //return <%= (boolean) new SQLConnector().userExist(request.getParameter("email")) %>;
	
	}
	
	</script>
</body>

</html>