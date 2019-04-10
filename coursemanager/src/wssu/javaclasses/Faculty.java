package wssu.javaclasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Faculty {
	private String fName, mName, lName;
	private String major, byear, level, department;
	private String username, password;
	private int pk;
	private Connection connection=null;
    private Statement stmt = null;
    private ResultSet rs = null;
    
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
		System.out.println(tusername+" "+tpassword +"  "+rs.next());
        if(tusername.equals(username) && tpassword.equals(password)) {
        	return true;}
	   return false;
	}
}
