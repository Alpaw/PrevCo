

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
 * Servlet implementation class JeSuisPasCovidServlet
 */
@WebServlet("/JeSuisPasCovidServlet")
public class JeSuisPasCovidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JeSuisPasCovidServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//On déclare l'user actuel négatif 
				SQLConnector sql=new SQLConnector();
				HttpSession session = request.getSession();

				UserBean u = (UserBean) session.getAttribute("current_user");
				if(u==null) {
					request.getRequestDispatcher( "/include/landing.jsp" ).forward( request, response );

					
				}else {
					sql.enleverCovid(u.getId());

					request.getRequestDispatcher( "/include/newsfeed.jsp" ).forward( request, response );

				}	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
