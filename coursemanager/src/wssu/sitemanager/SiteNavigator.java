package wssu.sitemanager;

import java.io.EOFException;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import wssu.javaclasses.*;

/**
 * Servlet implementation class SiteNavigator
 */
@WebServlet("/SiteNavigator")
public class SiteNavigator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SiteNavigator() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		System.out.println(action);
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
		default:
			request.getRequestDispatcher("login.jsp").forward(request, response);
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
			break;
		case "register_s":
			CreateStudentAccount(request, response);
			response.sendRedirect(request.getContextPath()+"/SiteNavigator?action=studentlogin");
			break;
		}
		}catch(Exception e) {}

	}
	private void CreateFacultyAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String fname=request.getParameter("f_firstname");
		String mname=request.getParameter("f_middlename");
		String lname=request.getParameter("f_lastname");
		String department=request.getParameter("f_department");
//		String major=request.getParameter("concentration");
//		String level=request.getParameter("classification");
//		int byear=Integer.parseInt(request.getParameter("s_bd_day"));
		String username=request.getParameter("f_username");
		String password=request.getParameter("f_password");
		String password2=request.getParameter("f_password2");
		if(!password.equals(password2)) {
			response.sendRedirect(request.getContextPath()+"/SiteNavigator?action=register");
			return;
		}
		Connect connection=new Connect();
		connection.InsertToFaculty(fname, mname, lname, department, username, password);
		System.out.println("Inserted 1 record into Faculty tables");
		connection.closeCon();	
		return;
	}

	private void CreateStudentAccount(HttpServletRequest request, HttpServletResponse response) throws Exception{
			String fname=request.getParameter("s_firstname");
			String mname=request.getParameter("s_middlename");
			String lname=request.getParameter("s_lastname");
			String major=request.getParameter("s_concentration");
			String level=request.getParameter("s_class");
			int byear=Integer.parseInt(request.getParameter("s_bd_day"));
			String username=request.getParameter("s_username");
			String password2=request.getParameter("s_password2");
			String password=request.getParameter("s_password");
			if(!password.equals(password2)) {
				response.sendRedirect(request.getContextPath()+"/SiteNavigator?action=register");
				return;
			}
			Connect connection=new Connect();
			connection.InsertToStudent(fname, mname, lname, major, level, byear, username, password);
			System.out.println("Inserted 1 row into Student tables");
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
				connection.closeCon();
				System.out.println("Login in successfull");
				request.getRequestDispatcher("studenthome.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("index.jsp").forward(request, response);
				System.out.println("Login in failed");
			}
		}catch(EOFException e) {}

	}
	private void FacultyAuthenticate(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		try {
			Connect connection=new Connect();
			String username = request.getParameter("username");
			String password = request.getParameter("password").toString();
			if(connection.validateUser(username, password, 1)) {
				connection.closeCon();
				System.out.println("Login in successfull");
				request.getRequestDispatcher("studenthome.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("index.jsp").forward(request, response);
				System.out.println("Login in failed");
			}
		}catch(EOFException e) {}

	}
}
