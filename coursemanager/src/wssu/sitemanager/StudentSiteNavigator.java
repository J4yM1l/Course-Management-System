package wssu.sitemanager;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wssu.javaclasses.Connect;
import wssu.javaclasses.Student;

/**
 * Servlet implementation class StudentSiteNavigator
 */
@WebServlet("/StudentSiteNavigator")
public class StudentSiteNavigator extends HttpServlet {
	Student student;
	static int pk;
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
		String action =request.getParameter("action");
		System.out.println("Getting request parameter: " + action);
		String nav=request.getParameter("nav");
		System.out.println("Getting nav request parameter: " + nav);
		try {
			Connect con =new Connect();
			request.setAttribute("offered", (request.getAttribute("offered")!=null)? request.getAttribute("offered"):Connect.getAllOffer());
			request.setAttribute("enrollClasses", (request.getAttribute("enrollClasses")!=null)? request.getAttribute("enrollClasses"):Connect.getClassID(Connect.getStudentInfo().getPK()));
			con.closeCon();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		switch(nav){
			case "dashboard":
				try {
				Connect con=new Connect();
				request.setAttribute("allCourses", con.getAllCourses());
				con.closeCon();
				}catch(Exception e) {}
				request.getRequestDispatcher("studenthome.jsp").forward(request, response);
				break;
			case "grades":
				request.getRequestDispatcher("grades.jsp").forward(request, response);
				break;
				
			case "profile":
				request.getRequestDispatcher("profile.jsp").forward(request, response);
				break;
			case "registration":
				//request.setAttribute("student", student);
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
		String action=request.getParameter("action");
		switch(action) {
			case "taken":
				getAllCoursesTaken(request, response);
				break;
			case "register":
				getAllCoursess(request, response);
				break;
			case "enroll":
			try {
				enrollAClass(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
			request.setAttribute("offered", Connect.getAllOffer());
			con.closeCon();
			request.getRequestDispatcher("studenthome.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	private void getAllCoursess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			String semester=request.getParameter("semester");
			int year=Integer.parseInt(request.getParameter("year"));
			Connect con=new Connect();
			request.setAttribute("offered", con.getAllOffers(semester, year));
			request.setAttribute("enrollClasses", Connect.getClassID(Connect.getStudentInfo().getPK()));
			con.closeCon();
			request.getRequestDispatcher("registration.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void enrollAClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
		//int cid=Integer.parseInt(request.getParameter("cid"));
		System.out.println(request.getParameter("username"));
		int oid=Integer.parseInt(request.getParameter("oid"));
		Connect con=new Connect();
		if(con.enrolling(Connect.getStudentInfo().getPK(), oid)){
			request.setAttribute("offered", Connect.getAllOffer());
			request.setAttribute("enrollClasses", Connect.getClassID(Connect.getStudentInfo().getPK()));
			
			request.getRequestDispatcher("registration.jsp").forward(request, response);
		}else {
			request.setAttribute("offered", Connect.getAllOffer());
			request.setAttribute("enrollClasses", Connect.getClassID(Connect.getStudentInfo().getPK()));
			request.getRequestDispatcher("registration.jsp").forward(request, response);
		}
		con.closeCon();
		
	}

}
