package wssu.sitemanager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StudentSiteNavigator
 */
@WebServlet("/StudentSiteNavigator")
public class StudentSiteNavigator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentSiteNavigator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String action =request.getParameter("action");
		String nav=request.getParameter("nav");
		switch(nav){
			case "dashboard":
				request.getRequestDispatcher("studenthome.jsp").forward(request, response);
				break;
			case "grades":
				request.getRequestDispatcher("grades.jsp").forward(request, response);
				break;
				
			case "profile":
				request.getRequestDispatcher("profile.jsp").forward(request, response);
				break;
			case "registration":
				request.getRequestDispatcher("registration.jsp").forward(request, response);
				break;
			case "student_schedule":
				request.getRequestDispatcher("student_schedule.jsp").forward(request, response);
				break;
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
