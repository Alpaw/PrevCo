

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BeanPackage.UserBean;
import sql.SQLConnector;

/**
 * Servlet implementation class AjouterActiviteServlet
 */
@WebServlet("/AjouterActiviteServlet")
public class AjouterActiviteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterActiviteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String hiddenLieuChoix= request.getParameter("hiddenLieuChoix");
		String hiddenAdresseChoix= request.getParameter("hiddenAdresseChoix");
		String hiddenVilleChoix= request.getParameter("hiddenVilleChoix");
		String dateStart= request.getParameter("dateStart");
		String hDebut= request.getParameter("hDebut");
		String hFin= request.getParameter("hFin");
		
		System.out.println("Lieu : "+hiddenLieuChoix+","+hiddenAdresseChoix+","+hiddenVilleChoix+","+dateStart+","+hDebut+","+hFin);
	
		SQLConnector sql=new SQLConnector();
		
		HttpSession session = request.getSession();
		UserBean u=(UserBean)session.getAttribute("current_user");
		if(u==null) {
			request.getRequestDispatcher( "/include/landing.jsp" ).forward( request, response );

		}else {
			sql.ajouterActivite(hiddenLieuChoix, hiddenAdresseChoix, hiddenVilleChoix, dateStart, hDebut, hFin, 19);
			request.getRequestDispatcher( "/include/affichageLieu.jsp" ).forward( request, response );
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
