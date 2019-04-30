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
	@SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			e1.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		Connect con;
		switch(nav){
			case "dashboard":
				try {
				con=new Connect();
				request.setAttribute("allCourses", con.getAllCourses());
				con.closeCon();
				}catch(Exception e) {}
				request.setAttribute("name", "dashboard");
				request.getRequestDispatcher("studenthome.jsp").forward(request, response);
				break;
				
			case "profile":
				if(request.getParameter("updatefailed")!=null && request.getParameter("updatefailed").equals("true") ) {
					request.setAttribute("updatefailed", "true");
				}else if(request.getParameter("updatefailed")!=null && request.getParameter("updatefailed").equals("false") ) {
					request.setAttribute("updatefailed", "false");
				}else if(request.getParameter("updated")!=null && request.getParameter("updated").equals("true") ) {
					request.setAttribute("updated", "true");
				}
				getUserProfileInfor(request, response);
				request.setAttribute("name", "profile");
				request.getRequestDispatcher("profile.jsp").forward(request, response);
				break;
			case "registration":
				request.setAttribute("name", "registration");
				request.getRequestDispatcher("registration.jsp").forward(request, response);
				break;
			case "student_schedule":
				
				try {
					con=new Connect();
					request.setAttribute("offered", Connect.getAllOffer());
					request.setAttribute("enrollClasses", Connect.getClassID(Connect.getStudentInfo().getPK()));
					con.closeCon();
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.setAttribute("name", "student_schedule");
				request.getRequestDispatcher("student_schedule.jsp").forward(request, response);
				break;
				
			case "drop":
				try {
					dropClass(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.setAttribute("name", "student_schedule");
				request.getRequestDispatcher("student_schedule.jsp").forward(request, response);
				break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
				e.printStackTrace();
			}
				break;
			case "profile":
				if(request.getParameter("infor")!=null && request.getParameter("infor").equals("userinfor")) {
					try {
						updateUserInformation(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}else if(request.getParameter("infor")!=null && request.getParameter("infor").equals("updatepassword")) {
					try {
						updatePassword(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
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
			request.setAttribute("name", "dashboard");
			request.getRequestDispatcher("studenthome.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@SuppressWarnings("static-access")
	private void getAllCoursess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			String semester=request.getParameter("semester");
			int year=Integer.parseInt(request.getParameter("year"));
			Connect con=new Connect();
			request.setAttribute("offered", con.getAllOffers(semester, year));
			request.setAttribute("enrollClasses", Connect.getClassID(Connect.getStudentInfo().getPK()));
			con.closeCon();
			request.setAttribute("name", "registration");
			request.getRequestDispatcher("registration.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@SuppressWarnings("static-access")
	private void enrollAClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
		int oid=Integer.parseInt(request.getParameter("oid"));
		Connect con=new Connect();
		if(con.enrolling(Connect.getStudentInfo().getPK(), oid)){
			request.setAttribute("offered", Connect.getAllOffer());
			request.setAttribute("enrollClasses", Connect.getClassID(Connect.getStudentInfo().getPK()));
			request.setAttribute("name", "registration");

			request.getRequestDispatcher("registration.jsp").forward(request, response);
		}else {
			request.setAttribute("offered", Connect.getAllOffer());
			request.setAttribute("enrollClasses", Connect.getClassID(Connect.getStudentInfo().getPK()));
			request.setAttribute("name", "registration");

			request.getRequestDispatcher("registration.jsp").forward(request, response);
		}
		con.closeCon();
		
	}
	@SuppressWarnings("static-access")
	private void dropClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
		Connect con=new Connect();
		int sid=con.getStudentInfo().getPK();
		int oid=Integer.parseInt(request.getParameter("oid"));
		con.dropClass(sid, oid);
		request.setAttribute("offered", Connect.getAllOffer());
		request.setAttribute("enrollClasses", Connect.getClassID(Connect.getStudentInfo().getPK()));
		con.closeCon();
	}
	private void getUserProfileInfor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		request.setAttribute("ProfileInfor", Student.getInforArray());	
	}
	@SuppressWarnings("static-access")
	private void updateUserInformation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception{
		Connect con=new Connect();
		String[] infor=new String[6];
		System.out.println(request.getParameter("fname"));
		infor[0]=request.getParameter("fname");
		infor[1]=request.getParameter("mname");
		infor[2]=request.getParameter("lname");
		infor[3]=request.getParameter("major");
		infor[4]=request.getParameter("level");
		infor[5]=request.getParameter("byear");
		Connect.updateStudentProfileInfor(infor);
		con.closeCon();
		con=new Connect();
		Connect.getStudentInfo().initInfor(Connect.connection);
		con.closeCon();
		response.sendRedirect(request.getContextPath()+"/StudentSiteNavigator?nav=profile&updated=true");
		}
	@SuppressWarnings("static-access")
	private void updatePassword (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception{
		String pwd1=request.getParameter("p1").trim();
		String pwd2=request.getParameter("p2").trim();
		if(pwd1.equals(pwd2)) {
			Connect con =new Connect();
			Connect.updatePassword(pwd1);
			Connect.getStudentInfo().initInfor(Connect.connection);
			con.closeCon();
			response.sendRedirect(request.getContextPath()+"/StudentSiteNavigator?nav=profile&updatefailed=false");
		}else
		{
			//request.setAttribute("updatefailed", "true");
			response.sendRedirect(request.getContextPath()+"/StudentSiteNavigator?nav=profile&updatefailed=true");

		}

	}
}
