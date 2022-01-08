<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="BeanPackage.*"%>

<%@ page import="sql.*"%>
<%@ page import="java.util.ArrayList"%>




<html lang="fr">
<head>
<script src="https://api.mqcdn.com/sdk/mapquest-js/v1.3.2/mapquest.js"></script>
<link type="text/css" rel="stylesheet"
	href="https://api.mqcdn.com/sdk/mapquest-js/v1.3.2/mapquest.css" />


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>OpenStreetMap</title>
<link rel="stylesheet"
	href="https://unpkg.com/leaflet@1.5.1/dist/leaflet.css"
	integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
	crossorigin="" />
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


	<form style="border-style: dashed solid;" action="<%= request.getContextPath() %>/AjouterLieu">
	
		<label> <% 
		if(session.getAttribute("lieuOk")!=null){
			if (!(boolean)(session.getAttribute("lieuOk"))){
				session.setAttribute("lieuOk",null);
				out.print("Le lieu existe déjà. <br>");
			}else{
				out.print("Le lieu a bien été ajouté. <br>");
				session.setAttribute("lieuOk",null);

			}
		}
			%>
		</label>
	
		<input type="text" id="nomInput" name="nomInput" required>Nom du lieu</input><br>
		<label id='adresseLabel'>Adresse du lieu</label><br> <label
			id='latitudeLabel'>Latitude du lieu</label><br> <label
			id='longitudeLabel'>Longitude du lieu</label><br> <label
			id='villeLabel'>Ville du lieu</label><br> <input
			name="hiddenLat" type="hidden" id="hiddenLat" value=""></input> <input
			name="hiddenLng" type="hidden" id="hiddenLng" value=""></input> <input
			name="hiddenAdr" type="hidden" id="hiddenAdr" value=""></input> <input
			name="hiddenNom" type="hidden" id="hiddenNom" value=""></input> <input
			type="hidden" name="hiddenVille" id="hiddenVille" value=""></input>



		<button type="submit">Ajouter ce lieu</button>
	</form>


	<main>

		<input type="text" id="myInput" onkeyup="myFunction()"
			placeholder="Search for names.." />

		<table id="myTable" style="border-style: dashed solid;">
			<tr class="header">
				<th style="width: 60%;">City</th>
			</tr>



			<% 
  //On affiche toute les villes (max 15) mais elles sont toutes ici bien que caché
  SQLConnector sql=new SQLConnector();
  
  ArrayList<VilleBean> list= sql.getAllVille();
  
  int cpt=0;
  
  for(VilleBean v: list){
	  if(cpt>10){
		  out.print("<tr style='display:none' style='border-style: dashed solid;' onclick='trOnClick("+v.getLatitude()+","+v.getLongitude()+", \""+v.getNom()+"\")'>"+
				    "<td>"+v.getNom()+"</td>"+
				  "</tr>"
				  
				  );
	  }
	  else{
		  out.print("<tr style='border-style: dashed solid;' onclick='trOnClick("+v.getLatitude()+","+v.getLongitude()+",\""+v.getNom()+"\")'>"+
				    "<td>"+v.getNom()+"</td>"+
				  "</tr>"
				  
				  );
	  }
	  
	  
	  
	  cpt++;
  }
  
  
  
  
  
  
  %>







		</table>






	<form style="border-style: dashed solid;" action="<%= request.getContextPath() %>/AjouterActivite">
	
		<label for="lieuChoix">Lieu choisi </label>
		<input type="hidden" name="lieuChoix" required ><br>
	
	
	
	<input type="date" id="start" name="trip-start"
       value="2018-07-22"
       min="2022-01-01" max="2030-01-01"><br>
       
       
		<input type="time" id="hDebut" name="hDebut"
       min="00:00" max="23:59" required>

			<small>Heure de début de l'activité</small><br>
	
	<input type="time" id="hFin" name="hFin"
       min="00:00" max="23:59" required>

		<small>Heure de fin de l'activité</small><br>

	<button type="submit" >Valider l'activité</button>

</form>








