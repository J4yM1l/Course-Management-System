package wssu.sitemanager;

import java.io.IOException;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import wssu.javaclasses.Connect;

/**
 * Servlet implementation class AdminSiteNavigato
 */
@WebServlet("/AdminSiteNavigator")
public class AdminSiteNavigator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSiteNavigator() {
        super();
        // TODO Auto-generated constructor stub
    }
    String[][] everyClass;
    String[][] everyFaculty;
    String[][] offers;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("nav");
		switch(action) {
			case "dashboard":
				try {
					loadCoursesAndFaculty();
					offers=parseOfferArray();
					request.setAttribute("activeOffers", offers);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
				break;
			case "createclass":
				request.getRequestDispatcher("admin_createclass.jsp").forward(request, response);
				break;
			case "offer":
				try {
					loadCoursesAndFaculty();
				request.setAttribute("allCourses",everyClass);

				request.setAttribute("allfaculty", everyFaculty);
				request.getRequestDispatcher("admin_offers.jsp").forward(request, response);
				}catch(Exception e){
					
				}
				break;
		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		switch(action){
			case "addclass":
					try {
						addAClass(request, response);
						response.sendRedirect(request.getContextPath()+"/AdminSiteNavigator?nav=dashboard");
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				break;
			case "offer":
					try {
						createOffer(request, response);
						response.sendRedirect(request.getContextPath()+"/AdminSiteNavigator?nav=dashboard");
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				break;
		}
	}
	private void addAClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, Exception  {
		String cname=request.getParameter("coursename");
		String meetat=request.getParameter("meetat");
		String room=request.getParameter("room");

		Connect connection=new Connect();
		
		if(connection.addClass(cname, meetat, room)) {
			System.out.println("Insert 1 record into Student tables");
		}else
		{
			System.out.println("Failed to Insert 1 record into Student tables");
		}

		connection.closeCon();
		return;
	}
	
	private void createOffer(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int cid=-1, fid=-1;
		String cname=request.getParameter("course");
		String semester=request.getParameter("semester");
		String faculty=request.getParameter("faculty");
		int year=Integer.parseInt(request.getParameter("year"));
		for(int i=0; i<everyClass.length; i++) {
			if(everyClass[i][1]==null)break;
			if(cname.equals(everyClass[i][1])) {
				cid=Integer.parseInt(everyClass[i][0]);
				break;
			}
		}
		
		for(int i=0; i<everyFaculty.length; i++) {
			if(everyFaculty[i][1]==null)break;
			if(faculty.equals(everyFaculty[i][1])) {
				fid=Integer.parseInt(everyFaculty[i][0]);
				break;
			}
		}
		Connect connection=new Connect();
		
		if((cid>=0  && fid>=0 ) && connection.addOffer(cid, fid, semester, year)) {
			System.out.println("Insert 1 record into Student tables");
		}else
		{
			System.out.println("Failed to Insert 1 record into Student tables");
		}

		connection.closeCon();
		
	}
	private String[][] getAllOffer() throws Exception {
		Connect con=new Connect();
		String[][] d=con.getAllOffers();
		con.closeCon();
		return d;
	}
	private String[][] parseOfferArray() throws Exception
	{
		loadCoursesAndFaculty();
		StringTokenizer token=new StringTokenizer("");
		String[][] arr=getAllOffer() ;

		String[][] arr1=new String[arr.length][2];
		for(int i=0; i<arr1.length;i++) {
			if(arr[i][1]==null)break;
			for(int c=0; c<everyClass.length; c++) {
				token=new StringTokenizer(arr[i][1],"&");
				String t=token.nextToken();
				if(Integer.parseInt(everyClass[c][0])==Integer.parseInt(t)){
					arr1[i][0]=arr[i][0];
					arr1[i][1]=everyClass[c][1]+"&";
					break;
				}
			}
			for(int c=0; c<everyFaculty.length; c++) {
				token=new StringTokenizer(arr[i][1],"&");
				String t=token.nextToken();
				t=token.nextToken();
				if(Integer.parseInt(everyFaculty[c][0])==Integer.parseInt(t)){
					arr1[i][1]+=everyFaculty[c][1];
					break;
				}
			}
			System.out.println("arr: "+arr1[i][1]);
		}
		return arr1;
	}
	private void loadCoursesAndFaculty() throws Exception {
		Connect con=new Connect();
		everyClass=con.getAllCourses();
		everyFaculty=con.getAllFaculty();
		con.closeCon();
	}
}
