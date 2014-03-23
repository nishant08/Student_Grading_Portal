<%@ page contentType="text/html; charset=iso-8859-1" language="java"%>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%
String error=request.getParameter("error");
if(error==null || error=="null"){
 error="";
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Instructor Home</title>
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta http-equiv="Content-Type"
 content="text/html; charset=iso-8859-1">
  <link href="css/style.css" rel="stylesheet" type="text/css">
<title>Successfully Login</title>
</head>
<script>
    function trim(s) 
    {
        return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
    }

    function validate()
    {
        if(trim(document.CourseDetail.CourseId.value)=="")
        {
          alert("CourseId empty");
          document.CourseDetail.CourseId.focus();
          return false;
        }
    }
</script>
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
 width="899">  <br><br><br><br><br><br><br><br></br></div>
</div>
<%=error %>
<a href="Logout.jsp">Logout</a><br> 

<%

	Connection con=null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GradingPortal","root","xpd54");
	ResultSet rs = null;
	PreparedStatement ps = null;
	try
	{
		String LoginId = session.getAttribute("LoginId").toString();
		String query="select * from CourseDetails where FacultyId = '"+LoginId+"'";
		ps = con.prepareStatement(query);
		rs = ps.executeQuery();
		out.print("<h3>Welcome to you "+session.getAttribute("FirstName")+"</h3><br>");
		out.print("your LoginId is :"+session.getAttribute("LoginId")+"<br>");
		if(rs.next())
		{
			out.println("<br>Courses you are taking<br>");
			%><table border="">
			
			<tr>
			<th>No</th>
			<th>Course Id</th>
			<th>Course Name</th>
			</tr>
			
			<%
			int i=1;
			out.println("<tr><td>"+i+"</td>");
			out.println("<td>"+rs.getString(1)+"</td>");
			out.println("<td>"+rs.getString(2)+"</td></tr>");
			while(rs.next())
			{
				i++;
				out.println("<tr><td>"+i+"</td>");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td></tr>");
			}
			%> </table>
			<form name="CourseDetail" onSubmit="return validate();" action="StudentCourseDetails.jsp" target="blank" >
			CourseId : <input type="text" name="CourseId" >
			<input type="submit" value="Details" >
			</form>
			<%
		}
	}
	
	catch(Exception e)
	{
		out.println("<b>You are not Login</b>");
		out.println("<i><br><a href="+"InstructorLogin.jsp"+">Click Here to Login</a>");
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