package wssu.sitemanager;

import java.io.IOException;
import java.util.ArrayList;

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
    }

    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		 action =request.getParameter("action");
		 System.out.println("Get request action parameter: " + action);
		 fnav=request.getParameter("fnav");
		 System.out.println("Get request fnav parameter: " + fnav);
		//student=(Student)request.getParameter("student");
		switch(fnav){
			case "dashboard":
				try {
				Connect con=new Connect();
				faculty=(Faculty)request.getAttribute("faculty");
				request.setAttribute("facultyAssigncourses", Connect.getAllFacultyAssignClasses());
				System.out.println("Faculty key: "+Faculty.getPk());
				con.closeCon();
				}catch(Exception e) {}
				request.getRequestDispatcher("Faculty_home.jsp").forward(request, response);
				break;
			case "addclass":
				try {
				Connect con=new Connect();
				
//				request.setAttribute("faculty_classes",  con.getAllCourses());
//				request.setAttribute("offered", con.assignedFacultyCourses(semester, year));
				}catch(Exception e) {}
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
		String action=request.getParameter("action");
		System.out.println("post request action " + action);
//		String button=request.getParameter("remove");
//		 System.out.println("post request button parameter: " + button);
		switch(action) {
			case "lookupcourses":
				getAssignFacultyCourses(request, response);
				 
				break;
		}
	}
	
	@SuppressWarnings("static-access")
	private void getAssignFacultyCourses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			String semester=request.getParameter("semester");
			int year=Integer.parseInt(request.getParameter("year"));
			Connect con=new Connect();
			request.setAttribute("offered", con.assignedFacultyCourses(semester, year));
//			request.setAttribute("enrollClasses", Connect.getClassID(Connect.getStudentInfo().getPK()));
			con.closeCon();
//			request.setAttribute("name", "gettingCourses");
			request.getRequestDispatcher("facultyAddCourse.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unused")
	private void getAllCoursesAdded(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			String course=request.getParameter("course");
			String semester=request.getParameter("semester");
			int year=Integer.parseInt(request.getParameter("year"));
			Connect con=new Connect();
			request.setAttribute("OfferedCourses", con.getAllOffers());
			request.setAttribute("CoursesTaken", con.courseTakenInSpecificYear(course, semester, year));
			con.closeCon();
//			request.getRequestDispatcher("facultyAddClass.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
//	static ArrayList<String> courses = new ArrayList<String>();
//	static ArrayList<String> semester = new ArrayList<String>();
//	public void addCourses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		try {
//			String fCourse = request.getParameter("courses");
//			String fSemester = request.getParameter("semester");
//			System.out.println("Faculty Course: " + fCourse);
//			System.out.println("Semester: " + fSemester);
//			courses.add(fCourse);
//			Object[] arr = (Object[])courses.toArray();
//			semester.add(fSemester);
//			Object[] arr1 = (Object[])semester.toArray();
//			request.setAttribute("faculty_courses", arr);
//			request.setAttribute("faculty_semester", arr1);
//			request.getRequestDispatcher("facultyAddCourse.jsp").forward(request, response);
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//	}

//	public static boolean clearCourses()throws ServletException, IOException {
//		try {
////			String rem = request.getParameter("courses");
////			 System.out.println("value: " + rem);
//		 System.out.println("SiteNav Performing clear operation !!");
//		 Faculty fac = new Faculty();
//		 fac.removeCourses(courses,semester);
//		 System.out.println("operation cleared !!");
//		 
////	      retval = arrlist.size();
////	      System.out.println("Now, list consists of "+ retval +" elements");
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		return true;
//
//}
}
