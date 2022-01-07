package sql;

import BeanPackage.Friend;
import BeanPackage.NotificationBean;
import BeanPackage.UserBean;
import BeanPackage.VilleBean;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SQLConnector {
	
		public SQLConnector() {
			
		}
		
		public void createTables() {
			Connection con = connect();
			Statement stmt;
			try {
				stmt = con.createStatement();
				
				String rqFriendship = "CREATE TABLE IF NOT EXISTS `friendship` (\n"
						 + "  `id` int(255) NOT NULL AUTO_INCREMENT,\n"
						 + "  `userId1` int(255) NOT NULL,\n"
						 + "  `userId2` int(255) NOT NULL,\n"
						 + "  `status` int(255) NOT NULL,\n"
						 + "  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,\n"
						 + "  PRIMARY KEY (`id`)\n"
						 + ") ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;"
						 ;
				String rqStatus = "CREATE TABLE IF NOT EXISTS `status` (\n"
						+ "  `id` int(255) NOT NULL UNIQUE,\n"
						+ "  `status` varchar(255) COLLATE utf8_bin NOT NULL\n"
						+ ") ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;"
						;
				
				String rqStatusIns = "INSERT INTO `status` (`id`, `status`) VALUES\n"
						+ "(1, 'request send'),\n"
						+ "(2, 'friends'),\n"
						+ "(3, 'request cancelled');";
				
				String rqUser = "CREATE TABLE IF NOT EXISTS `user` (\n"
						+ "  `id` bigint(20) NOT NULL AUTO_INCREMENT,\n"
						+ "  `username` varchar(255) COLLATE utf8_bin NOT NULL,\n"
						+ "  `email` varchar(255) COLLATE utf8_bin NOT NULL,\n"
						+ "  `password` varchar(255) COLLATE utf8_bin NOT NULL,\n"
						+ "  `date_creation` date NOT NULL,\n"
						+ "  `nom` varchar(255) COLLATE utf8_bin NOT NULL,\n"
						+ "  `role` varchar(255) COLLATE utf8_bin NOT NULL,\n"
						+ "  `sexe` varchar(10) COLLATE utf8_bin NOT NULL,\n"
						+ "  `prenom` varchar(255) COLLATE utf8_bin NOT NULL,\n"
						+ "  `naissance` date NOT NULL,\n"
						+ "  PRIMARY KEY (`id`),\n"
						+ "  UNIQUE KEY `email` (`email`)\n"
						+ ") ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;";
				
				stmt.executeUpdate(rqFriendship);
				stmt.executeUpdate(rqStatus);
				stmt.executeUpdate(rqStatusIns);
				stmt.executeUpdate(rqUser);
			    con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		
		
		public boolean userExist(String email) {
			boolean res=false;
			String rqString = "Select * from User where email='"+email+"'";
			ResultSet resRq = doRequest(rqString);
			if(resRq!=null) {
				try {
					res=!(resRq.next()==false);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			//System.out.println(email+" est : "+res);
			
			return res;
			
		}
		
		
		//public List<>
		
		
		public UserBean getUser(String email, String password) {
			
			   UserBean user = null;
			   
			   String rqString = "Select * from User where email='"+email+"' and password='"+password+"';";
			   ResultSet res = doRequest(rqString);
			   
			   System.out.println(rqString);
			   int i = 0;
			   try {
				   while(res.next()) {
					   if(i==0) {
						   user = new UserBean();
						   user.setUsername(res.getString("username"));
						   user.setPassword(res.getString("password"));
						   user.setNom(res.getString("nom"));
						   user.setPrenom(res.getString("prenom"));
						   user.setRang(res.getString("role"));
						   
						   user.setSexe(res.getString("sexe"));
						   user.setDate(res.getDate("date_creation"));
						   user.setId(res.getInt("id"));
						   user.setEmail(res.getString("email"));



					   }
					   else {
						   i++;
						   arret("Plus d'un utilisateur ayant le meme login ???");
					   }

				   }
				} 
			   catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			   
			   return user;
		   }
		   
		public void createUser(String email, String password, String nom,String username,String sexe,String prenom, java.sql.Date dateN ) {
			
			   Connection con = connect();
			   java.util.Date date = new java.util.Date();
			   java.sql.Date sqlDate = new Date(date.getTime());
			   
			    try {
			    	Statement stmt = con.createStatement();
			    	String rqString = "INSERT INTO User (id,username,email,password,date_creation,nom,role,sexe,prenom,naissance) VALUES (0,"
			    			+"'" +username+"' ,'"+email.toLowerCase()+"','"+password+"','"+sqlDate+"','"+nom+"','basic_user','"+sexe+"','"+prenom+"','"+dateN+"')";
					//System.out.println(rqString);
			    	stmt.executeUpdate(rqString);
				    con.close();

					
				} 
			    catch (SQLException e) {
					e.printStackTrace();
				}
			    
		   }
		   
		   
		   public  ResultSet doRequest(String sql_string) {
			   ResultSet results = null;
			   Connection con = connect();
			   try {
				   Statement stmt = con.createStatement();
				   results = stmt.executeQuery(sql_string);
				} catch (SQLException e) {
				   e.printStackTrace();
				}
			  
			   return results;
		   }
		   
		   public  void doUpdate(String sql_string) {
			 //  ResultSet results = null;
			   Connection con = connect();
			   try {
				   Statement stmt = con.createStatement();
				    stmt.executeUpdate(sql_string);
				} catch (SQLException e) {
				   e.printStackTrace();
				}
			  
			   //return results;
		   }
		   
		 
		   public static Connection connect() {
			   
			   Connection con = null;
			   
			   try {
				   Class.forName("com.mysql.jdbc.Driver");
			   }
			   catch (Exception e) {
			         arret("Impossible de charger le pilote jdbc : "+e);
			   }

			 //  affiche("connexion a la base de données");
			   
			   try {
			         String DBurl = "jdbc:mysql://localhost:3306/prevco";
			         con = DriverManager.getConnection(DBurl,"root","");
			       //  affiche("connexion réussie");
			   } 
			   catch (SQLException e) {
			         arret("Connection à la base de données impossible");
			   }
			   
			   return con;
		   }
		   
		   public static void main (String[] args) {
			   connect();
		   }
		   
		   
		   private static void affiche(String message) {
			      System.out.println(message);
		   }

		   
		   
		   private static void arret(String message) {
			      System.err.println(message);
			      System.exit(99);
		   }
		   
		   public ArrayList<Friend> getFriends(int idUser){
			   ArrayList<Friend> res=new ArrayList<Friend>();
			   //Status=2 friend
			   String req="SELECT * FROM FRIENDSHIP WHERE USERID1='"+idUser+"' AND STATUS='2'";
			  // System.out.println("Je fais la requete : "+ req);
			   ResultSet rs=doRequest(req);
			   
			   try {
				while(rs.next()) {
					//Ici on récupère les infos de l'user avec qui il est ami
					req="SELECT nom,prenom,id,username,role FROM USER WHERE id='"+rs.getInt("userId2")+"'";
					ResultSet rsF=doRequest(req);
					  // System.out.println("Je fais la requete 2 : "+ req);

					
					
					Friend f=new Friend();
					if(rsF.next()) {
						f.setId(rsF.getInt("id"));;
						f.setNom(rsF.getString("nom"));
						f.setPrenom(rsF.getString("prenom"));
						f.setUsername(rsF.getString("username"));
						f.setRole(rsF.getString("role"));

						res.add(f);

					}

				   }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			   
			   
			   return res;
			   
		   }
		   
		   
		   public ArrayList<Friend> getFriendsRequest(int idUser){
			   ArrayList<Friend> res=new ArrayList<Friend>();
			   //Status=2 friend
			   String req="SELECT * FROM FRIENDSHIP WHERE USERID2='"+idUser+"' AND STATUS='1'";
			  // System.out.println("Je fais la requete : "+ req);
			   ResultSet rs=doRequest(req);
			   
			   try {
				while(rs.next()) {
					//Ici on récupère les infos de l'user qui lui a envoye la request
					req="SELECT nom,prenom,id,username,role FROM USER WHERE id='"+rs.getInt("userId1")+"'";
					ResultSet rsF=doRequest(req);
				//	   System.out.println("Je fais la requete 2 : "+ req);

					
					
					Friend f=new Friend();
					if(rsF.next()) {
						f.setId(rsF.getInt("id"));;
						f.setNom(rsF.getString("nom"));
						f.setPrenom(rsF.getString("prenom"));
						f.setUsername(rsF.getString("username"));
						f.setRole(rsF.getString("role"));

						res.add(f);

					}

				   }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			   
			   
			   return res;
			   
		   }
		   
		  
		   
		   public void deleteFriend(int id1, int id2) {
			   String req="DELETE FROM FRIENDSHIP WHERE  USERID1='"+id1+"' AND userid2='"+id2+"' AND STATUS='2'";
				doUpdate(req);
				    req="DELETE FROM FRIENDSHIP WHERE  USERID1='"+id2+"' AND userid2='"+id1+"' AND STATUS='2'";
					doUpdate(req);

		   }
		   
		   
		   public void deleteUser(int id) {
			   String req="DELETE FROM USER WHERE  ID='"+id+"'";
				doUpdate(req);

		   }
		   
		   
		   public void confirmFriend(int id1, int id2) {
			   String req="DELETE FROM FRIENDSHIP WHERE  USERID1='"+id2+"' AND userid2='"+id1+"' AND STATUS='1'";
			   String req2="DELETE FROM FRIENDSHIP WHERE  USERID1='"+id1+"' AND userid2='"+id2+"' AND STATUS='1'";

			   doUpdate(req);
			   doUpdate(req2);

			   String req1="INSERT INTO FRIENDSHIP (`id`, `userId1`, `userId2`, `status`, `createdAt`) VALUES (0,'"+id1+"','"+id2+"','2',CURRENT_TIMESTAMP)";
			   doUpdate(req1);
			   req1="INSERT INTO FRIENDSHIP (`id`, `userId1`, `userId2`, `status`, `createdAt`) VALUES (0,'"+id2+"','"+id1+"','2',CURRENT_TIMESTAMP)";
			   doUpdate(req1);


		   }



		public void cancelFriend(int id1, int id2) {
			   String req="DELETE FROM FRIENDSHIP WHERE  USERID1='"+id2+"' AND userid2='"+id1+"' AND STATUS='1'";
			   String req1="DELETE FROM FRIENDSHIP WHERE  USERID1='"+id1+"' AND userid2='"+id2+"' AND STATUS='1'";

			   doUpdate(req);
			   doUpdate(req1);

		}
		
		public UserBean getFriend(int id) {
			
			   UserBean user = null;
			   
			   String rqString = "Select * from User where id='"+id+"';";
			   ResultSet res = doRequest(rqString);
			   
			   System.out.println(rqString);
			   int i = 0;
			   try {
				   while(res.next()) {
					   if(i==0) {
						   user = new UserBean();
						   user.setUsername(res.getString("username"));
						   user.setPassword(res.getString("password"));
						   user.setNom(res.getString("nom"));
						   user.setPrenom(res.getString("prenom"));
						   user.setRang(res.getString("role"));
						   
						   user.setSexe(res.getString("sexe"));
						   user.setDate(res.getDate("date_creation"));
						   user.setId(res.getInt("id"));
						   user.setEmail(res.getString("email"));



					   }
					   else {
						   i++;
						   arret("Plus d'un utilisateur ayant le meme login ???");
					   }

				   }
				} 
			   catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			   
			   return user;
		   }
		
		
		public void addFriend(int id1,int id2) {
			//Vérifier si id2 a deja envoyé une demande d'ami, si oui on les ajoutes en amis
			   String rqString = "SELECT * FROM FRIENDSHIP WHERE USERID1='"+id2+"' AND STATUS='1'";
			   ResultSet resultSet = doRequest(rqString);
			   
			   
			   try {
				if (!resultSet.isBeforeFirst() ) {    
					   //No date donc il n'a pas encore envoyé de demande
					   String req1="INSERT INTO FRIENDSHIP (`id`, `userId1`, `userId2`, `status`, `createdAt`) VALUES (0,'"+id1+"','"+id2+"','1',CURRENT_TIMESTAMP)";
						//Sinon on envoie la demande depuis id1 vers id2
						doUpdate(req1);
						
						
						   
					} else {
						confirmFriend(id1,id2);
						confirmFriend(id2,id1);
					}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		

		}
		
		public int getFriendship(int id1,int id2) {
			String rq="SELECT STATUS FROM FRIENDSHIP WHERE USERID1='"+id1+"' AND USERID2='"+id2+"'";
			ResultSet rs= doRequest(rq);
			try {
				while(rs.next()) {
					return rs.getInt("status");

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return -1;
		}
		
		public ArrayList<UserBean> getAllUsers(){
			ArrayList<UserBean> list=new ArrayList<UserBean>();
			
			SQLConnector sql=new SQLConnector();
			String rq="SELECT * FROM USER ";
			ResultSet rs= doRequest(rq);
			
			try {
				while(rs.next()) {
					UserBean u = new UserBean();
					u.setNom(rs.getString("nom"));
					u.setPrenom(rs.getString("prenom"));
					u.setDate(rs.getDate("date_creation"));
					u.setUsername(rs.getString("username"));
					u.setEmail(rs.getString("email"));
					u.setId(rs.getInt("id"));
					u.setRang(rs.getString("role"));

					list.add(u);

				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			
			
			return list;
		}
		
		public ArrayList<VilleBean> getAllVille(){
			ArrayList<VilleBean> list= new ArrayList<VilleBean>();
			
			String rq="SELECT * FROM VILLES_FRANCE_FREE ";
			ResultSet rs= doRequest(rq);
			
			try {
				while(rs.next()) {
					VilleBean v = new VilleBean();
					
					v.setLatitude(rs.getFloat("ville_latitude_deg"));
					v.setLongitude(rs.getFloat("ville_longitude_deg"));
					v.setNom(rs.getString("ville_nom"));

					list.add(v);

				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return list;
			
		}
		
		public ArrayList<NotificationBean> getAllNotifs(int idUser){
			ArrayList<NotificationBean> list= new ArrayList<NotificationBean>();
			
			String rq="SELECT * FROM Notification WHERE userId2="+idUser;
			ResultSet rs= doRequest(rq);
			
			try {
				while(rs.next()) {
					NotificationBean notif = new NotificationBean();
					notif.setType(rs.getInt("type"));
					notif.setDate(rs.getDate("createdAt"));
					list.add(notif);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return list;
		}
}