<input type="text" id="myInput2" onkeyup="myFunction2()"
			placeholder="Search for LIEU.." />


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
  
  ArrayList<VilleBean> listLieu= sql.getAllLieu();
  
  cpt=0;
  
  for(VilleBean v: listLieu){
	  if(cpt>10){
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
	  
	  
	  
	  cpt++;
  }
  
  
  
  
  
  
  %>




		</table>
		
		
		


		<div id="maCarte" class="card"
			style="width: 50rem; border-style: dashed solid;"></div>



		<form>
			<div class="form-group">
				<input type="text" id="adresse">Adresse</input>

			</div>


			<button type="button" onClick="afficherAdresse()"
				class="btn btn-primary">Submit</button>
		</form>


		<aside>
			<div class="sidebar" border-style: dashed
				solid; id="showResultAdress"></div>

		</aside>


	</main>






	<!-- Fichiers Javascript -->
	<script src="https://unpkg.com/leaflet@1.5.1/dist/leaflet.js"
		integrity="sha512-GffPMF3RvMeYyc1LWMHtK8EbPv0iNZ8/oTtHPx9/cc2ILxQ+u905qIwdpULaqDkyBKgOaB57QTMg7ztg8Jm2Og=="
		crossorigin=""></script>
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
        	   
        	   
        	   System.out.println("Lat : "+v.getLatitude()+", long: "+v.getLongitude());	
        	   
               out.print(" marker = L.marker(["+v.getLatitude()+", "+v.getLongitude()+"]).addTo(carte).on('click',onClickMarker);"+
			"marker.bindPopup(\""+v.getNom()+":"+v.getVille()+":"+v.getAdresse()+"\");");
              
        
           }
           
           
           %>
           
           function onClickMarker(e){
        	   
        	   
        	   //TODO Remplir le formulaire pour ajouter une activité pss un lieu
        	   var pop=e.target.getPopup();
        	   
        	   
        	   
        	   var villeLabel=document.getElementById("villeLabel");
           	var latLabel=document.getElementById("latitudeLabel");
           	var lngLabel=document.getElementById("longitudeLabel");
           	var adresseLabel=document.getElementById("adresseLabel");
           	
           	
           	var hiddenLat=document.getElementById("hiddenLat");
           	var hiddenLng=document.getElementById("hiddenLng");
           	var hiddenAdr=document.getElementById("hiddenAdr");
           	var hiddenVille=document.getElementById("hiddenVille");

           	var nom=document.getElementById("nomInput");
           	var hiddenNom=document.getElementById("hiddenNom");
           	
           	
           	
        	   console.log(pop.getContent().split(":")[0]+","+pop.getContent().split(":")[0] );
        	   
             	villeLabel.textContent=pop.getContent().split(":")[1];
             	hiddenVille.value=pop.getContent().split(":")[1];

           	lngLabel.textContent=e.latlng.lng;
           	hiddenLng.value=e.latlng.lng;

           	latLabel.textContent=e.latlng.lat;
           	hiddenLat.value=e.latlng.lat;

           	adresseLabel.textContent=pop.getContent().split(":")[2];
           	hiddenAdr.value=pop.getContent().split(":")[2];

           	hiddenNom.value=pop.getContent().split(":")[0];
           	nom.value=pop.getContent().split(":")[0];
           	
        	   
           }
           
           

           
            
           
      
            
            
            var popup = L.popup();

            function onMapClick(e) {
            	 
            	 
            	 
                popup
                    .setLatLng(e.latlng)
                    .setContent("Vous avez cliqué ici ! Les informations ont été automatiquement remplis dans le formulaire pour ajouter le lieu." )
                    .openOn(carte);
                
               
             // the location we want to GeoCode

                // we are using MapQuest's Nominatim service
                var geocode = 'http://www.mapquestapi.com/geocoding/v1/reverse?key=67xKGEdrVPMYCuh1WCVgD8c5aUkNISUp&location='+e.latlng.lat+','+e.latlng.lng+'&includeRoadMetadata=true&includeNearestIntersection=true';
               // https://www.mapquestapi.com/geocoding/v1/address?key=67xKGEdrVPMYCuh1WCVgD8c5aUkNISUp&location=boulangerie%20nancy


            	var villeLabel=document.getElementById("villeLabel");
            	var latLabel=document.getElementById("latitudeLabel");
            	var lngLabel=document.getElementById("longitudeLabel");
            	var adresseLabel=document.getElementById("adresseLabel");
            	
            	
            	var hiddenLat=document.getElementById("hiddenLat");
            	var hiddenLng=document.getElementById("hiddenLng");
            	var hiddenAdr=document.getElementById("hiddenAdr");
            	var hiddenVille=document.getElementById("hiddenVille");

            	var nom=document.getElementById("nomInput");
            	var hiddenNom=document.getElementById("hiddenNom");

                // use jQuery to call the API and get the JSON results
                $.getJSON(geocode, function(data) {
                  console.log(data['results'][0]['locations']);
                  
              	villeLabel.textContent=data['results'][0]['locations'][0]['adminArea5'];
              	hiddenVille.value=data['results'][0]['locations'][0]['adminArea5'];

            	lngLabel.textContent=e.latlng.lng;
            	hiddenLng.value=e.latlng.lng;

            	latLabel.textContent=e.latlng.lat;
            	hiddenLat.value=e.latlng.lat;

            	adresseLabel.textContent=data['results'][0]['locations'][0]['street'];
            	hiddenAdr.value=data['results'][0]['locations'][0]['street'];

            	hiddenNom.value=nom.value;
                  //console.log(data);
                });

                
            }

            carte.on('click', onMapClick);

            
            
            
            function trOnClick(lat,lng,ville){

            	console.log(lng+","+lat)
            	
            	 popup
                 .setLatLng(L.latLng(lat, lng))
                 .setContent("You are in : "+ville)
                 .openOn(carte);
            	
            	carte.flyTo([lat,lng], 15);
            	
            	 

            }
            
            function trOnClick2(lat,lng,nom,adr,ville){

            	
            	 var villeLabel=document.getElementById("villeLabel");
                	var latLabel=document.getElementById("latitudeLabel");
                	var lngLabel=document.getElementById("longitudeLabel");
                	var adresseLabel=document.getElementById("adresseLabel");
                	
                	
                	var hiddenLat=document.getElementById("hiddenLat");
                	var hiddenLng=document.getElementById("hiddenLng");
                	var hiddenAdr=document.getElementById("hiddenAdr");
                	var hiddenVille=document.getElementById("hiddenVille");

                	var nome=document.getElementById("nomInput");
                	var hiddenNom=document.getElementById("hiddenNom");
                	
                	
                             	   
                  	villeLabel.textContent=ville;
                  	hiddenVille.value=ville;

                	lngLabel.textContent=lng;
                	hiddenLng.value=lng;

                	latLabel.textContent=lat;
                	hiddenLat.value=lat;

                	adresseLabel.textContent=adr;
                	hiddenAdr.value=adr;

                	hiddenNom.value=nom;
                	nome.value=nom;
                	
                	
            	
            	 popup
                 .setLatLng(L.latLng(lat, lng))
                 .setContent("You are in : "+ville)
                 .openOn(carte);
            	
            	carte.flyTo([lat,lng], 15);
            	
            	 

            }
            
         
            function myFunction() {
              // Declare variables
              var input, filter, table, tr, td, i, txtValue;
              input = document.getElementById("myInput");
              filter = input.value.toUpperCase();
              table = document.getElementById("myTable");
              tr = table.getElementsByTagName("tr");
				var cpt=0;
              // Loop through all table rows, and hide those who don't match the search query
              for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                  txtValue = td.textContent || td.innerText;
                  if (txtValue.toUpperCase().indexOf(filter) > -1 && cpt<10) {
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
  				var cpt=0;
                // Loop through all table rows, and hide those who don't match the search query
                for (i = 0; i < tr.length; i++) {
                  td = tr[i].getElementsByTagName("td")[0];
                  if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1 && cpt<10) {
                  	  cpt++;
                      tr[i].style.display = "";
                    } else {
                      tr[i].style.display = "none";
                    }
                  }
                }
              }
            
            function afficherAdresse(){
            	adressse=document.getElementById("adresse");
            	console.log(adresse.value);
            	
            	//On va regarder les lieux dispo pour cette adresse
            	 var geocode ='https://www.mapquestapi.com/geocoding/v1/address?key=67xKGEdrVPMYCuh1WCVgD8c5aUkNISUp&location='+adresse.value;
            	
            	var newGeocode= ' https://api-adresse.data.gouv.fr/search/?q='+adresse.value;

                 // use jQuery to call the API and get the JSON results
                 $.getJSON(newGeocode, function(data) {
                   console.log(data['features']);
                 	
                   
                   var node= document.getElementById("showResultAdress");

                   while (node.firstChild) {
                	   //On supprime tte les anciennes recherches
                	   node.removeChild(node.firstChild);
                	}
                   
                   
                   for(i=0;i<data['features'].length;i++){
                	   var lng=data["features"][i]["geometry"]["coordinates"][0];
                	   var lat=data["features"][i]["geometry"]["coordinates"][1];
                	   var ville=data["features"][i]["properties"]["city"];
                	   var codePostal=data["features"][i]["properties"]["citycode"];
                	   var context=data["features"][i]["properties"]["context"];
                	   var adrComplete=data["features"][i]["properties"]["label"];

                	   node.innerHTML += '<tr >';
                	   node.innerHTML += '<td> Ville : '+ville+'</td	><br>';
                	   node.innerHTML += '<td> Code postal : '+codePostal+'</td	><br>';
                	   node.innerHTML += '<td> Adresse complète : '+adrComplete+'</td	><br>';
                	   node.innerHTML += '<td> Plus d\'infos : '+context+'</td	><br>';
                  	   node.innerHTML +='<button onclick="carte.flyTo(['+lat+','+lng+'], 20)" >Aller</button> </tr> <br><br><br>';

                	  
                   }
                   //console.log(data);
                 });
            	
            }
            
            function placerSurMap(lng,lat,ville){
            	consol.log("je tp ");
            	
            	popup
                .setLatLng(L.latLng(lat, lng))
                .setContent("You are in : "+ville)
                .openOn(carte);
           	
           	carte.flyTo([lat,lng], 15);
            }
            
            
        </script>
</body>
</html>