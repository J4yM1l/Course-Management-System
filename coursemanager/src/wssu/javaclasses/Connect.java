package wssu.javaclasses;

import java.sql.*;
import java.util.StringTokenizer;
/* 
 * You can donwload MS SQL Server JDBC dirver at 
 * http://www.microsoft.com/downloads/en/details.aspx?FamilyID=a737000d-68d0-4531-b65d-da0f2a735707&displaylang=en
 * 
 * Add sqljdbc4.jar to either
 * Eclipse External Archives, or
 * BlueJ Libraries from Preferences
 * 
 * Copy sqljdbc_auth.dll to the same folder with your java file
 * 
 * Refer to the following MSDN manual for more information
 * on connecting to SQL Server usin JDBC
 * http://msdn.microsoft.com/en-us/library/ms378672.aspx
 * 
 */
public class Connect
{
     // Declare the JDBC objects.
     public static Connection connection = null;
     private static Statement stmt = null;
     private static ResultSet rs = null;
     @SuppressWarnings("unused")

	private int s_pk;		//The primary key for current user

    /**
     * Constructor for objects of class Connect
     */
    public Connect()throws Exception {
        // Get connection
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
        connection = DriverManager.getConnection("jdbc:sqlserver://localhost\\SQLEXPRESS;databaseName=db_course_management_system;integratedSecurity=true");
        //connection = DriverManager.getConnection("jdbc:sqlserver://CSCSQL;user=cst6306;password=cst6306");
        //connection = DriverManager.getConnection("jdbc:sqlserver://152.12.24.165;databaseName=CST6306;user=cst6306;password=cst6306");
        if (connection != null) {
            System.out.println();
            System.out.println("Successfully connected to Database");
        }
    }

    static Student student=null;	//Current Student
    static Faculty faculty=null;	//Current faculty
    /*
     * validates the current user
     * @param username
     * @param password
     * @return boolean
     */
    @SuppressWarnings("static-access")
	public boolean validateUser(String username, String password, int type) throws SQLException {
    	boolean isRegistered=false;		//is this username and password in the credential tables
    	if(type==0) {		//Type: 0 for student; 1 for faculty
	    	student=new Student(connection, username, password);
	    	isRegistered=(student.validate());		//validate student
	    	s_pk=student.getPK();		//get the primary key of student
	    	student.initInfor(connection);		//store all student infor in a variable
	        return isRegistered;
        }
    	else {
    		faculty=new Faculty(connection, username, password);
    		isRegistered=faculty.validate();	//validate faculty
            	return isRegistered;
    	}
    }
    /*
     * return the current student
     * @return Student
     */
    public static  Student getStudentInfo() {
    	return student;
    }
    /*
     * return the current faculty
     * @return faculty
     */
    public static Faculty getFacultyInfo() {
    	return faculty;
    }
    /*
     * creating a new student account
     * adding student information to student table
     * adding student credential to studentcredential table
     * @param fname -first name
     * @param mname -middle name
     * @param lname	-last name
     * @param major	-major 
     * @param level -student classification
     * @param byear -student birth year
     * @param username -the username created by the current user
     * @param password -the password created by current user
     * @return void
     */
    public void InsertToStudent(String fname, String mname, String lname, String major, String level, int byear, String username, String password) throws SQLException{
    	String sql="insert into student(fname, mname, lname, major, level, byear)"
    			+ "values('"+fname+"',"+"'"+mname+"',"+"'"+lname+"',"+"'"+major+"'"+",'"+level+"',"+"'"+byear+"');";
	    	PreparedStatement ps = connection.prepareStatement(sql,
	    	        Statement.RETURN_GENERATED_KEYS);
	    	ps.execute();
	    	 
	    	ResultSet r = ps.getGeneratedKeys();	//get the primary key generated
	    	int generatedKey = 0;
	    	if (r.next()) {
	    	    generatedKey = r.getInt(1);
	    	}
	    	InsertToStudentCredential(generatedKey, username, password);	//use primary key as foreign key for student credential
		return;
    }
    
