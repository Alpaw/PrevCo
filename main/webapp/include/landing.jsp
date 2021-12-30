<!DOCTYPE html>
<html lang="en">
<head>
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
if(request.getAttribute("notCo")!=null){
	if((int)request.getAttribute("notCo")==0){
		request.setAttribute("notCo", 1);
		out.print("<script>alert('Mauvais identifiant ou mdp')</script>");

	}

}

if(request.getAttribute("formDone")==null){
	request.setAttribute("formDone",false);
	request.setAttribute("allOk",false);
}

if(request.getAttribute("mailAlreadyExist")!=null && !(boolean)request.getAttribute("formDone")){
	//System.out.println("Je test le already exist => "+request.getAttribute("mailAlreadyExist"));
	request.setAttribute("allOk",false);
	if((boolean)request.getAttribute("mailAlreadyExist")){
		request.setAttribute("allOk",false);
		out.print("<script>alert('Mail already exist')</script>");
	}
}
if((boolean)request.getAttribute("formDone") && request.getAttribute("allOk")!=null ){
	if( !(boolean)request.getAttribute("allOk")){
		out.print("<script>alert('Vous etes inscrit')</script>");
		request.setAttribute("allOk",true);
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
                            <h2 class="log-title">Login</h2>
                            <p>
                                Don’t use Winku Yet? <a href="#" title="">Take the tour</a> or <a href="#" title="">Join now</a>
                            </p>
                            <form method="post" action="<%= request.getContextPath() %>/LoginServlet" >
                                <div class="form-group">
                                    <input type="email" id="input" name="username" required="required" value="<%if(request.getParameter("username")!=null)  out.print(request.getParameter("username")); %>"
                                    pattern=".+@.+\..+"
                                    oninvalid="this.setCustomValidity('Type email')"
                                    oninput="this.setCustomValidity('')" />
                                    <label class="control-label" for="input">Email</label><i class="mtrl-select"></i>
                                </div>
                                <div class="form-group">	
							<input type="password" name="pass" required="required" value="<%if(request.getParameter("password")!=null)  out.print(request.getParameter("password"));%>"
									pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,12}$"
                                    oninvalid="this.setCustomValidity('1 maj,1 min,1 chiffre,1 symbole (!@#$%^&*_=+-), min 8 caract., max 12')"
       								oninput="this.setCustomValidity('')"
       								/>                                    <label class="control-label" for="input">Password</label><i class="mtrl-select"></i>
                                </div>
                                <div class="checkbox">
                                    <label>
								<input type="checkbox" checked="checked"/><i class="check-box"></i>Always Remember Me.
							  </label>
                                </div>
                                <a href="#" title="" class="forgot-pwd">Forgot Password?</a>
                                <div class="submit-btns">
                                    <button class="mtr-btn signin" type="submit"><span>Login</span></button>
                                    <button class="mtr-btn signup" type="button"><span>Register</span></button>
                                </div>
                            </form>
                        
                        
                        
                        </div>
                        <div class="log-reg-area reg">
                            <h2 class="log-title">Register</h2>
                            <p>
                                Don’t use Winku Yet? <a href="#" title="">Take the tour</a> or <a href="#" title="">Join now</a>
                            </p>
                            <form method="post" action="<%= request.getContextPath() %>/RegisterServlet" onsubmit="return validation()" >
                                <div class="form-group">
                                    <input type="text" required="required" name="prenom" pattern="[a-zA-Z]*-?[a-zA-Z]*"  value="<% if(request.getParameter("prenom")!=null) 
                                    																									out.print(request.getParameter("prenom")); %>"
                                    oninvalid="this.setCustomValidity('Prenom de type John-Doe ou John')"
                                    oninput="this.setCustomValidity('')"/>
                                    <label class="control-label" for="input">First Name</label><i class="mtrl-select"></i>
                                </div>
                                <div class="form-group">
                                    <input type="text" required="required" name="nom" pattern="[a-zA-Z]*-?[a-zA-Z]*" value="<% if(request.getParameter("nom")!=null)  out.print(request.getParameter("nom")); %>"
                                    oninvalid="this.setCustomValidity('Nom de type John-Doe ou John')"
                                    oninput="this.setCustomValidity('')"
                                     />
                                    <label class="control-label" for="input">Last Name</label><i class="mtrl-select"></i>
                                </div>
                                
                                <div class="form-group">
                                    <input type="text" required="required" name="date" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}" value="<% if(request.getParameter("date")!=null)  out.print(request.getParameter("date")); %>"
                                    oninvalid="this.setCustomValidity('AAAA-MM-JJ')"
                                    oninput="this.setCustomValidity('')"
                                     />
                                    <label class="control-label" for="input">Naissance (AAAA-MM-JJ)</label><i class="mtrl-select"></i>
                                </div>
                                
                                
                                <div class="form-group">
                                    <input type="text" required="required" name="username"
                                    pattern="[a-zA-Z0-9]*" value="<%if(request.getParameter("username")!=null)  out.print(request.getParameter("username")); %>"
                                    oninvalid="this.setCustomValidity('Que des caract. et des chiffres.')"
                                    oninput="this.setCustomValidity('')" />
                                    <label class="control-label" for="input">User Name</label><i class="mtrl-select" 
                                    ></i>
                                </div>
                                <div class="form-group">
                                    <input type="password" required="required" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,12}$"
                                    oninvalid="this.setCustomValidity('1 maj,1 min,1 chiffre,1 symbole (!@#$%^&*_=+-), min 8 caract., max 12')"
       								oninput="this.setCustomValidity('')" name="pass" value="<%if(request.getParameter("password")!=null)  out.print(request.getParameter("password"));%>"
       								/>
                                    <label class="control-label"  for="input">Password</label><i class="mtrl-select"></i>
                                </div>
                                <div class="form-radio">
                                    <div class="radio">
                                        <label>
								  <input type="radio" name="radio" value="M" <%
								  		if(request.getParameter("radio")!=null){
										  if(request.getParameter("radio").equals("M")){
											  out.print("checked");
										  }
								  		}
								  		 else{
											 
												out.print("checked");
											 }
								  %>
								  /><i class="check-box"></i>Male
								</label>
                                    </div>
                                    <div class="radio">
                                        <label>
								  <input type="radio" name="radio" value="F"
								  <%
							  		if(request.getParameter("radio")!=null){
										 if(!request.getParameter("radio").equals("M")){
											  out.print("checked");
										  }
							  		}
										
								  %>
								  
								  /><i class="check-box"></i>Female
								</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input name="email" type="email" required="required" pattern=".+@.+\..+" 
                                    value="<%if(request.getParameter("email")!=null)  out.print(request.getParameter("email")); %>"
                                    />
                                    <label class="control-label" for="input"><a href="https://wpkixx.com/cdn-cgi/l/email-protection" class="__cf_email__" data-cfemail="6c29010d05002c">[email&#160;protected]</a></label><i class="mtrl-select"></i>
                                
                                
                                </div>
                                <div class="checkbox">
                                    <label>
								<input type="checkbox" checked="checked" required="required"/><i class="check-box"></i>Accept Terms & Conditions ?
							  </label>
                                </div>
                                <a href="#" title="" class="already-have" >Already have an account</a>
                                <div class="submit-btns">
                                    <button type="submit"  class="mtr-btn signin"  style="padding: 5px 20px" name="registerBtn"  ><span>Register</span></button>
                                </div>
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
    
	<script>
	function validation(){
		
		<% //return <%= (boolean) new SQLConnector().userExist(request.getParameter("email")) %>;
	
	}
	
	</script>
</body>

</html>