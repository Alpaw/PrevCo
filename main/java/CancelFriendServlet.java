

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
 * Servlet implementation class CancelFriendServlet
 */
@WebServlet("/CancelFriendServlet")
public class CancelFriendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelFriendServlet() {
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
		
		
		
		String[] redirectionPage= new String[] {"include/timelineFriends.jsp","include/affichageAmi.jsp"};
		int redirection=0;
		try{
			
			
			redirection= Integer.parseInt(request.getParameter("redirectionPage"));
		}catch(java.lang.NumberFormatException e) {
			request.getRequestDispatcher(  redirectionPage[0] ).forward( request, response );

		}

		if(u==null || request.getParameter("idToCancel")==null) {
			request.getRequestDispatcher(  redirectionPage[redirection] ).forward( request, response );

			
		}
		else {
			try{
				sql.cancelFriend(u.getId(),Integer.parseInt(request.getParameter("idToCancel")) );
				
				
				request.getRequestDispatcher(  redirectionPage[redirection] ).forward( request, response );
			}catch(java.lang.NumberFormatException e) {
				request.getRequestDispatcher(  redirectionPage[redirection] ).forward( request, response );

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
