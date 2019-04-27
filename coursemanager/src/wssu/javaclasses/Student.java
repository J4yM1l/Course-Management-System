package wssu.javaclasses;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Student {
	
	@SuppressWarnings("unused")
	private static String fName, mName, lName;
	@SuppressWarnings("unused")
	private static String major, byear, level;
	private static String username;
	private static String password;
	private static int pk;
	private static Connection connection=null;
    private static Statement stmt = null;
    private static ResultSet rs = null;
    
	@SuppressWarnings("static-access")
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
	
	@SuppressWarnings("unused")
	private static String[][] getAllCoursesTaken(String course, String semester, int year){
		try {
			Connect con=new Connect();
			String[][] data=con.courseTakenInSpecificYear(course, semester, year);
			con.closeCon();
			return data;
		}catch(Exception e)	{}

		return null;
	}
	public static  void initInfor(Connection con) throws SQLException {
		connection=con;
		String sql="select * from student where sid="+pk;
		stmt = connection.createStatement();
        rs = stmt.executeQuery(sql);
        while(rs.next()) {
        	fName=rs.getString(2);
        	mName=rs.getString(3);
        	lName=rs.getString(4);
        	
        	major=rs.getString(5);
        	level=rs.getString(6);
        	byear=rs.getString(7);
        }
        sql="select * from studentcredential where sid="+pk;
        stmt = connection.createStatement();
        rs = stmt.executeQuery(sql);
        while(rs.next()) {
        	username=rs.getString(2);
        	password=rs.getString(3);
        }
        connection.close();
	}
	public static String getFirstName() {
		return fName;
	}
	public static String getMiddleName() {
		return mName;
	}
	public static String getLastName() {
		return lName;
	}
	
	public static String getMajor() {
		return major;
	}
	public static String getLevel() {
		return level;
	}
	public static String getBirthYear() {
		return byear;
	}
	
	public static String getUsername() {
		return level;
	}
	public static String getPassword() {
		return byear;
	}


	public static String[] getInforArray() {
		String[] infor=new String[8];
		infor[0]=fName;
		infor[1]=mName;
		infor[2]=lName;
		infor[3]=major;
		infor[4]=level;
		infor[5]=byear;
		infor[6]=username;
		infor[7]=password;
		
		return infor;
		
	}
	public static int getPK() {
		System.out.println("Primary Key is: " + pk);
		return pk;
	}
	

}
