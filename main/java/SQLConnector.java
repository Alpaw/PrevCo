import BeanPackage.UserBean;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLConnector {
	
		public SQLConnector() { }

		
		
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
		   
		 
		   public static Connection connect() {
			   
			   Connection con = null;
			   
			   try {
				   Class.forName("com.mysql.jdbc.Driver");
			   }
			   catch (Exception e) {
			         arret("Impossible de charger le pilote jdbc : "+e);
			   }

			   affiche("connexion a la base de données");
			   
			   try {
			         String DBurl = "jdbc:mysql://localhost:3306/prevco";
			         con = DriverManager.getConnection(DBurl,"root","");
			         affiche("connexion réussie");
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
}
