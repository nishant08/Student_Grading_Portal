<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>Student Course Details</title>
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta http-equiv="Content-Type"
 content="text/html; charset=iso-8859-1">
  <link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Student Course Information</title>
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
 width="899"> <br><br><br><br><br><br><br> <br><br><br></div>
</div>
<%
	Connection con = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GradingPortal","root","xpd54");
	ResultSet rs = null;
	PreparedStatement ps = null;
	try
	{
		String CourseId=request.getParameter("CourseId");
		session.setAttribute("CourseId",CourseId);
		String LoginId = session.getAttribute("LoginId").toString();
		String query="select * from CourseDetails where   CourseId='"+CourseId+"' and FacultyId='"+LoginId+"'";
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();
		if(rs.next())
		{
			if( rs.getString(1).equals(CourseId) && rs.getString(4).equals(LoginId) )
			{
				String StudentCourseQuery="select * from StudentPerformance where CourseId = '"+rs.getString(1)+"'";
				
				
				//String TotalUpdate = "update StudentCourseDetails set Total = Quiz1+Quiz2+Quiz3+Quiz4+MidSemMarks+EndSemMarks";
				//PreparedStatement ps2 = con.prepareStatement(TotalUpdate);
				//ps2.executeQuery();
				
				
				
				ps = con.prepareStatement(StudentCourseQuery);
				rs = ps.executeQuery();
				%>
				
				<br><br>
				<p>Upload The .csv File In Given Format</p>
				<FORM  ENCTYPE="multipart/form-data" ACTION="DoInstructorFileUpload.jsp" METHOD=POST>
                    <INPUT NAME="F1" TYPE="file">
					<INPUT TYPE="submit" VALUE="Send File" > 
 				</FORM>
				<table border="">
				<tr>
				<th>No</th>
				<th>Roll No</th>
				<th>Quiz1</th>
				<th>Quiz2</th>
				<th>Quiz3</th>
				<th>Quiz4</th>
				<th>Mid sem</th>
				<th>End sem</th>
				<th>Total</th>
				<th>Grade</th>
				</tr>
				
				<%
				int i=1;
				while(rs.next())
				{
					out.println("<tr><td>"+i+"</td>");
					out.println("<td>"+rs.getString(1)+"</td>");
					out.println("<td>"+rs.getString(3)+"</td>");
					out.println("<td>"+rs.getString(4)+"</td>");
					out.println("<td>"+rs.getString(5)+"</td>");
					out.println("<td>"+rs.getString(6)+"</td>");
					out.println("<td>"+rs.getString(7)+"</td>");
					out.println("<td>"+rs.getString(8)+"</td>");
					out.println("<td>"+rs.getString(9)+"</td>");
					out.println("<td>"+rs.getString(10)+"</td></tr>");
					i++;
				}
				%>
				</table>
				<%

			}
			else
			{
				out.println("Course not found in database");
			}
		}
		else
		{
			out.println("You can't use database");
		}
	}
	
	catch(Exception e)
	{
		out.println("you are not login");
	}
	
	
	try
    {
         
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