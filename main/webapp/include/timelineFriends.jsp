<!DOCTYPE html>
<%@ page import="BeanPackage.*"%>

    <%@ page import="sql.*"%>
        <%@ page import="java.util.ArrayList"%>
            <html lang="en">


            <head>
                <link rel="icon" href="<%= request.getContextPath() %>/template/images/fav.png" type="image/png" sizes="16x16">


                <link rel="stylesheet" href="<%= request.getContextPath() %>/template/css/main.min.css">
                <link rel="stylesheet" href="<%= request.getContextPath() %>/template/css/style.css">
                <link rel="stylesheet" href="<%= request.getContextPath() %>/template/css/color.css">
                <link rel="stylesheet" href="<%= request.getContextPath() %>/template/css/responsive.css">



                <% if(session.getAttribute("current_user")==null){
	request.getRequestDispatcher( "/include/landing.jsp" ).forward( request, response );

}
	%>
                    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <meta name="description" content="" />
                    <meta name="keywords" content="" />
                    <title>Winku Social Network Toolkit</title>


            </head>

            <body>
                <!--<div class="se-pre-con"></div>-->
                <div class="theme-layout">

                    <div class="responsive-header">
                        <div class="mh-head first Sticky">
                            <span class="mh-btns-left"> <a class="" href="#menu"><i
						class="fa fa-align-justify"></i></a>
				</span> <span class="mh-text"> <a href="newsfeed.html" title=""><img
						src="<%= request.getContextPath() %>/template/images/logo2.png"
						alt=""></a>
				</span> <span class="mh-btns-right"> <a class="fa fa-sliders"
					href="#shoppingbag"></a>
				</span>
                        </div>
                        <div class="mh-head second">
                            <form class="mh-form">
                                <input placeholder="search" />
                                <a href="#/" class="fa fa-search"></a>
                            </form>
                        </div>
                        <nav id="menu" class="res-menu">
                            <ul>
                               
                            </ul>
                        </nav>
                    </div>
                    <!-- responsive header -->

                    <div class="topbar stick">
                        <div class="logo">
                            <a title="" href="newsfeed.html"><img
					src="<%= request.getContextPath() %>/template/images/logo.png"
					alt=""></a>
                        </div>

                        <div class="top-area">
                            
                            
                            <div class="user-img">
                                <img src="https://picsum.photos/45/45" alt=""> <span class="status f-online"></span>
                                
                            </div>
                        </div>
                    </div>
                    <!-- topbar -->

                    <section>
                        <div class="feature-photo">
                            <figure>
                                <img src="https://picsum.photos/1366/400" alt="">
                            </figure>
                           
                            <div class="container-fluid">
                                <div class="row merged">
                                    <div class="col-lg-2 col-sm-3">
                                        <div class="user-avatar">
                                            <figure>
                                                <img src="https://picsum.photos/186/182" alt="">
                                              
                                            </figure>
                                        </div>
                                    </div>
                                    <div class="col-lg-10 col-sm-9">
                                        <div class="timeline-info">
                                            <ul>
                                                <li class="admin-name">
                                                    <h5><% 
													 UserBean u=(UserBean) session.getAttribute("current_user");

                                                    out.print(u.getNom()+" "+u.getPrenom()); %></h5> <span><%= u.getRang() %></span>
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
                                                            <li><i class="ti-user"></i> <a href="<%= request.getContextPath() %>/include/timelineFriends.jsp" title="">friends</a></li>
                                                            <li><i class="ti-user"></i> <a href="<%= request.getContextPath() %>/include/notifications.jsp" title="">Notifications</a></li>
                                                            <li><i class="ti-power-off"></i> <a href="landing.html" title="">Logout</a></li>
                                                        </ul>
                                                    </div>
                                                    <!-- Shortcuts -->
                                                    
                                                    <!-- profile intro widget -->

                                                </aside>
                                            </div>
                                            <!-- sidebar -->
                                            <div class="col-lg-6">
                                                <div class="central-meta">
                                                    <div class="frnds">
                                                        <ul class="nav nav-tabs">
                                                            <li class="nav-item"><a class="active" href="#frends" data-toggle="tab">My Friends</a> <span> <%
											 
											 
												//	System.out.println("Je vais afficher les amis de : "+u.getId());
													SQLConnector sql=new SQLConnector();
												 	
													 out.print(sql.getFriends(u.getId()).size());

									
											 %>
												</span></li>
                                                            <li class="nav-item"><a class="" href="#frends-req" data-toggle="tab">Friend request</a> <span> <%
												 	
													 out.print(sql.getFriendsRequest(u.getId()).size());
													 
													 
													 %>
												</span></li>
                                                        </ul>

                                                        <!-- Tab panes -->
                                                        <div class="tab-content">
                                                            <div class="tab-pane active fade show " id="frends">
                                                                <ul class="nearby-contct">
                                                                    <%

