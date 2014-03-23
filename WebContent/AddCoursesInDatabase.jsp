<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Add Courses</title>
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta http-equiv="Content-Type"
 content="text/html; charset=iso-8859-1">
  <link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="refresh" content="3; url=StudentHome.jsp">

</head>
<body>
<div class="main">
<div class="page-out">
<div class="page">
<div class="header">
<div class="header-top">
<h1>Grading Portal</h1>
<ul>
  <li><a href="index.html"><span>Home</span></a></li>
   <li><a href="#"><span>About</span></a></li>
    <li><a href="#"><span>Contact</span></a></li>
</ul>
</div>
<div class="header-img"><img src="images/header.jpg" alt="" height="225"
 width="899"><br><br><br><br><br><br><br><br><br><br><br></div>
</div>
<%
	/*Connection conn = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GradingPortal","root","xpd54");
	
	ResultSet rs = null;
	PreparedStatement ps=null;
	String sql =  "insert into StudentCourseDetails (RollNumber,CourseId,CourseType) values ('y10uc256','MAT-100','CompulsaryElective')";

	ps=conn.prepareStatement(sql);*/
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GradingPortal","root","xpd54");
	Statement st= con.createStatement();
	ResultSet rs=null;
	
	try
	{
		int NumberOfCourses = Integer.parseInt(session.getAttribute("NumberOfCourses").toString());
		String Course = "Course";
		String CourseType = "CourseType";
		String LoginId = session.getAttribute("LoginId").toString();
		for(int i=1;i<=NumberOfCourses;i++)
		{
			out.println(request.getParameter(Course+i));
			out.println(request.getParameter(CourseType+i)+"<br>");
			
			

			int j=st.executeUpdate("insert into StudentCourseDetails values ('"+LoginId+"','"+request.getParameter(Course+i)+"','"+request.getParameter(CourseType+i)+"','0')");
			
		}
		
		out.println("<br><br><b>Your Courses are successfully Added</b>");
		out.println("<br>Please wait while we Redirect you to Home Page .....");
		
	}
	
	catch(Exception e)
	{
		out.println("<b>Either you are not Logged in or the Course does not exist</b>");
		out.println("<br>Redirecting on Home Page .....");
	}
	
	
	try
    {
         if(st!=null)
         {
        	 st.close();
         }
         
         if(con!=null)
         {
        	 con.close();
         }
    }
catch(Exception e)
	{
		e.printStackTrace();
	}
	
%>

<br><br><br><br><br><br><br>
<div class="footer">
<div class="footer-left">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><strong>Contact info</strong></p>
<p>&nbsp;</p>
<p>Rajat Vyas,
Nishant Bansal
<br>
Ravi Prakash,
Itar Mehak<br>
LNMIIT, JAIPUR</p>
</div>
<div class="footer-right">
<ul>
  <li><a href="index.html">Home</a>/</li>
   <li><a href="#">About</a>/</li>
 
  <li><a href="#">Contact</a></li>
</ul>
<!--DO NOT Remove The Footer Links-->
<p>&copy; Copyright 2013. Designed by Y10@SWE-13
<a href="http://www.htmltemplates.net"></a>
<a href="http://www.onlinecasino.im"></a></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>