    /*
     * Adding current user studentcredential table
     * @param username -the username created by the current user
     * @param password -the password created by current user
     * @return void
     */
    public void InsertToStudentCredential(int fk, String username, String password) throws SQLException {
    	String sql="insert into StudentCredential(sid, username, password)"
    			+ "values("+fk+","+"'"+username+"',"+"'"+password+"');";
		stmt=connection.createStatement();
		stmt.execute(sql);
		return;
    }
    /*
     * 
     * Creating a new faculty to the faculty table
     * add new faculty credential information facultycredential table
     * @param fname -first name
     * @param mname -middle name
     * @param lname	-last name
     * @param department 
     * @param username -the username created by the current user
     * @param password -the password created by current user
     * @return void
     */
    public void InsertToFaculty(String fname, String mname, String lname, String department, String username, String password) throws SQLException {
    	String sql="insert into Faculty(fname, mname, lname, department)"
    			+ "values('"+fname+"',"+"'"+mname+"',"+"'"+lname+"',"+"'"+department+"');";
    	PreparedStatement ps = connection.prepareStatement(sql,
    	        Statement.RETURN_GENERATED_KEYS);
    	ps.execute();
    	 
    	ResultSet r = ps.getGeneratedKeys();   //get primary key of newly created faculty account
    	int generatedKey = 0;
    	if (r.next()) {
    	    generatedKey = r.getInt(1);
    	}
    	InsertToFacultyCredential(generatedKey, username, password);	//Insert current faculty username and password in to facultycredential
		return;
    }
    /*
     * Inserting faculty credential into facultycredential table
     * @param username -the username created by the current user
     * @param password -the password created by current user
     * @return void
     */
    public void InsertToFacultyCredential(int fk, String username, String password) throws SQLException {
    	String sql="insert into FacultyCredential(fid, username, password)"
    			+ "values("+fk+","+"'"+username+"',"+"'"+password+"');";
    
		stmt=connection.createStatement();
		stmt.execute(sql);
		return;
    }
    
    
    /*
     * Retrieving all courses from the course table
     * @return String[][]
     */
    public String[][] getAllCourses() throws SQLException {
    	
    	String sql="select * from course";
		stmt = connection.createStatement();
        rs = stmt.executeQuery(sql);
        String[][] data=new String[rs.getFetchSize()][2];
        int index=0;
        while(rs.next()) {
        	data[index][0]=String.valueOf(rs.getInt(1));	//primary key of the course in column 0
        	data[index][1]=rs.getString(2);					//course name in column 1
        	index++;
        }
    	return data;
    }
    
