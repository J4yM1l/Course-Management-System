package wssu.javaclasses;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Student {
	
	private String fName, mName, lName;
	private String major, byear, level;
	private String username, password;
	private int pk;
	private Connection connection=null;
    private Statement stmt = null;
    private ResultSet rs = null;
    
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
	
	public boolean validate() throws SQLException{
		if(username.equals("") || password.equals("")) return false;
		String tusername=null, tpassword=null;
		while(rs.next())
		{
			tusername=rs.getString("username");
			tpassword=rs.getString("password");
		}
		if(tusername==null || tpassword==null)return false;
        if(tusername.equals(username) && tpassword.equals(password)) {
        	return true;}
	   return false;
	}

}
