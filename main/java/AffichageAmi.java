

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
 * Servlet implementation class AffichageAmi
 */
@WebServlet("/AffichageAmi")
public class AffichageAmi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AffichageAmi() {
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
		if(u==null  ) {
			request.getRequestDispatcher( "/include/timelineFriends.jsp" ).forward( request, response );

			
		}
		else {
			try{
				
				if(request.getParameter("idToShow")!=null ) {

					UserBean uF= sql.getFriend(Integer.parseInt(request.getParameter("idToShow")));

					session.setAttribute("friend_to_show", uF);
					session.setAttribute("idToShow",request.getParameter("idToShow"));
					request.getRequestDispatcher( "/include/affichageAmi.jsp" ).forward( request, response );
				}else 
				if(session.getAttribute("idToShow")!=null) {
					UserBean uF= sql.getFriend(Integer.parseInt((String)session.getAttribute("idToShow")));

					session.setAttribute("friend_to_show", uF);
					request.setAttribute("idToShow",session.getAttribute("idToShow"));
					request.getRequestDispatcher( "/include/affichageAmi.jsp" ).forward( request, response );
				}
				else {

					request.getRequestDispatcher( "/include/timelineFriends.jsp" ).forward( request, response );

				}
				
			}catch(java.lang.NumberFormatException e) {
				request.getRequestDispatcher( "/include/timelineFriends.jsp" ).forward( request, response );

			}
			

		}	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
