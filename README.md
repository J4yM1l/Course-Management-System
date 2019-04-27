# **PROJECT SETUP**  <br/>
**Make sure the below conditions are met to run the program** <br/>
1. Download [Tomcat 9.0] (https://tomcat.apache.org/download-90.cgi), [Microsoft SQL Server Express 2017] (https://www.microsoft.com/en-us/sql-server/sql-server-editions-express)
	and [Eclipse] (https://www.eclipse.org/downloads/)
	
2. Copy **sqlidbc4.jar** to **C:\Program Files\Apache Software Foundation\Tomcat 9.0\lib**

3. Copy **sqljdbc_auth.dll** to the **C:\Program Files\Java\jre1.8.0_181\bin***
	-**sqljdbc_auth.dll** can be located in the sqljdbc_3.0 folder( **sqljdbc_3.0\enu\auth\x64** )
	
4. Make sure Microsoft SQL Server Accepts TCP/IP
	-If TCP/IP is not enabled, open ***sql server configuration manager**
	-Expend **sql server network configuration** and click ***protocols for sqlexpress**
	-Enable **TCP/IP** and **Named Pipes**
	
5. Make sure **sql server browser** is running

6. Add the Servlet Lib to the project file
	-Right-click the project folder (*cs-course-management-system*), click **build path** -> **configure build Path ..**
	-click **java build Path**-> **libraries->**add externals JARS ...**
	-Locate the Tomcat 9.0's lib folder and add the **serlet-api.jar**
		-Full location: *C:\Program Files\Apache Software Foundation\Tomcat 9.0\lib*
		
end--
