<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
    <%@ page import="BeanPackage.*"%>

        <%@ page import="sql.*"%>
            <%@ page import="java.util.ArrayList"%>



                <head>
                    <% 
if(session.getAttribute("current_user")==null){
	request.getRequestDispatcher( "/include/landing.jsp" ).forward( request, response );

}

%>
                        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
                        <script src="https://api.mqcdn.com/sdk/mapquest-js/v1.3.2/mapquest.js"></script>
                        <link type="text/css" rel="stylesheet" href="https://api.mqcdn.com/sdk/mapquest-js/v1.3.2/mapquest.css" />


                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

                        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

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


                        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin="" />
                        <!-- CSS -->
                        <style>
                            body {
                                margin: 0
                            }
                            
                            #maCarte {
                                height: 100vh;
                            }
                        </style>


                </head>




                <body>
                    <!--<div class="se-pre-con"></div>-->
                    <div class="theme-layout">

                        <!-- responsive header -->

                        <div class="topbar stick">
                            <div class="logo">
                                <a title="" href="newsfeed.jsp"><img
					src="<%= request.getContextPath() %>/template/images/logo.png"
					alt=""></a>
                            </div>

                            <div class="top-area">

                               
                                <div class="user-img">
                                    <img src="https://picsum.photos/60/60" alt=""> <span class="status f-online"></span>

                                </div>

                            </div>
                        </div>
                        <!-- topbar -->

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
                                                                <li><i class="ti-clipboard"></i> <a href="<%= request.getContextPath()%>/include/newsfeed.jsp" title="">News feed</a></li>
                                                                <li><i class="ti-user"></i> <a href="<%= request.getContextPath() %>/include/timelineFriends.jsp" title="">friends</a></li>

                                                                <li><i class="ti-user"></i> <a href="<%= request.getContextPath() %>/include/notifications.jsp" title="">Notifications</a></li>
                                                                <li><i class="ti-power-off"></i> <a href="landing.html" title="">Logout</a></li>
                                                            </ul>
                                                        </div>
                                                        <!-- Shortcuts -->
                                                        <div class="widget">
                                                            <h4 class="widget-title">Derni&egrave;res activit&eacute;s</h4>
                                                            <ul class="activitiez">


                                                                <%
                                                            	SQLConnector sql=new SQLConnector();
                                                            	UserBean u = (UserBean) session.getAttribute("current_user");
                                                            	ArrayList<ActiviteBean> list= sql.getAllActiviteByUser(u.getId());
                                                            	
                                                            	int cptAct=0;
                                                            	for(ActiviteBean a: list){
                                                            		
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
                                                                     "<img src='https://picsum.photos/"+(cpt1+60) +"' alt=''>"+
                                                                 "</figure>"+
                                                                 "<div class='friend-meta'>"+
                                                                     "<h4>"+
                                                                         "<a  title=''>"+f.getNom()+" "+f.getPrenom()+"</a>"+
                                                                     "</h4>"+
                                                                     "<a  title='' class='underline'>"+f.getCovid()+" a "+f.getHeure()+"</a>"+
                                                                 "</div>"+
                                                            "</li>");
                                                            	cpt1++;
                                                            }
                                                            
                                                            
                                                            
                                                            %>




                                                            </ul>
                                                        </div>
                                                        <!-- who's following -->
                                                    </aside>
                                                </div>
                                                <!-- sidebar -->
                                                <div class="col-lg-6">
                                                    <div class="central-meta">

                                                        <main>
                                                        
                                                        
  																
  																<% if(!sql.verifCovid(u.getId())){
  																	
  																	
  																	out.print("Vous etes positif, declarez vous negatif apres votre quarantaine.<br>"+
  																			
  																			"<form style='border-style: dashed solid;' action='"+request.getContextPath() +"/JeSuisPasCovidServlet'>"+
  																	
  																	"<button type='submit' >JE SUIS NEGATIF JE PREVIENS TOUT LE MONDE</button>"+
  																	
  																	"</form>");
  																	
  																	
  																	
  																}else{
  																	out.print("<form style='border-style: dashed solid;' action='"+request.getContextPath() +"/JeSuisCovidServlet'>"+
  		  																	
  																	"<button type='submit' >JE SUIS POSITIF JE PREVIENS TOUT LE MONDE</button>"+
  																	
  																	"</form>");
  																}
  																
  																%>
  																

                                                            <form style="border-style: dashed solid;" action="<%= request.getContextPath() %>/RechercherUserServlet">
																<input type="text" name="recherche">

																<button type="submit" >Rechercher l'utilisateur</button>
																</form>
																	





                                                            <form style="border-style: dashed solid;" action="<%= request.getContextPath() %>/AjouterActiviteServlet">

                                                                <label id="lieuChoix">Lieu choisi </label>

                                                                <input type="hidden" name="hiddenLieuChoix" id="hiddenLieuChoix"><br>


                                                                <label id="adresseChoix">Adresse </label>
                                                                <input type="hidden" name="hiddenAdresseChoix" id="hiddenAdresseChoix"><br>

                                                                <label id="villeChoix">Ville </label>
                                                                <input type="hidden" name="hiddenVilleChoix" id="hiddenVilleChoix"><br>



                                                                <input type="date" id="dateActivite" name="dateStart" value="2022-01-01" min="2022-01-01" max="2030-01-01" required><br>


                                                                <input type="time" id="hDebut" name="hDebut" min="00:00" max="23:59" required>

                                                                <small>Heure de d&eacute;but de l'activit&eacute;</small><br>

                                                                <input type="time" id="hFin" name="hFin" min="00:00" max="23:59" required>

                                                                <small>Heure de fin de l'activit&eacute;</small><br>

                                                                <button type="submit">Valider l'activit&eacute;</button>

                                                            </form>








                                                            <input type="text" id="myInput2" onkeyup="myFunction2()" placeholder="Search for LIEU.." />


                                                            <table id="myTable2" style="border-style: dashed solid;">
                                                                <tr class="header">
                                                                    <th style="width: 30%;">Lieu</th>
                                                                    <th style="width: 30%;">Adresse</th>
                                                                    <th style="width: 20%;">Ville</th>
                                                                    <th style="width: 10%;">Latitude</th>
                                                                    <th style="width: 10%;">Longitude</th>

                                                                </tr>



                                                                <% 
                                                      //On affiche toute les villes (max 15) mais elles sont toutes ici bien que caché
                                                      
                                                      SQLConnector sql1=new SQLConnector();
                                                      ArrayList<VilleBean> listLieu= sql1.getAllLieu();
                                                      
                                                        cpt1=0;
                                                      
                                                      for(VilleBean v: listLieu){
                                                          if(cpt1>10){
                                                              out.print("<tr style='display:none' style='border-style: dashed solid;' onclick='trOnClick2("+v.getLatitude()+","+v.getLongitude()+",\""+v.getNom().replace("'","&#39;")+"\",\""+v.getAdresse().replace("'","&#39;")+"\" ,\""+v.getVille().replace("'","&#39;")+"\")'>"+
                                                                        "<td>"+v.getAdresse()+"</td>"+
                                                                        "<td>"+v.getVille()+"</td>"+
                                                                        "<td>"+v.getLatitude()+"</td>"+
                                                                        "<td>"+v.getLongitude()+"</td>"+
                                                    
                                                                      "</tr>"
                                                                      
                                                                      );
                                                          }
                                                          else{
                                                              out.print("<tr style='border-style: dashed solid;' onclick='trOnClick2("+v.getLatitude()+","+v.getLongitude()+",\""+v.getNom().replace("'","&#39;")+"\",\""+v.getAdresse().replace("'","&#39;")+"\" ,\""+v.getVille().replace("'","&#39;")+"\")'>"+
                                                                        "<td>"+v.getNom()+"</td>"+
                                                                        "<td>"+v.getAdresse()+"</td>"+
                                                                        "<td>"+v.getVille()+"</td>"+
                                                                        "<td>"+v.getLatitude()+"</td>"+
                                                                        "<td>"+v.getLongitude()+"</td>"+
                                                                      "</tr>"
                                                                      
                                                                      );
                                                          }
                                                          
                                                          
                                                          
                                                          cpt1++;
                                                      }
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      %>




                                                            </table>





                                                            <div id="maCarte" class="card" style="width: 37rem; border-style: dashed solid;"></div>



                                                            <form style='border-style: dashed solid;'>
                                                                <div class="form-group">
                                                                    <input type="text" id="adresse" placeholder="Adresse Ici " style="border:1px solid #000000; width:250px;">Adresse</input>

                                                                </div>


                                                                <button type="button" onClick="afficherAdresse()" class="btn btn-primary">Chercher des adresses</button>
                                                            </form>


                                                            <aside>
                                                                <div class="sidebar" border-style: dashed solid; id="showResultAdress"></div>

                                                            </aside>


                                                        </main>
                                                    </div>
                                                    <!-- add post new box -->
                                                    <div class="loadMore">
                                                        <div class="central-meta item">



                                                            <%
                                                            int uFtmp=-1;
                                                        ArrayList<ActiviteBean> listActFriends=sql.getFriendsActivity(u.getId());
                                                        int cpt=0;
                                                        for(ActiviteBean act : listActFriends){
                                                        	UserBean uF  = sql.getFriend(act.getUserId());
                                                        	if(uFtmp==-1){
                                                        		uFtmp=uF.getId();
                                                        	}
                                                        	out.print(
                                                        	"<div class='user-post'>"+
                                                            "<div class='friend-info'>"+
                                                                "<figure>"+
                                                                    "<img src='https://picsum.photos/"+(cpt+40)+"/"+(cpt+39)+"' alt=''>"+
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
																				"Votre ami &eacute;tait a "+act.getNom()+" a "+act.getAdresse()+" dans la ville "+act.getVille()+" "+
	                                                                        "</p>"+
	                                                                    "</div>"+
	                                                                "</div>"+
	                                                            "</div>"+
	                                                        "</div>");
                                                        	
                                                        	
                                                        	if(uFtmp!=uF.getId()){
                                                        	cpt++;
                                                        	}else{
                                                        		cpt++;
                                                        		uFtmp=uF.getId();
                                                        	}
                                                        	
                                                        	
                                                        }
                                                        
                                                        
                                                        %>








                                                        </div>





                                                    </div>
                                                </div>
                                                <!-- centerl meta -->
                                                <div class="col-lg-3">
                                                    <aside class="sidebar static">
                                                        <div class="widget">
                                                            <form style="border-style: dashed solid;" action="<%= request.getContextPath() %>/AjouterLieu">

                                                                <label> <% 
                                                                if(session.getAttribute("lieuOk")!=null){
                                                                    if (!(boolean)(session.getAttribute("lieuOk"))){
                                                                        session.setAttribute("lieuOk",null);
                                                                        out.print("Le lieu existe d&eacute;jà. <br>");
                                                                    }else{
                                                                        out.print("Le lieu a bien &eacute;t&eacute; ajout&eacute;. <br>");
                                                                        session.setAttribute("lieuOk",null);
                                                        
                                                                    }
                                                                }
                                                                    %>
                                                                </label>

                                                                <input type="text" id="nomInput" name="nomInput" required>Nom du lieu</input><br>
                                                                <label id='adresseLabel'>Adresse du lieu</label><br> <label id='latitudeLabel'>Latitude du lieu</label><br> <label id='longitudeLabel'>Longitude du lieu</label><br> <label id='villeLabel'>Ville du lieu</label><br>                                                                <input name="hiddenLat" type="hidden" id="hiddenLat" value=""></input> <input name="hiddenLng" type="hidden" id="hiddenLng" value=""></input> <input name="hiddenAdr" type="hidden" id="hiddenAdr"
                                                                    value=""></input> <input name="hiddenNom" type="hidden" id="hiddenNom" value=""></input> <input type="hidden" name="hiddenVille" id="hiddenVille" value=""></input>



                                                                <button type="submit">Ajouter ce lieu</button>
                                                            </form>
                                                        </div>


                                                        <div class="widget" style="width:80%;height:60%; overflow:scroll;">
                                                            <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." style="width:150px;" />

                                                            <table id="myTable" style="border-style: dashed solid;">
                                                                <tr class="header">
                                                                    <th style="width: 60%;">City</th>
                                                                </tr>



                                                                <% 
                                                      //On affiche toute les villes (max 15) mais elles sont toutes ici bien que caché
                                                      sql=new SQLConnector();
                                                      
                                                      ArrayList<VilleBean> list1= sql.getAllVille();
                                                      
                                                      int cpt2=0;
                                                      
                                                      for(VilleBean v: list1){
                                                          if(cpt2>10){
                                                              out.print("<tr style='display:none' style='border-style: dashed solid;' onclick='trOnClick("+v.getLatitude()+","+v.getLongitude()+", \""+v.getNom()+"\")'>"+
                                                                        "<td>"+v.getNom()+"</td>"+
                                                                      "</tr>"
                                                                      
                                                                      );
                                                          }
                                                          else{
                                                              out.print("<tr style='border-style: dashed solid;' onclick='trOnClick("+v.getLatitude()+","+v.getLongitude()+",\""+v.getNom()+"\")'>"+
                                                                        "<td>"+v.getNom()+"</td>"+
                                                                      "</tr>"           );
                                                          }
                                                          cpt2++;}
                                                      %>

                                                            </table>
                                                        </div>
                                                        <!-- page like widget -->

                                                        <div class="widget friend-list stick-widget">
                                                            <h4 class="widget-title">Friends</h4>
                                                            <div id="searchDir"></div>
                                                            <ul id="people-list" class="friendz-list">

                                                                <%
										
												 u = (UserBean) session.getAttribute("current_user");
										 ArrayList<Friend> listF= sql.getFriends(u.getId());
										int cpt3=0;
										for(Friend f : listF){
											

											
											
											out.print(
													"<li>"+
											"<figure>"+
											"<img src='https://picsum.photos/"+(cpt3+45)+"' alt=''>"+
											"<span class='status f-online'></span>"+
										"</figure>"+
										"<div class='friendz-meta'>"+
											"<a >"+f.getPrenom()+" "+f.getNom()+"</a>"+
											"<i>@"+f.getUsername()+"</i>"+
										"</div>"+
									"</li>"
											);
											cpt3++;
										}
										
										
										
										%>





                                                            </ul>
                                                            
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

                    <% // <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="< = request.getContextPath() > /template/js/main.min.js"></script> %>
                        <script src="<%= request.getContextPath() %>/template/js/script.js"></script>
                        <script src="<%= request.getContextPath() %>/template/js/map-init.js"></script>
                        <script src="<%= request.getContextPath() %> /template/js/main.min.js"></script>
                        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA8c55_YHLvDHGACkQscgbGLtLRdxBDCfI"></script>



                        <!-- Fichiers Javascript -->
                        <script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js" integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og==" crossorigin=""></script>
                        <script>
                            // On initialise la carte
                            var carte = L.map('maCarte').setView([48.692054, 6.184417], 13);

                            // On charge les "tuiles"
                            L.tileLayer('https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png', {
                                // Il est toujours bien de laisser le lien vers la source des données
                                attribution: 'données © <a href="//osm.org/copyright">OpenStreetMap</a>/ODbL - rendu <a href="//openstreetmap.fr">OSM France</a>',
                                minZoom: 1,
                                maxZoom: 20
                            }).addTo(carte);

                            //    let xmlhttp = new XMLHttpRequest();

                            //   xmlhttp.onreadystatechange = () => {
                            // La transaction est terminée ?
                            // if(xmlhttp.readyState == 4){
                            // Si la transaction est un succès
                            // if(xmlhttp.status == 200){
                            // On traite les données reçues
                            //  let donnees = JSON.parse(xmlhttp.responseText)

                            // On boucle sur les données (ES8)
                            //  Object.entries(donnees.agences).forEach(agence => {
                            // Ici j'ai une seule agence
                            // On crée un marqueur pour l'agence
                            //        let marker = L.marker([agence[1].lat, agence[1].lon]).addTo(carte)
                            //      marker.bindPopup(agence[1].nom)
                            // })
                            //  }//else{
                            // console.log(xmlhttp.statusText);
                            //}
                            //  }
                            //  }

                            //   xmlhttp.open("GET", "http://agence.test/liste_simple.php");

                            // xmlhttp.send(null);

                            <%
       
       listLieu=sql.getAllLieu();
       for(VilleBean v : listLieu){
           
           
           
           out.print(" marker = L.marker(["+v.getLatitude()+", "+v.getLongitude()+"]).addTo(carte).on('click',onClickMarker);"+
        "marker.bindPopup(\""+v.getNom()+":"+v.getVille()+":"+v.getAdresse()+"\");");
          
    
       }
       
       
       %>

                            function onClickMarker(e) {


                                //TODO Remplir le formulaire pour ajouter une activité pss un lieu
                                var pop = e.target.getPopup();




                                var labelLieuChoix = document.getElementById("lieuChoix");
                                var hiddenLieuChoix = document.getElementById("hiddenLieuChoix");

                                var labelAdresseChoix = document.getElementById("adresseChoix");
                                var hiddenAdresseChoix = document.getElementById("hiddenAdresseChoix");

                                var labelVilleChoix = document.getElementById("villeChoix");
                                var hiddenVilleChoix = document.getElementById("hiddenVilleChoix");


                                labelVilleChoix.textContent = pop.getContent().split(":")[1];
                                hiddenVilleChoix.value = pop.getContent().split(":")[1];

                                labelAdresseChoix.textContent = pop.getContent().split(":")[2];
                                hiddenAdresseChoix.value = pop.getContent().split(":")[2];

                                hiddenLieuChoix.value = pop.getContent().split(":")[0];
                                labelLieuChoix.textContent = pop.getContent().split(":")[0];


                            }









                            var popup = L.popup();

                            function onMapClick(e) {



                                popup
                                    .setLatLng(e.latlng)
                                    .setContent("Vous avez cliqué ici ! Les informations ont été automatiquement remplis dans le formulaire pour ajouter le lieu.")
                                    .openOn(carte);


                                // the location we want to GeoCode

                                // we are using MapQuest's Nominatim service
                                var geocode = 'http://www.mapquestapi.com/geocoding/v1/reverse?key=67xKGEdrVPMYCuh1WCVgD8c5aUkNISUp&location=' + e.latlng.lat + ',' + e.latlng.lng + '&includeRoadMetadata=true&includeNearestIntersection=true';
                                // https://www.mapquestapi.com/geocoding/v1/address?key=67xKGEdrVPMYCuh1WCVgD8c5aUkNISUp&location=boulangerie%20nancy


                                var villeLabel = document.getElementById("villeLabel");
                                var latLabel = document.getElementById("latitudeLabel");
                                var lngLabel = document.getElementById("longitudeLabel");
                                var adresseLabel = document.getElementById("adresseLabel");


                                var hiddenLat = document.getElementById("hiddenLat");
                                var hiddenLng = document.getElementById("hiddenLng");
                                var hiddenAdr = document.getElementById("hiddenAdr");
                                var hiddenVille = document.getElementById("hiddenVille");

                                var nom = document.getElementById("nomInput");
                                var hiddenNom = document.getElementById("hiddenNom");

                                // use jQuery to call the API and get the JSON results
                                $.getJSON(geocode, function(data) {
                                    console.log(data['results'][0]['locations']);

                                    villeLabel.textContent = data['results'][0]['locations'][0]['adminArea5'];
                                    hiddenVille.value = data['results'][0]['locations'][0]['adminArea5'];

                                    lngLabel.textContent = e.latlng.lng;
                                    hiddenLng.value = e.latlng.lng;

                                    latLabel.textContent = e.latlng.lat;
                                    hiddenLat.value = e.latlng.lat;

                                    adresseLabel.textContent = data['results'][0]['locations'][0]['street'];
                                    hiddenAdr.value = data['results'][0]['locations'][0]['street'];

                                    hiddenNom.value = nom.value;
                                    //console.log(data);
                                });


                            }

                            carte.on('click', onMapClick);




                            function trOnClick(lat, lng, ville) {

                                console.log(lng + "," + lat)

                                popup
                                    .setLatLng(L.latLng(lat, lng))
                                    .setContent("You are in : " + ville)
                                    .openOn(carte);

                                carte.flyTo([lat, lng], 15);



                            }

                            function trOnClick2(lat, lng, nom, adr, ville) {




                                var labelLieuChoix = document.getElementById("lieuChoix");
                                var hiddenLieuChoix = document.getElementById("hiddenLieuChoix");

                                var labelAdresseChoix = document.getElementById("adresseChoix");
                                var hiddenAdresseChoix = document.getElementById("hiddenAdresseChoix");

                                var labelVilleChoix = document.getElementById("villeChoix");
                                var hiddenVilleChoix = document.getElementById("hiddenVilleChoix");


                                labelVilleChoix.textContent = ville;
                                hiddenVilleChoix.value = ville;

                                labelAdresseChoix.textContent = adr;
                                hiddenAdresseChoix.value = adr;

                                hiddenLieuChoix.value = nom;
                                labelLieuChoix.textContent = nom;



                                popup
                                    .setLatLng(L.latLng(lat, lng))
                                    .setContent("You are at : " + nom)
                                    .openOn(carte);

                                carte.flyTo([lat, lng], 17);



                            }


                            function myFunction() {
                                // Declare variables
                                var input, filter, table, tr, td, i, txtValue;
                                input = document.getElementById("myInput");
                                filter = input.value.toUpperCase();
                                table = document.getElementById("myTable");
                                tr = table.getElementsByTagName("tr");
                                var cpt = 0;
                                // Loop through all table rows, and hide those who don't match the search query
                                for (i = 0; i < tr.length; i++) {
                                    td = tr[i].getElementsByTagName("td")[0];
                                    if (td) {
                                        txtValue = td.textContent || td.innerText;
                                        if (txtValue.toUpperCase().indexOf(filter) > -1 && cpt < 10) {
                                            cpt++;
                                            tr[i].style.display = "";
                                        } else {
                                            tr[i].style.display = "none";
                                        }
                                    }
                                }
                            }

                            function myFunction2() {
                                // Declare variables
                                var input, filter, table, tr, td, i, txtValue;
                                input = document.getElementById("myInput2");
                                filter = input.value.toUpperCase();
                                table = document.getElementById("myTable2");
                                tr = table.getElementsByTagName("tr");
                                var cpt = 0;
                                // Loop through all table rows, and hide those who don't match the search query
                                for (i = 0; i < tr.length; i++) {
                                    td = tr[i].getElementsByTagName("td")[0];
                                    if (td) {
                                        txtValue = td.textContent || td.innerText;
                                        if (txtValue.toUpperCase().indexOf(filter) > -1 && cpt < 10) {
                                            cpt++;
                                            tr[i].style.display = "";
                                        } else {
                                            tr[i].style.display = "none";
                                        }
                                    }
                                }
                            }

                            function afficherAdresse() {
                                adressse = document.getElementById("adresse");
                                console.log(adresse.value);

                                //On va regarder les lieux dispo pour cette adresse
                                var geocode = 'https://www.mapquestapi.com/geocoding/v1/address?key=67xKGEdrVPMYCuh1WCVgD8c5aUkNISUp&location=' + adresse.value;

                                var newGeocode = ' https://api-adresse.data.gouv.fr/search/?q=' + adresse.value;

                                // use jQuery to call the API and get the JSON results
                                $.getJSON(newGeocode, function(data) {
                                    console.log(data['features']);


                                    var node = document.getElementById("showResultAdress");

                                    while (node.firstChild) {
                                        //On supprime tte les anciennes recherches
                                        node.removeChild(node.firstChild);
                                    }


                                    for (i = 0; i < data['features'].length; i++) {
                                        var lng = data["features"][i]["geometry"]["coordinates"][0];
                                        var lat = data["features"][i]["geometry"]["coordinates"][1];
                                        var ville = data["features"][i]["properties"]["city"];
                                        var codePostal = data["features"][i]["properties"]["citycode"];
                                        var context = data["features"][i]["properties"]["context"];
                                        var adrComplete = data["features"][i]["properties"]["label"];

                                        node.innerHTML += '<tr style="border:1px solid #000000" >';
                                        node.innerHTML += '<td> Ville : ' + ville + '</td	><br>';
                                        node.innerHTML += '<td> Code postal : ' + codePostal + '</td	><br>';
                                        node.innerHTML += '<td> Adresse complète : ' + adrComplete + '</td	><br>';
                                        node.innerHTML += '<td> Plus d\'infos : ' + context + '</td	><br>';
                                        node.innerHTML += '<button onclick="carte.flyTo([' + lat + ',' + lng + '], 20)" >Aller</button> </tr> <br><br><br>';


                                    }
                                    //console.log(data);
                                });

                            }

                            function placerSurMap(lng, lat, ville) {
                                consol.log("je tp ");

                                popup
                                    .setLatLng(L.latLng(lat, lng))
                                    .setContent("You are in : " + ville)
                                    .openOn(carte);

                                carte.flyTo([lat, lng], 17);
                            }
                        </script>
                </body>

                </html>