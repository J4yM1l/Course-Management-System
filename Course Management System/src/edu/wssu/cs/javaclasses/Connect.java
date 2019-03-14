package edu.wssu.cs.javaclasses;

import java.sql.*;
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
     Connection connection = null;
     Statement stmt = null;
     ResultSet rs = null;

    /**
     * Constructor for objects of class Connect
     */
    public Connect()throws Exception {
        // Get connection
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
        connection = DriverManager.getConnection("jdbc:sqlserver://localhost\\SQLEXPRESS;databaseName=CST6306;integratedSecurity=true");
        //connection = DriverManager.getConnection("jdbc:sqlserver://CSCSQL;user=cst6306;password=cst6306");
        //connection = DriverManager.getConnection("jdbc:sqlserver://152.12.24.165;databaseName=CST6306;user=cst6306;password=cst6306");
        if (connection != null) {
            System.out.println();
            System.out.println("Successfully connected");
            System.out.println();
            // Meta data
            DatabaseMetaData meta = connection.getMetaData();
            System.out.println("\nDriver Information");
            System.out.println("Driver Name: "+ meta.getDriverName());
            System.out.println("Driver Version: "+ meta.getDriverVersion());
            System.out.println("\nDatabase Information ");
            System.out.println("Database Name: "+ meta.getDatabaseProductName());
            System.out.println("Database Version: "+meta.getDatabaseProductVersion());
            System.out.println();
        }
    }

    public String execQuery() throws Exception{
        // Create and execute an SQL statement that returns some data.
        String sql="select * from sailors";
        stmt=connection.createStatement();
        rs=stmt.executeQuery(sql);  
        StringBuilder data=new StringBuilder();
        // Iterate through the data in the result set and display it.
        data.append("ID  NAME    RATING  AGE\n");
        data.append("=======================\n");
         while (rs.next()) {
            data.append(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getInt(3)+" "+rs.getDouble("age")+"\n");
         }
         return data.toString();
    } // execQuery
    
    public void closeCon() throws Exception
    {
        connection.close();
    }

    
} // End of Connect