    /*
     * Retrieving all faculty in faculty table
     * return String[][]
     */
    public String[][] getAllFaculty() throws SQLException {
    	String sql="select * from faculty";
		stmt = connection.createStatement();
        rs = stmt.executeQuery(sql);
        String[][] data=new String[rs.getFetchSize()][2];
        int index=0;
        while(rs.next()) {
        	data[index][0]=String.valueOf(rs.getInt(1));   // column 0 holds the primary keys
        	data[index][1]=rs.getString(2)+" "+ rs.getString(3)+" "+rs.getString(4);	//column 1 holds the full name (first, middle, and last) of the faculty
        	index++;
        }
    	return data;
    }
    /*
     * Retrieves all available offers in the offered table
     * @return String[][]
     */
    public String[][] getAllOffers() throws SQLException {
    	
    	String sql="select * from offered";
		stmt = connection.createStatement();
        rs = stmt.executeQuery(sql);
        String[][] data=new String[rs.getFetchSize()][2];
        int index=0;
        while(rs.next()) {
        	data[index][0]=String.valueOf(rs.getInt(1));  //column 0 primary keys
        	data[index][1]=String.valueOf(rs.getInt(2))+"&"+ String.valueOf(rs.getInt(3));  //column 1 holds the course id and the faculty id
        	index++;
        	//+"&"+ String.valueOf(rs.getInt(3)+"&"+ rs.getString(4))
        }
    	return data;
    }
    /*
     * Retrieves the name of students enrolled in a specific course for a specific year
     * @param course =the name of the course
     * @param semester 
     * @param year
     * @return String[][]
     */
    public String[][] courseTakenInSpecificYear(String course, String semester, int year) throws SQLException {
    	String sql="select s.fname, s.lname, f.fname, f.lname " + 
    			"from student s, Faculty f, Course c, Enrolled e, Offered o" + 
    			" where e.sid=s.sid and o.oid=e.oid and c.cid=o.cid and f.fid=o.fid and o.semester='"+semester.toLowerCase()+"' and c.cname='"+course.toLowerCase()+"' and o.year="+year+"";
		stmt = connection.createStatement();
        rs = stmt.executeQuery(sql);
        String[][] data=new String[rs.getFetchSize()][2];
        int index=0;
        while(rs.next()) {
        	data[index][0]=rs.getString(1)+" "+rs.getString(2);       //column 0 holds the first and last name of student
        	data[index][1]=rs.getString(3)+" "+rs.getString(4);		//column 1 holds the first and last name of faculty
        	index++;
        }
        System.out.println("Obtained Courses Taken");
    	return data;
    }
    /*
     * Retrieves all of the offers for a specific semester and year
     * @param semester 
     * @param year
     * @return String[]
     */
    public String[] getAllOffers(String semester, int year)throws SQLException  {
    	String sql="select c.cid, c.cname, c.meets_at, c.room, f.fname, f.mname, f.lname, o.oid " + 
    			"from Faculty f, Course c, Offered o" + 
    			" where c.cid=o.cid and f.fid=o.fid and o.semester='"+semester.toLowerCase()+"' and o.year="+year+"";
		stmt = connection.createStatement();
        rs = stmt.executeQuery(sql);
        String[] data=new String[rs.getFetchSize()];
        int index=0;
        while(rs.next()) {
        	// array order: [course id, course name, first name, middle name, last name, meet location, offer id ]
        	data[index]=String.valueOf(rs.getInt(1))+"&"+(rs.getString(2))+"&"+ rs.getString(5)+" "+rs.getString(6)+" "+rs.getString(7)+"&"+ rs.getString(3)+ "&"+ rs.getString(4)+"&"+ String.valueOf(rs.getInt(8));
        	index++;
        }
        System.out.println("Obtained Courses Taken");
    	return data;
    }
    /*
     * Retrieves all of the offers available
     * @return String[]
     */
    public static String[] getAllOffer()throws SQLException  {
    	String sql="select c.cid, c.cname, c.meets_at, c.room, f.fname, f.mname, f.lname, o.oid " + 
    			"from Faculty f, Course c, Offered o" + 
    			" where c.cid=o.cid and f.fid=o.fid";

		stmt = connection.createStatement();
        rs = stmt.executeQuery(sql);
        String[] data=new String[rs.getFetchSize()];
        int index=0;
        while(rs.next()) {
        	// array order: [course id, course name, first name, middle name, last name, meet location, offer id ]
        	data[index]=String.valueOf(rs.getInt(1))+"&"+(rs.getString(2))+"&"+ rs.getString(5)+" "+rs.getString(6)+" "+rs.getString(7)+"&"+ rs.getString(3)+ "&"+ rs.getString(4)+"&"+ String.valueOf(rs.getInt(8));        	index++;
        }
        System.out.println("Obtained Courses Taken");
    	return data;
    }
    /*
     * Inserts a class into the course table
     * @return boolean
     */
    public boolean addClass(String cname, String meetAt, String rm) throws SQLException {
    	System.out.println(cname);
    	if(containsRecord(cname)==false) {
        	String sql="insert into course(cname, meets_at, room)"
        			+ "values('"+cname+"',"+"'"+meetAt+"',"+"'"+rm+"');";
        
    		stmt=connection.createStatement();
    		stmt.execute(sql);
    		return true;
    	}
    	return false;
    }
    /*
     * Check if the current class to add is in the course table
     * @param cname -the name of the class
     * @return boolean
     */
    private boolean containsRecord(String cname) throws SQLException{
    	String st="select * from course where cname='"+cname+"'";
    	ResultSet rset;		
    	stmt = connection.createStatement();
        rset = stmt.executeQuery(st);
        if(rset.next()==false) {
        	return false;
        }
        
        return true;
    }
    /*
     * Insert an offer to the offered table
     * @param cid -course id
     * @param fid -faculty id
     * @param semester
     * @param year
     * @return boolean
     */
    public boolean addOffer(int cid, int fid, String semester, int year) throws SQLException {
    	String sql="insert into offered(cid, fid, semester, year)"
    			+ "values("+cid+","+""+fid+","+"'"+semester+"',"+year+");";
    
		stmt=connection.createStatement();
		stmt.execute(sql);
		return true;
    }
    /*
     * Enrolls a student to a course offered
     * @param pk -primary key of the current student
     * @param oid -the primary key of the offer
     * @return boolean
     */
    public boolean enrolling(int pk, int oid) throws SQLException {
    	if(hasEnrolledInSameClass(pk, oid)==false) {
	    	String sql="insert into enrolled(sid, oid) values("+pk+","+oid+");";
			stmt=connection.createStatement();
			stmt.execute(sql);
			return true;
    	}else {
    		return false;
    	}
    	
    }
    /*
     * Retrieves all classes the current student is enrolled in
     * @param pk -the current student primary key
     * @return int[] -the offered ids 
     */
    public static int[] getClassID(int pk) throws SQLException {
    	String sql="select o.oid from offered o, student s, enrolled e where e.sid=s.sid and e.oid=o.oid and e.sid="+pk+";";
		stmt = connection.createStatement();
        rs = stmt.executeQuery(sql);
        int[] data=new int[rs.getFetchSize()];
        int index=0;
        while(rs.next()) {
        	if(rs.getInt("oid")==0)break;
        	data[index]=rs.getInt(1);
        	index++;
        }
        System.out.println("Obtained Courses Taken");
    	return data;
    }
    /*
     * Checks if the current user has enrolled in the specific offer
     * @param pk -current student primary key
     * @param oid -the offer id of current offer
     * @return boolean
     */
    public boolean hasEnrolledInSameClass(int pk, int oid) throws SQLException {
    	String sql="select s.sid, o.oid from offered o, student s, enrolled e where e.sid=s.sid and e.oid=o.oid and e.sid="+pk+" and o.oid="+oid+";";
		stmt = connection.createStatement();
        rs = stmt.executeQuery(sql);
        if(rs.next()) {
        if(rs.getInt(1)==pk && rs.getInt(2)==oid)return true;}
        return false;
    }
    /*
     * Drop a class
     * @param sid -student id (primary key)
     * @param oid -offer id (primary key)
     * @return void
     */
    public static void dropClass(int sid, int oid) throws SQLException {
       	CallableStatement cstmt=connection.prepareCall("{call dropAClass("+sid+", "+oid+")}");
       	cstmt.executeUpdate();
    }
    
