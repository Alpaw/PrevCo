

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sql.SQLConnector;

/**
 * Servlet implementation class AjouterLieu
 */
@WebServlet("/AjouterLieu")
public class AjouterLieu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	
	
	
    public AjouterLieu() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		System.out.println(request.getParameter("hiddenLat"));
		try {
			System.out.println("aha1");

			String lat=request.getParameter("hiddenLat");
			System.out.println("aha2");

			String ville= request.getParameter("hiddenVille");
			System.out.println("aha3");


		float latitude= Float.parseFloat(lat);
		System.out.println("aha4");

		float longitude= Float.parseFloat(request.getParameter("hiddenLng"));
		
		
		String nom= request.getParameter("nomInput");
		String adresse= request.getParameter("hiddenAdr");
		
		System.out.println("ajout d'un lieu : "+nom.replaceAll("'","''")+","+adresse.replaceAll("'","''")+","+ville.replaceAll("'","''")+","+"lat="+latitude+","+"long="+longitude);


		if(session==null || ville==null || nom==null || adresse==null ) {
			request.getRequestDispatcher(  "include/affichageLieu.jsp" ).forward( request, response );

		}else {
			
			SQLConnector sql=new SQLConnector();
			boolean b= sql.ajouterLieu(nom.replaceAll("'","''"), adresse.replaceAll("'","''"), ville.replaceAll("'","''"), latitude, longitude);
			if(!b) {
				//Erreur le lieu existe déjà
				System.out.println("Le lieu existe déjà");
				session.setAttribute("lieuOk", false);
				request.getRequestDispatcher(  "include/affichageLieu.jsp" ).forward( request, response );


			}else {
				//C bon le lieu est bien ajouté
				session.setAttribute("lieuOk", true);

				request.getRequestDispatcher(  "include/affichageLieu.jsp" ).forward( request, response );

			}
			

			
			
			
		}
		
		
		}catch(NumberFormatException e) {
			request.getRequestDispatcher(  "include/affichageLieu.jsp" ).forward( request, response );

		
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	
	
	
	

}