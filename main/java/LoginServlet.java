

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BeanPackage.UserBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String email=request.getParameter("username");
		String pass=request.getParameter("pass");

		
		System.out.println("Le username : "+email+" le pass :"+pass);
		HttpSession session = request.getSession();

		SQLConnector sc=new SQLConnector();
		
		UserBean current_user=sc.getUser(email, pass);
		
		if(current_user!=null) {
			
			System.out.println(current_user.getEmail()+" id = "+current_user.getId());
			
			session.setAttribute("current_user",current_user);
			request.setAttribute("current_user",current_user);
			request.setAttribute("notCo", 1);

			request.getRequestDispatcher( "/include/newsfeed.jsp" ).forward( request, response );

		}else {

			request.setAttribute("notCo", 0);
			request.getRequestDispatcher( "/include/landing.jsp" ).forward( request, response );

			
		}
		
		//Si il a mis les infos correct 

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
