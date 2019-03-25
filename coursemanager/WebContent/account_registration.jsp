<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Register</title>

  <!-- Bootstrap core CSS -->
  <link href="f_sources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="f_sources/css/business-frontpage.css" rel="stylesheet">
</head>

<body style="background-color: #5e5e5e">
    <!-- Page Content -->
  <div class="container" id="student">
  <h1>WINSTON-SALEM STATE UNIVERSITY</h1>
  <h3>Student Registration</h3>
  
  <!-- form -->
	<form action="<%= request.getContextPath()%>/SiteNavigator?action=register_s" method="post">
		First Name: <input type="text" name="s_firstname" placeholder="Enter First Name">
					</br>	
		Middle Name: <input type="text" name="s_middlename" placeholder="Enter middle Name">
					</br>	
		Last Name: <input type="text" name="s_lastname" placeholder="Enter Last Name">
					</br>	
		Date of Birth: <select name="s_bd_day">
						<option value="-1">Day:</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						 
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						 
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						 
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						 
						<option value="31">31</option>
						</select>
						
						<select name="s_bd_month">
						<option value="-1">Month:</option>
						<option value="January">Jan</option>
						<option value="February">Feb</option>
						<option value="March">Mar</option>
						<option value="April">Apr</option>
						<option value="May">May</option>
						<option value="June">Jun</option>
						<option value="July">Jul</option>
						<option value="August">Aug</option>
						<option value="September">Sep</option>
						<option value="October">Oct</option>
						<option value="November">Nov</option>
						<option value="December">Dec</option>
						</select>
						
						<select name="s_bd_year">
 
						<option value="-1">Year:</option>
						<option value="2012">2019</option>
						<option value="2011">2018</option>
						<option value="2010">2017</option>
						<option value="2009">2016</option>
						<option value="2008">2015</option>
						<option value="2007">2014</option>
						<option value="2006">2013</option>
						
						<option value="2012">2012</option>
						<option value="2011">2011</option>
						<option value="2010">2010</option>
						<option value="2009">2009</option>
						<option value="2008">2008</option>
						<option value="2007">2007</option>
						<option value="2006">2006</option>
						<option value="2005">2005</option>
						<option value="2004">2004</option>
						<option value="2003">2003</option>
						<option value="2002">2002</option>
						<option value="2001">2001</option>
						<option value="2000">2000</option>
						 
						<option value="1999">1999</option>
						<option value="1998">1998</option>
						<option value="1997">1997</option>
						<option value="1996">1996</option>
						<option value="1995">1995</option>
						<option value="1994">1994</option>
						<option value="1993">1993</option>
						<option value="1992">1992</option>
						<option value="1991">1991</option>
						<option value="1990">1990</option>
						 
						<option value="1989">1989</option>
						<option value="1988">1988</option>
						<option value="1987">1987</option>
						<option value="1986">1986</option>
						<option value="1985">1985</option>
						<option value="1984">1984</option>
						<option value="1983">1983</option>
						<option value="1982">1982</option>
						<option value="1981">1981</option>
						<option value="1980">1980</option>
						</select>
						</br>
		Email ID: <input type="text" name="s_email" placeholder="example111@rams.wssu.edu"> </br>
		Mobile Number: <input type="text" name="s_mobile">
						</br>	
		Gender <input type="radio" name="s_gender" value="male" /> Male
		 <input type="radio" name="s_gender" value="female" />Female
						 </br>	
		Classification:<select name="s_class">
			           <option value="freshmen">Freshmen</option>
			   		   <option value="sophomore">Sophomore</option>
			   		   <option value="junior">Junior</option>
			   		   <option value="senior">Senior</option>
	         			</select>
	         			<br/>
        Concentration: 	<select name="s_concentration">
        				<option value="networking">Networking</option>
						<option value="database_admin">Database Admin.</option>
						<option value="computer_graphics">Computer Graphics</option>
						<option value="ecommerce_internet_systems">eCommerce/Internet Systems</option>
						<option value="information_security">Information Security</option>
						<option value="space_cience">Space Science</option>
						<option value="high_perform_computing">High Perform. Computing</option>
						<option value="theoretical_computer_sci.">Theoretical Computer Sci.</option> 
						</select>
						</br>	
		Username: <input type="text" name="s_username" placeholder="Enter Username"> </br>
		Password: <input type="password" name="s_password" placeholder="Enter Password"> </br>
			Have an account? <a href="login.jsp">Login</a></br>
		<input type="submit" value="Submit">
	</form>	
  </div>
  
    <div class="container" id="faculty">
  <h1>WINSTON-SALEM STATE UNIVERSITY</h1>
  <h3>Faculty Registration</h3>
  
  <!-- form -->
	<form action="<%= request.getContextPath()%>/SiteNavigator?action=register_f" method="post">
		First Name: <input type="text" name="f_firstname" placeholder="Enter First Name">
					</br>	
		Middle Name: <input type="text" name="f_middlename" placeholder="Enter middle Name">
					</br>	
		Last Name: <input type="text" name="f_lastname" placeholder="Enter Last Name">
					</br>	
		Date of Birth: <select name="f_bd_day">
						<option value="-1">Day:</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						 
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						 
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						 
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						 
						<option value="31">31</option>
						</select>
						
						<select name="s_bd_month">
						<option value="-1">Month:</option>
						<option value="January">Jan</option>
						<option value="February">Feb</option>
						<option value="March">Mar</option>
						<option value="April">Apr</option>
						<option value="May">May</option>
						<option value="June">Jun</option>
						<option value="July">Jul</option>
						<option value="August">Aug</option>
						<option value="September">Sep</option>
						<option value="October">Oct</option>
						<option value="November">Nov</option>
						<option value="December">Dec</option>
						</select>
						
						<select name="s_bd_year">
 
						<option value="-1">Year:</option>
						<option value="2012">2019</option>
						<option value="2011">2018</option>
						<option value="2010">2017</option>
						<option value="2009">2016</option>
						<option value="2008">2015</option>
						<option value="2007">2014</option>
						<option value="2006">2013</option>
						
						<option value="2012">2012</option>
						<option value="2011">2011</option>
						<option value="2010">2010</option>
						<option value="2009">2009</option>
						<option value="2008">2008</option>
						<option value="2007">2007</option>
						<option value="2006">2006</option>
						<option value="2005">2005</option>
						<option value="2004">2004</option>
						<option value="2003">2003</option>
						<option value="2002">2002</option>
						<option value="2001">2001</option>
						<option value="2000">2000</option>
						 
						<option value="1999">1999</option>
						<option value="1998">1998</option>
						<option value="1997">1997</option>
						<option value="1996">1996</option>
						<option value="1995">1995</option>
						<option value="1994">1994</option>
						<option value="1993">1993</option>
						<option value="1992">1992</option>
						<option value="1991">1991</option>
						<option value="1990">1990</option>
						 
						<option value="1989">1989</option>
						<option value="1988">1988</option>
						<option value="1987">1987</option>
						<option value="1986">1986</option>
						<option value="1985">1985</option>
						<option value="1984">1984</option>
						<option value="1983">1983</option>
						<option value="1982">1982</option>
						<option value="1981">1981</option>
						<option value="1980">1980</option>
						</select>
						</br>
		Email ID: <input type="text" name="f_email" placeholder="example@wssu.edu"> </br>
		Mobile Number: <input type="text" name="s_mobile">
						</br>	
		Gender <input type="radio" name="f_gender" value="male" /> Male
		 <input type="radio" name="f_gender" value="female" />Female
						 </br>	
        Research Field: 	<select name="f_field">
        				<option value="networking">Networking</option>
						<option value="database_admin">Database Admin.</option>
						<option value="computer_graphics">Computer Graphics</option>
						<option value="ecommerce_internet_systems">eCommerce/Internet Systems</option>
						<option value="information_security">Information Security</option>
						<option value="space_cience">Space Science</option>
						<option value="high_perform_computing">High Perform. Computing</option>
						<option value="theoretical_computer_sci.">Theoretical Computer Sci.</option> 
						</select>
						</br>	
		Username: <input type="text" name="f_username" placeholder="Enter Username"> </br>
		Password: <input type="password" name="f_password" placeholder="Enter Password"> </br>
		Have an account? <a href="login.jsp">Login</a></br>
		<input type="submit" value="Submit">
	</form>	
  </div>
  <!-- Footer -->
  <footer class="py-5">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="f_sources/vendor/jquery/jquery.min.js"></script>
  <script src="f_sources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
</body>
</html>

