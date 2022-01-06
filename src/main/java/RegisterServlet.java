

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sql.*;


/**
 * Servlet implementation class Register
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//System.out.println(" Let'z go   ??? register ");
		
		

		if(request.getParameter("registerBtn") != null) {
			//On récupère les éléments
			String mail = request.getParameter("email");
			String sexe=request.getParameter("radio");
			String nom=request.getParameter("nom");
			String prenom=request.getParameter("prenom");

			String username=request.getParameter("username");

			String password=request.getParameter("pass");
			
			String date=request.getParameter("date");
				
			System.out.println("La date vaut : "+date);
			System.out.println(" Let'z go register em="+mail+" sexe="+sexe+" nom prenom="+nom+" "+prenom+" pass="+password+" username="+username);

			java.sql.Date dateN= java.sql.Date.valueOf(date);
			
			

			HttpSession session = request.getSession();
			SQLConnector sc = new SQLConnector();
			sc.createTables();
			
			if(sc.userExist(mail)) {
				request.setAttribute("mailAlreadyExist", true);
				
			}else if((mail != "") && (mail != null) && (password != "") && (password != null)) {
				request.setAttribute("mailAlreadyExist", false);
				request.setAttribute("formDone",true);
				request.setAttribute("allOk",false);

				sc.createUser(mail, password, nom, username,sexe,prenom,dateN);
			}
			
			
			//sc.close;
			request.getRequestDispatcher( "/include/landing.jsp" ).forward( request, response );
		
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
