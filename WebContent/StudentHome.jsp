<%@ page contentType="text/html; charset=iso-8859-1" language="java"%>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>Student Home</title>
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
        if(trim(document.Performance.CourseId.value)=="")
        {
          alert("Login empty");
          document.Performance.CourseId.focus();
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
 width="899"> <br><br><br><br><br><br><br> <br><br></div>
</div>

<%

Connection con = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GradingPortal","root","xpd54");
ResultSet rs = null;
PreparedStatement ps = null;
try
{
	
	String LoginId = session.getAttribute("LoginId").toString();
	out.print("<h3>Welcome! "+session.getAttribute("FirstName")+"</h3><br>");
	String query="select StudentCourseDetails.CourseId, StudentCourseDetails.CourseType, StudentCourseDetails.Credit, CourseDetails.CourseName  from StudentCourseDetails inner join CourseDetails on StudentCourseDetails.CourseId = CourseDetails.CourseId where StudentCourseDetails.RollNumber = '"+LoginId+"';";
	ps = con.prepareStatement(query);
	rs = ps.executeQuery();
			%>
			<a href="Logout.jsp">Logout</a><br>
			<a href="CourseOptionTable.jsp" target="blank" > Click To See All Courses</a><br>
			<a href="AddCourses.jsp">Click to Add Courses<br></a>
			<table border="">
			<tr>
			<th>No</th>
			<th>CourseId</th>
			<th>Course Name</th>
			<th>Course Type</th>
			<th>Credit</th>
			</tr>
			
			<%
			int i=1;
			while(rs.next())
			{
				out.println("<tr><td>"+i+"</td>");
				out.println("<td>"+rs.getString(1)+"</td>");
				out.println("<td>"+rs.getString(4)+"</td>");
				out.println("<td>"+rs.getString(2)+"</td>");
				out.println("<td>"+rs.getString(3)+"</td>");
				i++;
			}
			%>
			</table><br>
			
			<FORM  name="Performance" action="StudentHome.jsp" method="post" onSubmit="return validate();">
			To know about Course put CourseId:
            <INPUT name="CourseId" type="text">
			<INPUT type="submit" value="Submit" > 
			</FORM>
			<%
			String CourseId = request.getParameter("CourseId");
			if(CourseId != null)
			{
				String sql="select * from StudentPerformance where (RollNumber, CourseId) = ('"+LoginId+"','"+CourseId+"');";
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();

				
				if(rs.next())
				{
					%>
					<table border="">
					<tr>
					<th>CourseId</th>
					<th>Quiz1</th>
					<th>Quiz2</th>
					<th>Quiz3</th>
					<th>Quiz4</th>
					<th>Mid Sem Marks</th>
					<th>End Sem	Marks</th>
					<th>Total</th>
					<th>Grade</th>
					</tr>
					<%
					out.println("<tr><td>"+rs.getString(2)+"</td>");
					out.println("<td>"+rs.getString(3)+"</td>");
					out.println("<td>"+rs.getString(4)+"</td>");
					out.println("<td>"+rs.getString(5)+"</td>");
					out.println("<td>"+rs.getString(6)+"</td>");
					out.println("<td>"+rs.getString(7)+"</td>");
					out.println("<td>"+rs.getString(8)+"</td>");
					out.println("<td>"+rs.getString(9)+"</td>");
					out.println("<td>"+rs.getString(10)+"</td></tr>");
				}
				else
				out.println("<b>Either You are not in course or data not found");
				
				
			}
			%></table><%
}

catch(Exception e)
{
	out.println("<b>you are not login");
	out.println("<br><a href="+"StudentLogin.jsp"+">Click Here to Login</a>");
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