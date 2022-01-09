

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
 * Servlet implementation class SupprimerUser
 */
@WebServlet("/SupprimerUser")
public class SupprimerUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupprimerUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		SQLConnector sql=new SQLConnector();
		HttpSession session = request.getSession();
		UserBean u=(UserBean) session.getAttribute("current_user");
		
		//TODO Vérifier que l'user est bien admin
		
		if(u==null || request.getParameter("idToDelete")==null) {
			request.getRequestDispatcher( "/include/landing.jsp" ).forward( request, response );

			
		}
		
		
		
		/*else */if(u.getRang().equals("administrateur")){//TODO Verif user admin a faire
			try{
				//sql.deleteFriend(u.getId(),Integer.parseInt(request.getParameter("idToDelete")) );
				
			
				if(u.getId()!=Integer.parseInt(request.getParameter("idToDelete"))) {
					sql.deleteUser(Integer.parseInt(request.getParameter("idToDelete")));
				}
				request.getRequestDispatcher( "/admin_dashboard/adminDashboard.jsp" ).forward( request, response );
			}catch(java.lang.NumberFormatException e) {
				request.getRequestDispatcher( "/admin_dashboard/adminDashboard.jsp" ).forward( request, response );

			}
			

		}else {
			request.getRequestDispatcher( "/admin_dashboard/landing.jsp" ).forward( request, response );

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