    /*
     * Update the current student record
     * @param infor -and array consisting of the student information (first, middle, last name; major, level and birth year)
     * @return void
     */
	@SuppressWarnings("static-access")
	public static void updateStudentProfileInfor(String[] infor) throws NumberFormatException, SQLException {
		int year=Integer.parseInt(infor[5]);
		//call procedure query UpdateUserInfor
       	CallableStatement cstmt=connection.prepareCall("{call UpdateUserInfor("+getStudentInfo().getPK()+", '"+infor[0]+"' , '"+infor[1]+"', "
       			+ "'"+infor[2]+"', '"+infor[3]+"', '"+infor[4]+"', "+year+")}");
       	cstmt.executeUpdate();
	}
	/*
	 * Updates the current student password
	 * @param password 
	 * @return void
	 */
	@SuppressWarnings("static-access")
	public static void updatePassword(String password) throws SQLException {
		//call procedure query UpdateUserPassword which takes two parameters (current student primary key, password)
       	CallableStatement cstmt=connection.prepareCall("{call UpdateUserPassword("+getStudentInfo().getPK()+", '"+password+"')}");
       	cstmt.executeUpdate();
	}

	
	public String [][] assignedFacultyCourses(String sem, int yr) throws SQLException {
		
		String sql="select c.cid, c.cname, c.meets_at, c.room " + 
    			"from Faculty f, Course c, Offered o" + 
    			" where c.cid=o.cid and f.fid=o.fid and o.semester='"+sem.toLowerCase()+"' and o.year="+yr+"";
		stmt = connection.createStatement();
        rs = stmt.executeQuery(sql);
        String[][] facultyCourseoffered = null;
        int index=0;
        int col = 0;
        while(rs.next()) {
        	String data =String.valueOf(rs.getInt(1))+","+(rs.getString(2));//+"&"+ rs.getString(5)+" "+rs.getString(6)+" "+rs.getString(7)+"&"+ rs.getString(3)+ "&"+ rs.getString(4)+"&"+ String.valueOf(rs.getInt(8));
        	StringTokenizer token = new StringTokenizer(data, ",");
        	int sizeToken = token.countTokens();
        	 facultyCourseoffered=new String[rs.getFetchSize()][sizeToken];
        	 while (token.hasMoreTokens()) { 
        		 facultyCourseoffered[index][col] = token.nextToken();
		         System.out.println("2D Array: " + facultyCourseoffered[index][col]);
		        col++; 
		     }
        	
        	index++;
        }
        System.out.println("Obtained Courses Taken");
		
		return facultyCourseoffered;
	}
	/*
	 * closes the connection
	 * @return void
	 */

    public void closeCon() throws Exception
    {
        connection.close();
    }

    
    
} // End of Connect