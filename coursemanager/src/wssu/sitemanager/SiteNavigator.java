package wssu.sitemanager;

import java.io.EOFException;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wssu.javaclasses.*;

/**
 * Servlet implementation class SiteNavigator
 */
@WebServlet("/SiteNavigator")
public class SiteNavigator extends HttpServlet {
	static Student student;
	static Faculty faculty;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SiteNavigator() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");	//get action
		switch (action) {
		case "studentlogin":
			request.getRequestDispatcher("login.jsp").forward(request, response);
			break;
		case "facultylogin": 
			request.getRequestDispatcher("login.jsp").forward(request, response);
			break;
		case "login":
			request.getRequestDispatcher("login.jsp").forward(request, response);
			break;
		case "register":
			request.getRequestDispatcher("account_registration.jsp").forward(request, response);
			break;
		case "admin":
			request.getRequestDispatcher("admin_login.jsp").forward(request, response);
			break;
		default:
			request.getRequestDispatcher("index.jsp").forward(request, response);
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
		String action = request.getParameter("action");
		switch (action) {
		case "studentlogin":
			StudentAuthenticate(request, response);
			break;
		case "facultylogin":
			FacultyAuthenticate(request, response);
			break;
		case "register_f":
			CreateFacultyAccount(request, response);
			response.sendRedirect(request.getContextPath()+"/SiteNavigator?action=facultylogin");
			System.out.println("Faculty Registration Successfull --> Now heading to Login Page");
			break;
		case "register_s":
			CreateStudentAccount(request, response);
			response.sendRedirect(request.getContextPath()+"/SiteNavigator?action=studentlogin");
			System.out.println("Student Registration Successfull --> Now heading to Login Page");
			break;
		}
		}catch(Exception e) {}

	}
	private void CreateFacultyAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String fname=request.getParameter("f_firstname");
		String mname=request.getParameter("f_middlename");
		String lname=request.getParameter("f_lastname");
		String department=request.getParameter("f_department");
//		String major=request.getParameter("concentration");
//		String level=request.getParameter("classification");
//		int byear=Integer.parseInt(request.getParameter("s_bd_day"));
//		String gender=request.getParameter("f_gender");
		String username=request.getParameter("f_username");
		String password=request.getParameter("f_password");
		String password2=request.getParameter("f_password2");
		if(!password.equals(password2) || (password.trim().equals("") || password2.trim().equals(""))) {
			request.getRequestDispatcher("account_registration.jsp").forward(request, response);
			System.out.println("Faculty Password do not match");
			return;
		}
		Connect connection=new Connect();
		connection.InsertToFaculty(fname, mname, lname, department, username, password);
		System.out.println("Insert 1 record into Faculty tables");
		connection.closeCon();	
		return;
	}

	private void CreateStudentAccount(HttpServletRequest request, HttpServletResponse response) throws Exception{
			String fname=request.getParameter("s_firstname");
			String mname=request.getParameter("s_middlename");
			String lname=request.getParameter("s_lastname");
			String major=request.getParameter("s_concentration");
			String level=request.getParameter("s_class");
			int byear=((request.getParameter("s_bd_day").equals(""))? -1: Integer.parseInt(request.getParameter("s_bd_day")));
			String username=request.getParameter("s_username");
			String password2=request.getParameter("s_password2");
			String password=request.getParameter("s_password");
			if(!password.equals(password2) || (password.trim().equals("") || password2.trim().equals(""))) {
				request.getRequestDispatcher("account_registration.jsp").forward(request, response);
				System.out.println("Student Password do not match");
				return;
			}
			Connect connection=new Connect();
			connection.InsertToStudent(fname, mname, lname, major, level, byear, username, password);
			System.out.println("Insert 1 record into Student tables");
			connection.closeCon();
			return;
				
	}
	private void StudentAuthenticate(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		try {
			Connect connection=new Connect();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if(connection.validateUser(username, password, 0)) {
				student=Connect.getStudentInfo();
				connection.closeCon();
				System.out.println("Student login successfull");
				request.getSession().invalidate();
				HttpSession newSession = request.getSession(true);
			    newSession.setMaxInactiveInterval(300);
			    newSession.setAttribute("username", username);
			    
			    Cookie cookie = new Cookie("username", username);;
				response.addCookie(cookie);

				response.sendRedirect(request.getContextPath()+"/StudentSiteNavigator?action="+username+"&nav=dashboard");
			}else {
				request.getRequestDispatcher("index.jsp").forward(request, response);
				System.out.println("Student login failed");
			}
		}catch(EOFException e) {}

	}
	@SuppressWarnings("static-access")
	private void FacultyAuthenticate(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		try {
			Connect connection=new Connect();
			String username = request.getParameter("username");
			String password = request.getParameter("password").toString();
			String auth=request.getParameter("admin");
			if(connection.validateUser(username, password, 1)) {
				faculty=connection.getFacultyInfo();
				System.out.println("Faculty info: " + faculty.toString());
				connection.closeCon();
				System.out.println("Faculty login successfull");
				//creating session and cookie
				request.getSession().invalidate();
				HttpSession newSession = request.getSession(true);
			    newSession.setMaxInactiveInterval(300);
			    newSession.setAttribute("username", username);
			    Cookie cookie = new Cookie("username", username);;
				response.addCookie(cookie);
				student=connection.getStudentInfo();
				request.setAttribute("faculty", faculty);
				if(auth==null)
				response.sendRedirect(request.getContextPath()+"/FacultySiteNavigator?action="+username+"&fnav=dashboard");
				else
				{
					response.sendRedirect(request.getContextPath()+"/AdminSiteNavigator?action="+username+"&nav=dashboard");
				}
			}else {
				request.getRequestDispatcher("index.jsp").forward(request, response);
				System.out.println("Faculty login failed");
			}
		}catch(EOFException e) {}

	}
}
