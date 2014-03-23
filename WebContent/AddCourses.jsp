<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Welcome to Student Grading Portal</title>
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta http-equiv="Content-Type"
 content="text/html; charset=iso-8859-1">
  <link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Courses</title>
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
 width="899"><br><br><br><br><br><br><br><br><br><br></div>
</div>
	<form action="AddCourses.jsp" method="post" >
	Number Of Courses You Want To Add:
	<select name="NumberOfCourses">
		<option value="1">One</option>
		<option value="2">Two</option>
		<option value="3">Three</option>
		<option value="4">Four</option>
		<option value="5">Five</option>
		<option value="6">Six</option>
	</select>
	<input type="submit" value="Submit" >
	</form>
	<%
		int NumberOfCourses=0;
		if(request.getParameter("NumberOfCourses")!=null)
		{
			NumberOfCourses=Integer.parseInt(request.getParameter("NumberOfCourses"));
			session.setAttribute("NumberOfCourses",NumberOfCourses);
			String Course = "Course";
			String CourseType = "CourseType";
			int count=1;
			%><form action="AddCoursesInDatabase.jsp"><%
			while(NumberOfCourses>0)
			{	
				
				out.println(Course+count);
				out.println("<input type="+"text"+" name="+Course+NumberOfCourses+">");
				
				
				out.println("<select name="+CourseType+NumberOfCourses+">");
				out.println("<option value="+"CompulsoryCourse"+">Compulsory Course</option>");
				out.println("<option value="+"ProgrammElective"+">Programm Elective</option>");
				out.println("<option value="+"OpenElective"+">Open Elective</option>");
				out.println("<option value="+"HssElective"+">Hss Elective</option></select><br>");
				NumberOfCourses--;
				count++;
			}
			%>
			<input type="submit" value="Submit" >
			</form>
			<%
			
			
		}
		
		
	%>
	
<br><br><br><br><br>
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