package wssu.javaclasses;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;

public class Faculty {
	@SuppressWarnings("unused")
	private String fName, mName, lName;
	@SuppressWarnings("unused")
	private String major, byear, level, department;
	private String username, password;
	@SuppressWarnings("unused")
	private int pk;
	private Connection connection=null;
    private Statement stmt = null;
    private ResultSet rs = null;
    @SuppressWarnings("unused")
    private String course;
    private String sem;
    private int yr;
    
	public Faculty(Connection connect, String username, String passord) throws SQLException {
		this.username=username.toLowerCase().trim();
		this.password=passord.trim();
		connection=connect;
		String sql="select * from facultycredential c"
				+ " where username='"+ username +"'"
				+ " and password='"+ password +"'";
		stmt = connection.createStatement();
        rs = stmt.executeQuery(sql);
	}
	
	public Faculty() {
		this.course = " ";
		
	}
	
	public Faculty(String str, int val) {
		this.sem = str;
		this.yr = val;
		
	}
	
	public String getSemester() {
		return sem;
	}
	
	public int getYear() {
		return yr;
	}
	
	public boolean validate() throws SQLException{
		if(username.equals("") || password.equals("")) return false;
		String tusername=null, tpassword=null;
		while(rs.next())
		{
			tusername=rs.getString("username");
			tpassword=rs.getString("password");
		}
		if(tusername==null || tpassword==null)
			return false;
		System.out.println(tusername+" "+ tpassword +" "+rs.next());
        if(tusername.equals(username) && tpassword.equals(password)) {
        	return true;}
	   return false;
	}
	
	public String  facultyCourseOfferedDetail(String[][] facultyCourseoffered) {
		String semester = null;
		String year;
		for(int i = 0; i<facultyCourseoffered.length; i++) {
			semester = facultyCourseoffered[i][0];
			year = facultyCourseoffered[i][1];
			System.out.println("Semester: " + semester);
			System.out.println("Year: " + year);
		}
			return semester;
	}
	
	public void removeCourses(ArrayList<String> c, ArrayList<String> s)throws ServletException, IOException {
		try {
//			String rem = request.getParameter("courses");
//			 System.out.println("value: " + rem);
		 System.out.println("Faculty class Performing clear operation !");
		  c.clear();
	      s.clear();
//	      retval = arrlist.size();
//	      System.out.println("Now, list consists of "+ retval +" elements");
		}catch (Exception e) {
			e.printStackTrace();
		}
////	
//
}
//	Faculty faculty = null;
//	 public String getFacultyInfo() {
//		 String facultyInfo = username + " " + password;
//	    	return facultyInfo;
//	    }


}
