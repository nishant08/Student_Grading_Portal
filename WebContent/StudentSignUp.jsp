<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
	String LoginId=request.getParameter("LoginId");
	if(LoginId.length()!=8)
	{
		String message="Your Roll Number Should Be not Longer Than 8";
		response.sendRedirect("StudentSignUpForm.jsp?SignUpMsg="+message);
	}
	session.setAttribute("LoginId",LoginId);
	String Password=request.getParameter("Password");
	String FirstName=request.getParameter("FirstName");
	String LastName=request.getParameter("LastName");
	String EmailId=request.getParameter("EmailId");
	String PhoneNumber=request.getParameter("PhoneNumber");
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/GradingPortal","root","xpd54");
	Statement st= con.createStatement();
	ResultSet rs;
	int i=st.executeUpdate("insert into StudentLogin values ('"+LoginId+"','"+Password+"','"+FirstName+"','"+LastName+"','"+EmailId+"','"+PhoneNumber+"')"); 
	String message="Login With your Roll Number and Password" ;
	response.sendRedirect("StudentLogin.jsp?dologin="+message);

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