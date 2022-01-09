<!DOCTYPE html>
<html lang="en">
<%@ page import="BeanPackage.*"%>

    <%@ page import="sql.*"%>
        <%@ page import="java.util.ArrayList"%>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta name="description" content="" />
                <meta name="keywords" content="" />
                <title>Winku Social Network Toolkit</title>
                <link rel="icon" href="<%= request.getContextPath() %>/template/images/fav.png" type="image/png" sizes="16x16">

                <link rel="stylesheet" href="<%= request.getContextPath() %>/template/css/main.min.css">
                <link rel="stylesheet" href="<%= request.getContextPath() %>/template/css/style.css">
                <link rel="stylesheet" href="<%= request.getContextPath() %>/template/css/color.css">
                <link rel="stylesheet" href="<%= request.getContextPath() %>/template/css/responsive.css">

            </head>
            <% if(session.getAttribute("current_user")==null){

	request.getRequestDispatcher( "/include/landing.jsp" ).forward( request, response );

}

if(session.getAttribute("friend_to_show")==null){
	request.getRequestDispatcher( "/include/timelineFriends.jsp" ).forward( request, response );

}
%>

                <body>
                    <!--<div class="se-pre-con"></div>-->
                    <div class="theme-layout">

                        <div class="responsive-header">
                            <div class="mh-head first Sticky">
                                <span class="mh-btns-left"> 
				</span>
                            </div>
                            <div class="mh-head second">
                                <form class="mh-form">
                                    <input placeholder="search" />
                                    <a href="#/" class="fa fa-search"></a>
                                </form>
                            </div>


                        </div>
                        <!-- responsive header -->

                        <div class="topbar stick">
                            

                            <div class="top-area">
                                <ul class="main-menu">


                                </ul>
                                <ul class="setting-area">

                                    <li>
                                        <a href="#" title="Notification" data-ripple=""> <i class="ti-bell"></i><span>20</span>
                                        </a>
                                        <div class="dropdowns">
                                            <span>4 New Notifications</span>
                                            <ul class="drops-menu">
                                                <li><a href="notifications.html" title=""> <img
										src="<%= request.getContextPath() %>/template/images/resources/thumb-1.jpg"
										alt="">
										<div class="mesg-meta">
											<h6>sarah Loren</h6>
											<span>Hi, how r u dear ...?</span> <i>2 min ago</i>
										</div>
								</a> <span class="tag green">New</span></li>
                                                <li><a href="notifications.html" title=""> <img
										src="<%= request.getContextPath() %>/template/images/resources/thumb-2.jpg"
										alt="">
										<div class="mesg-meta">
											<h6>Jhon doe</h6>
											<span>Hi, how r u dear ...?</span> <i>2 min ago</i>
										</div>
								</a> <span class="tag red">Reply</span></li>
                                                <li><a href="notifications.html" title=""> <img
										src="<%= request.getContextPath() %>/template/images/resources/thumb-3.jpg"
										alt="">
										<div class="mesg-meta">
											<h6>Andrew</h6>
											<span>Hi, how r u dear ...?</span> <i>2 min ago</i>
										</div>
								</a> <span class="tag blue">Unseen</span></li>
                                                <li><a href="notifications.html" title=""> <img
										src="<%= request.getContextPath() %>/template/images/resources/thumb-4.jpg"
										alt="">
										<div class="mesg-meta">
											<h6>Tom cruse</h6>
											<span>Hi, how r u dear ...?</span> <i>2 min ago</i>
										</div>
								</a> <span class="tag">New</span></li>
                                                <li><a href="notifications.html" title=""> <img
										src="<%= request.getContextPath() %>/template/images/resources/thumb-5.jpg"
										alt="">
										<div class="mesg-meta">
											<h6>Amy</h6>
											<span>Hi, how r u dear ...?</span> <i>2 min ago</i>
										</div>
								</a> <span class="tag">New</span></li>
                                            </ul>
                                            <a href="notifications.html" title="" class="more-mesg">view
								more</a>
                                        </div>
                                    </li>


                                </ul>
                                <div class="user-img">
                                    <img src="https://picsum.photos/45/45" alt=""> <span class="status f-online"></span>

                                </div>
                                <span class="ti-menu main-menu" data-ripple=""></span>
                            </div>
                        </div>
                        <!-- topbar -->

                        <section>
                            <div class="feature-photo">
                                <figure>
                                    <img src="https://picsum.photos/1366/400" alt="">
                                </figure>
                                <div class="add-btn">

                                    <%
													
													UserBean us=(UserBean) session.getAttribute("current_user");
									UserBean usShow=(UserBean) session.getAttribute("friend_to_show");

									if(request.getAttribute("friend_to_show")!=null){
										 usShow=(UserBean) request.getAttribute("friend_to_show");

									}
									

									System.out.println(us.getId()+","+usShow.getId());
													SQLConnector sql=new SQLConnector();
													ArrayList<Friend> list=sql.getFriends((us.getId()));
													boolean ami=false;
													for(Friend f: list){
														if(f.getId() == usShow.getId() ){
															//Ils sont déjà amis
															ami=true;
															
														}
													}
													
													//On affiche le bouton envoyer demande si ils sont pas amis
													if(ami){
														out.print(""
																
																
																
																
																);
														
														out.print("<a class='underline' title='' data-ripple=''>Already Friend</a>");

														
														
													}else{
														
														int friendship=sql.getFriendship(us.getId(),usShow.getId());
														if(friendship==1){
															//user a deja envoyé sa demande
															out.print("<a class='underline' title='' data-ripple=''>Request send</a>"+
															
															"<form method='post' action='"+ request.getContextPath() +"/CancelFriendServlet' id='cancel' >"+
															"<input type='hidden'" +" value='"+usShow.getId()+"' name='idToCancel' "+"></input>"+
																	"<input type='hidden'" +" value='"+1+"' name='redirectionPage' "+"></input>"+

															"<input type='submit'" +" value='Refuser la demande' class='add-butn' "+"></input>");


														}else{
															
															int friendShip2= sql.getFriendship(usShow.getId(),us.getId());
															if(friendShip2==1){
																//User qu'on affiche à déjà envoyé sa demande
																out.print("<form method='post' action='"+ request.getContextPath() +"/AjouterAmisServlet' >"+
																		"<input type='hidden' name='idToAdd' value='"+usShow.getId()+"'>"+
																		"<input type='submit' class='underling' value='Ajouter utilisateur'>  </input>"
																		
																		
																		
																		+"</form>"+

																		
																		"<form method='post' action='"+ request.getContextPath() +"/CancelFriendServlet' id='cancel' >"+
																		"<input type='hidden'" +" value='"+usShow.getId()+"' name='idToCancel' "+"></input>"+
																				"<input type='hidden'" +" value='"+1+"' name='redirectionPage' "+"></input>"+

																		"<input type='submit'" +" value='Supprimer la demande' class='add-butn' "+"></input>"

																		
																
																		);
															}
															else{
																out.print("<form method='post' action='"+ request.getContextPath() +"/AjouterAmisServlet' >"+
																		"<input type='hidden' name='idToAdd' value='"+usShow.getId()+"'>"+
																		"<input type='submit' class='underling' value='Send request'>  </input>"
																		
																		
																		
																		+"</form>"

																		
																		
																		
																
																		);
															}
														
														
														
														

													}
													//<a href="#" title="" class="underline">Add Friend</a>

													
													//				<a href="#" title="" data-ripple="">Add Friend</a>
													}
													%>
                                        <span>1205 followers</span>
                                </div>

                                <div class="container-fluid">
                                    <div class="row merged">
                                        <div class="col-lg-2 col-sm-3">
                                            <div class="user-avatar">
                                                <figure>
                                                    <img src="https://picsum.photos/60/60" alt="">
                                                    
                                                </figure>
                                            </div>
                                        </div>
                                        <div class="col-lg-10 col-sm-9">
                                            <div class="timeline-info">
                                                <ul>
                                                    <li class="">


                                                        <h5>
                                                            <% UserBean uToShow=(UserBean) session.getAttribute("friend_to_show");
										if(uToShow!=null){
											out.print(uToShow.getPrenom()+" "+uToShow.getNom());
											out.print("<br> <span>"+uToShow.getRang()+"</span>");
										}
										else{
											request.getRequestDispatcher( "/include/timelineFriends.jsp" ).forward( request, response );

										}
									%>
                                                        </h5>
                                                    </li>
                                                    </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- top area -->

                        <section>
                            <div class="gap gray-bg">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="row" id="page-contents">
                                                <div class="col-lg-3">
                                                    <aside class="sidebar static">

                                                        <div class="widget">
                                                            <h4 class="widget-title">Shortcuts</h4>
                                                            <ul class="naves">
                                                                <li><i class="ti-clipboard"></i> <a href="<%= request.getContextPath() %>/include/newsfeed.jsp" title="">News feed</a></li>
                                                                <li><i class="ti-user"></i> <a href="<%= request.getContextPath() %>/include/timelineFriends.jsp	" title="">friends</a></li>
                                                                <li><i class="ti-user"></i> <a href="<%= request.getContextPath() %>/include/notifications.jsp" title="">Notifications</a></li>
                                                                <li><i class="ti-power-off"></i> <a href="<%= request.getContextPath() %>/include/landing.jsp" title="">
                                                            	
                                                            	<%
                                                            	UserBean u = (UserBean) session.getAttribute("current_user");
                                                            	out.print("<form method='post' action='"+ request.getContextPath() +"/DeconnexionServlet' >"+
																		
																		"<input type='submit' class='underling' value='Logout'>  </input>"
																		
																		
																		
																		+"</form>");
                                                            	
                                                            	%>
                                                            	</a></li>
                                                            </ul>
                                                        </div>
                                                        <!-- Shortcuts -->
                                                        <div class="widget">
                                                           
                                                                          <h4 class="widget-title">Derni&egrave;res activit&eacute;s</h4>
                                                            <ul class="activitiez">
                                                            
                                                            
                                                            	<%
                                                            	 sql=new SQLConnector();
                                                            	 u = (UserBean) session.getAttribute("current_user");
                                                            	ArrayList<ActiviteBean> listAc= sql.getAllActiviteByUser(u.getId());
                                                            	
                                                            	int cptAct=0;
                                                            	for(ActiviteBean a: listAc){
                                                            		
                                                            		if(cptAct<4){
	                                                            		out.print(
	                                                            		 "<li>"+
	                                                                     "<div class='activity-meta'>"+
	                                                                         "<i>"+a.getDate()+" : "+a.getDebut()+"</i> <span><a  title=''>"+a.getNom()+" a "+a.getVille()+" </a></span>"+
	                                                                         "<h6>"+
	                                                                             "termin&eacute; a "+a.getFin()+""+
	                                                                         "</h6>"+
	                                                                     "</div>"+
	                                                                 "</li>");
	                                                            	}
                                                            		cptAct++;
                                                            	}
                                                            	
                                                            	
                                                            	
                                                            	%>
                                                            
                                                               




                                                            </ul>
                                                        </div>
                                                        <!-- recent activites -->
                                                        <div class="widget stick-widget">
                                                            <h4 class="widget-title">Amis covid&eacute;s</h4>
                                                            <ul class="followers">
                                                            
                                                            
                                                            <%
                                                            int cpt1=0;
                                                            ArrayList<Friend> listCovid = sql.getCovidedFriends(u.getId());
                                                            for(Friend f: listCovid){
                                                            	
                                                            	out.print( "<li>"+
                                                                 "<figure>"+
                                                                     "<img src='https://picsum.photos/"+(cpt1+60)+"/"+(cpt1+60)+"' alt=''>"+
                                                                 "</figure>"+
                                                                 "<div class='friend-meta'>"+
                                                                     "<h4>"+
                                                                         "<a title=''>"+f.getNom()+" "+f.getPrenom()+"</a>"+
                                                                     "</h4>"+
                                                                     "<a  title='' class='underline'>"+f.getCovid()+" a "+f.getHeure()+"</a>"+
                                                                 "</div>"+
                                                            "</li>");
                                                            }
                                                            
                                                            cpt1++;
                                                            
                                                            %>
                                                                
                                                                
                                                                
                                                                
                                                            </ul>
                                                        </div>
                                                        <!-- who's following -->
                                                    </aside>
                                                </div>
                                                <!-- sidebar -->
                                                <div class="col-lg-6">
                                                    <div class="loadMore">
                                                        <div class="central-meta item">

                               
                                                        <%
                                                        ArrayList<ActiviteBean> listActFriends=sql.getAllActiviteByUser(Integer.parseInt((String)session.getAttribute("idToShow")));
                                                        
                                                        for(ActiviteBean act : listActFriends){
                                                        	UserBean uF  = sql.getFriend(Integer.parseInt((String)session.getAttribute("idToShow")));
                                                        	out.print(
                                                        	"<div class='user-post'>"+
                                                            "<div class='friend-info'>"+
                                                                "<figure>"+
                                                                    "<img src='https://picsum.photos/"+(cpt1+60)+"/"+(cpt1+60)+"' alt=''>"+
                                                                "</figure>"+
                                                                "<div class='friend-name'>"+
                                                                    "<ins>"+
																"<a  title=''>"+uF.getNom()+" "+uF.getPrenom()+"</a>"+
																"</ins>"+
                                                                    "<span>Le "+act.getDate()+" de "+act.getDebut()+" a "+act.getFin()+"</span>"+
	                                                                "</div>"+
	                                                                "<div class='post-meta'>"+
	                                                                   "<img src='images/resources/user-post.jpg' alt=''>"+
	                                                                    "<div class='description'>"+
	                                                                        "<p>"+
																				"Cet utilisateur &eacute;tait a "+act.getNom()+" a "+act.getAdresse()+" dans la ville "+act.getVille()+" "+
	                                                                        "</p>"+
	                                                                    "</div>"+
	                                                                "</div>"+
	                                                            "</div>"+
	                                                        "</div>");
                                                        	
                                                        	
                                                        }
                                                        
                                                        
                                                        %>


                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- centerl meta -->
                                                <div class="col-lg-3">
                                                    <aside class="sidebar static">
                                                       
                                                        <div class="widget friend-list stick-widget">
                                                             <h4 class="widget-title">Friends</h4>

                                                        <div id="searchDir"></div>
                                                        <ul id="people-list" class="friendz-list">

                                                            <%
										
										 list= sql.getFriends(u.getId());
										
                                         int cpt=0;
										for(Friend f : list){
											

											
											
											out.print(
													"<li>"+
											"<figure>"+
											"<img src='https://picsum.photos/"+(60+cpt1)+"/"+(60+cpt1)+"' alt=''>"+
											"<span class='status f-online'></span>"+
										"</figure>"+
										"<div class='friendz-meta'>"+
												"<form method='post' action='"+ request.getContextPath() +"/AffichageAmi' id='show" +f.getId()+"'>"+

															" <label title='' value='' >"+ f.getNom()+" "+f.getPrenom()+"</label>"	+														
																	
																	
											"<br><i>@"+f.getUsername()+"</i>"+
										"</div>"+
									"</li>"
											);
											cpt1++;
										}
										
										
										
										%>






                                                        </ul>
                                                            <div class="chat-box">
                                                                <div class="chat-head">
                                                                    <span class="status f-online"></span>
                                                                    <h6>Bucky Barnes</h6>
                                                                    <div class="more">
                                                                        <span><i class="ti-more-alt"></i></span> <span class="close-mesage"><i class="ti-close"></i></span>
                                                                    </div>
                                                                </div>
                                                                <div class="chat-list">
                                                                    <ul>
                                                                        <li class="me">
                                                                            <div class="chat-thumb">
                                                                                <img src="<%= request.getContextPath() %>/template/images/resources/chatlist1.jpg" alt="">
                                                                            </div>
                                                                            <div class="notification-event">
                                                                                <span class="chat-message-item"> Hi James! Please
																	remember to buy the food for tomorrow! I’m gonna be
																	handling the gifts and Jake’s gonna get the drinks </span> <span class="notification-date"><time
																		datetime="2004-07-24T18:18" class="entry-date updated">Yesterday
																		at 8:10pm</time></span>
                                                                            </div>
                                                                        </li>
                                                                        <li class="you">
                                                                            <div class="chat-thumb">
                                                                                <img src="<%= request.getContextPath() %>/template/images/resources/chatlist2.jpg" alt="">
                                                                            </div>
                                                                            <div class="notification-event">
                                                                                <span class="chat-message-item"> Hi James! Please
																	remember to buy the food for tomorrow! I’m gonna be
																	handling the gifts and Jake’s gonna get the drinks </span> <span class="notification-date"><time
																		datetime="2004-07-24T18:18" class="entry-date updated">Yesterday
																		at 8:10pm</time></span>
                                                                            </div>
                                                                        </li>
                                                                        <li class="me">
                                                                            <div class="chat-thumb">
                                                                                <img src="<%= request.getContextPath() %>/template/images/resources/chatlist1.jpg" alt="">
                                                                            </div>
                                                                            <div class="notification-event">
                                                                                <span class="chat-message-item"> Hi James! Please
																	remember to buy the food for tomorrow! I’m gonna be
																	handling the gifts and Jake’s gonna get the drinks </span> <span class="notification-date"><time
																		datetime="2004-07-24T18:18" class="entry-date updated">Yesterday
																		at 8:10pm</time></span>
                                                                            </div>
                                                                        </li>
                                                                    </ul>
                                                                    <form class="text-box">
                                                                        <textarea placeholder="Post enter to post..."></textarea>
                                                                        <div class="add-smiles">
                                                                            <span title="add icon" class="em em-expressionless"></span>
                                                                        </div>
                                                                        <div class="smiles-bunch">
                                                                            <i class="em em---1"></i> <i class="em em-smiley"></i> <i class="em em-anguished"></i> <i class="em em-laughing"></i>
                                                                            <i class="em em-angry"></i> <i class="em em-astonished"></i>
                                                                            <i class="em em-blush"></i> <i class="em em-disappointed"></i>
                                                                            <i class="em em-worried"></i> <i class="em em-kissing_heart"></i> <i class="em em-rage"></i>
                                                                            <i class="em em-stuck_out_tongue"></i>
                                                                        </div>
                                                                        <button type="submit"></button>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- friends list sidebar -->
                                                    </aside>
                                                </div>
                                                <!-- sidebar -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>


                        <!-- footer -->
                        <div class="bottombar">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12">
                                        <span class="copyright"><a target="_blank"
							href="https://www.templateshub.net">Templates Hub</a></span> <i><img
							src="images/credit-cards.png" alt=""></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- side panel -->

                    <script src="js/main.min.js"></script>
                    <script src="js/script.js"></script>

                </body>

</html>