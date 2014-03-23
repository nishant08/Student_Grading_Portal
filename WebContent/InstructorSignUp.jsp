<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String LoginId=request.getParameter("LoginId");
session.setAttribute("LoginId",LoginId);
String Password=request.getParameter("Password");
String FirstName=request.getParameter("FirstName");
String LastName=request.getParameter("LastName");
String RoomNumber=request.getParameter("RoomNumber");
String EmailId=request.getParameter("EmailId");
String PhoneNumber=request.getParameter("PhoneNumber");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GradingPortal","root","xpd54");
Statement st= con.createStatement();
ResultSet rs;
int i=st.executeUpdate("insert into InstructorLogin values ('"+LoginId+"','"+Password+"','"+FirstName+"','"+LastName+"','"+RoomNumber+"','"+EmailId+"','"+PhoneNumber+"')"); 
String message="Login With your Fculty Id and Password" ;
response.sendRedirect("InstructorLogin.jsp?dologin="+message);

%>