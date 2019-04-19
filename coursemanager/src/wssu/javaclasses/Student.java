package wssu.javaclasses;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Student {
	
	private static String fName, mName, lName;
	private static String major, byear, level;
	private static String username, password;
	private static int pk;
	private static Connection connection=null;
    private static Statement stmt = null;
    private static ResultSet rs = null;
    
	public Student(Connection connect, String username, String passord) throws SQLException {
		this.username=username.toLowerCase().trim();
		this.password=passord.trim();
		connection=connect;
		String sql="select * from studentcredential c"
				+ " where c.username='"+username+"'"
				+ " and c.password='"+password+"'";
		stmt = connection.createStatement();
        rs = stmt.executeQuery(sql);
	}
	
	public static boolean validate() throws SQLException{
		if(username.equals("") || password.equals("")) return false;
		String tusername=null, tpassword=null;
		while(rs.next())
		{
			pk=rs.getInt(1);
			tusername=rs.getString("username");
			tpassword=rs.getString("password");
		}
		if(tusername==null || tpassword==null)return false;
        if(tusername.equals(username) && tpassword.equals(password)) {
        	return true;}
	   return false;
	}
	
	private static String[][] getAllCoursesTaken(String course, String semester, int year){
		try {
			Connect con=new Connect();
			String[][] data=con.courseTakenInSpecificYear(course, semester, year);
			con.closeCon();
			return data;
		}catch(Exception e)	{}

		return null;
	}
	public static int getPK() {
		System.out.println("Primary Key is: "+pk);
		return pk;
	}

}
