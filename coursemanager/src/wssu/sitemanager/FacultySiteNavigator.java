package wssu.sitemanager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wssu.javaclasses.Connect;
import wssu.javaclasses.Faculty;

/**
 * Servlet implementation class FacultySiteNavigator
 */
@WebServlet("/FacultySiteNavigator")
public class FacultySiteNavigator extends HttpServlet {
	Faculty faculty;
	String action;
	String fnav;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacultySiteNavigator() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		 action =request.getParameter("action");
		 System.out.println("Getting request parameter: " + action);
		 fnav=request.getParameter("fnav");
		 System.out.println("Getting get request parameter: " + fnav);
		//student=(Student)request.getParameter("student");
		switch(fnav){
			case "dashboard":
				try {
				Connect con=new Connect();
				faculty=(Faculty)request.getAttribute("faculty");
				request.setAttribute("allCourses", con.getAllCourses());
				con.closeCon();
				}catch(Exception e) {}
				request.getRequestDispatcher("Faculty_home.jsp").forward(request, response);
				break;
			case "addclass":
				request.getRequestDispatcher("facultyAddCourse.jsp").forward(request, response);
				break;
				
			case "profile":
				request.getRequestDispatcher("profile.jsp").forward(request, response);
				break;
			case "grades":
				request.getRequestDispatcher("grades.jsp").forward(request, response);
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
		String action=request.getParameter("action");
		switch(action) {
			case "taken":
				getAllCoursesTaken(request, response);
				break;
		}
	}
	
	private void getAllCoursesTaken(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			String course=request.getParameter("course");
			String semester=request.getParameter("semester");
			int year=Integer.parseInt(request.getParameter("year"));
			Connect con=new Connect();
			request.setAttribute("allCourses", con.getAllCourses());
			request.setAttribute("taken", con.courseTakenInSpecificYear(course, semester, year));
			con.closeCon();
			request.getRequestDispatcher("studenthome.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