//											System.out.println("Je vais afficher les amis de : "+u.getId());
											ArrayList<Friend> list= sql.getFriends(u.getId());
											int cpt=0;
											for(Friend f : list){
												

												
												
												out.print(" <li>"+
												
														
														
														"<div class='nearly-pepls'>"+
														"<figure>"+
															"<a  title=''><img src=\" https://picsum.photos/"+(60+cpt)+"/"+(60+cpt)+" \" alt=''></a>"+
														"</figure>"+
														"<div class='pepl-info'>"+
																"<form method='post' action='"+ request.getContextPath() +"/AffichageAmi' id='show" +f.getId()+"'>"+

															"<input type='submit' href='time-line.html' title='' value='"+ f.getNom()+" "+f.getPrenom()+"' ></input>"
																	+"<input type='hidden' name='idToShow' value='"+ f.getId()+"'/>"
															+"</form><br>"+
																	"<h4><a href='time-line.html' title=''>"+" @"+f.getUsername()+" ("+f.getId()+")"+"</a></h4>"+

															"<span>"+f.getRole()+"</span>"+
															
																	
															"<form method='post' action='"+ request.getContextPath() +"/DeleteFriendServlet' id='delete" +f.getId()+"'>"+
																	"<input type='hidden'" +" value='"+f.getId()+"' name='idToDelete' "+"></input>"+

															"<input type='submit'" +" value='Delete' class='add-butn more-action' "+"></input>"+
												
															
														"</form></div>"+
													"</div> "+
														
												"</li>"
												);
												cpt++;
											}
											
											//															"<a href='"+request.getContextPath()+"/DeleteFriendServlet "+"' title='' class='add-butn more-action' data-ripple='' >unfriend</a>"

											
											
											
											
											
											
											%>


                                                                </ul>
                                                                <% // <div class="lodmore"><button class="btn-view btn-load-more"></button></div>%>
                                                            </div>
                                                            <div class="tab-pane fade" id="frends-req">
                                                                <ul class="nearby-contct">


                                                                    <%
											

											 session = request.getSession();
											 u=(UserBean) session.getAttribute("current_user");
											//System.out.println("Je vais afficher les requetes d'amis de : "+u.getId());
											 sql=new SQLConnector();
											for(Friend f : sql.getFriendsRequest(u.getId())){
												
												out.print(" <li>"+
														"<div class='nearly-pepls'>"+
														"<figure>"+
															"<a  title=''><img src=\" https://picsum.photos/"+(60+cpt)+"/"+(60+cpt)+" \" alt=''></a>"+
														"</figure>"+
														"<div class='pepl-info'>"+
																"<form method='post' action='"+ request.getContextPath() +"/AffichageAmi' id='show" +f.getId()+"'>"+

															" <input type='submit' href='time-line.html' title='' value='"+ f.getNom()+" "+f.getPrenom()+"' ></input>"
																	+"<input type='hidden' name='idToShow' value='"+ f.getId()+"'/>"
															+"</form><br>"+																	"<a  title=''>"+"@"+f.getUsername()+" ("+f.getId()+")"+"</a>"+

															"<span>"+f.getRole()+"</span>"+
															
															"<form method='post' action='"+ request.getContextPath() +"/CancelFriendServlet' id='cancel'>"+
															"<input type='hidden'" +" value='"+f.getId()+"' name='idToCancel' "+"></input>"+
																	"<input type='hidden'" +" value='"+2+"' name='redirectionPage' "+"></input>"+

															"<input type='submit'" +" value='Delete request' class='add-butn' "+"></input>"+
															
															
															"</form>"		+
															
															"<form method='post' action='"+ request.getContextPath() +"/ConfirmFriendServlet' id='confirm" +f.getId()+"'>"+
																	"<input type='hidden'" +" value='"+f.getId()+"' name='idToConfirm' "+"></input>"+

															"<input type='submit'" +" value='Confirm' class='add-butn' "+"></input>"+
															
																	
														"</form></div>"+
													"</div>"+
												"</li>"
												);
												cpt++;

											}
											
											
											
											
											
											
											%>



                                                                </ul>
                                                                <% // <button class="btn-view btn-load-more"></button> %>
                                                            </div>
                                                        </div>









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
										
                                         cpt=0;
										for(Friend f : list){
											

											
											
											out.print(
													"<li>"+
											"<figure>"+
											"<img src='https://picsum.photos/"+(60+cpt)+"/"+(60+cpt)+"' alt=''>"+
											"<span class='status f-online'></span>"+
										"</figure>"+
										"<div class='friendz-meta'>"+
												"<form method='post' action='"+ request.getContextPath() +"/AffichageAmi' id='show" +f.getId()+"'>"+

															" <label title='' value='' >"+ f.getNom()+" "+f.getPrenom()+"</label>"	+														
																	
																	
											"<br><i>@"+f.getUsername()+"</i>"+
										"</div>"+
									"</li>"
											);
											cpt++;
										}
										
										
										
										%>






                                                        </ul>


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
						alt=""></i>
                            </div>
                        </div>
                    </div>
                </div>
                </div>

                <!-- side panel -->


                <script src="<%= request.getContextPath() %>/template/js/main.min.js"></script>
                <script src="<%= request.getContextPath() %>/template/js/script.js"></script>
                <script src="<%= request.getContextPath() %>/template/js/map-init.js"></script>

            </body>


            </html>