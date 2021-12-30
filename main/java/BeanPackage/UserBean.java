package BeanPackage;
public class UserBean  {
	
	private int id;
	private String nom;
	private String prenom;
	private String rang;
	private String password;
	private String email;
	
	private String username;
	private String sexe;
	private java.sql.Date date; 
	
	private java.sql.Date dateNaissance; 

	
	public int getId() {
		return this.id;
	}
	
	public String getNom() {
		return this.nom;
	}

	public String getPrenom() {
		return this.prenom;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public String getRang() {
		return this.rang;
	}
	
	public void setId( int id ) {
		this.id = id;
	}
	
	public void setNom( String nom ) {
		this.nom = nom;
	}

	public void setPrenom( String prenom ) {
		this.prenom = prenom;
	}
	
	public void setPassword( String password ) {
		this.password = password;
	}
	
	public void setEmail( String email ) {
		this.email = email;
	}
	
	public void setRang( String rang ) {
		this.rang = rang;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSexe() {
		return sexe;
	}

	public void setSexe(String sexe) {
		this.sexe = sexe;
	}

	public java.sql.Date getDate() {
		return date;
	}

	public void setDate(java.sql.Date date) {
		this.date = date;
	}

	public java.sql.Date getDateNaissance() {
		return dateNaissance;
	}

	public void setDateNaissance(java.sql.Date dateNaissance) {
		this.dateNaissance = dateNaissance;
	}
}
