

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import BeanPackage.UserBean;
import sql.SQLConnector;

/**
 * Servlet implementation class ConfirmNotifFriendServlet
 */
@WebServlet("/ConfirmNotifFriendServlet")
public class ConfirmNotifFriendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmNotifFriendServlet() {
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
		if(u==null || request.getParameter("id2")==null) {
			request.getRequestDispatcher( "/include/timelineFriends.jsp" ).forward( request, response );

			
		}
		else {
			try{
				
				int autoId = Integer.parseInt(request.getParameter("autoId"));
				/*
		        String[] strDates = str.split("\\.");
		        String strDate = strDates[0];
		        System.out.println(strDate);
		        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		        java.util.Date d = null;
				try {
					d = format.parse(str);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				java.sql.Date date = new java.sql.Date(d.getTime());

		        
		        Timestamp time = Timestamp.valueOf(strDate);
		        //String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(time);
		        //time = Timestamp.valueOf(date);

		        System.out.println("date          : " + date);
				*/
				sql.confirmFriend(u.getId(),Integer.parseInt(request.getParameter("id2")) );
				sql.removeNotif(autoId);

				request.getRequestDispatcher( "/include/timelineFriends.jsp" ).forward( request, response );
			}catch(java.lang.NumberFormatException e) {
				request.getRequestDispatcher( "/include/timelineFriends.jsp" ).forward( request, response );

			}
			
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
