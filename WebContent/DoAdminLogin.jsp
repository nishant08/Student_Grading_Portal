<%@ page language="java" import="java.sql.*" errorPage="" %>
<%

    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GradingPortal","root","xpd54");
    
    ResultSet rsDoLogin = null;
    PreparedStatement psDoLogin=null;
    
    String LoginId=request.getParameter("LoginId");
    String Password=request.getParameter("Password");
    String message="User login successfully ";
try
{
	String sqlOption="select * from AdminLogin where LoginId='"+LoginId+"'";
	psDoLogin=conn.prepareStatement(sqlOption);
	//psDoLogin.setString(1,LoginId);
	//psDoLogin.setString(2,Password);
	rsDoLogin=psDoLogin.executeQuery();
	if(rsDoLogin.next())
	{
		//String sUserName=rsDoLogin.getString("FirstName")+" "+rsDoLogin.getString("LastName");
		session.setAttribute("AdminLoginId",rsDoLogin.getString("LoginId"));
		//session.setAttribute("iUserType",rsDoLogin.getString("iUserType"));
		//session.setAttribute("iUserLevel",rsDoLogin.getString("iUserLevel"));
		//session.setAttribute("sUserName",sUserName);
		if(rsDoLogin.getString(2).equals(Password))
		response.sendRedirect("AdminHome.jsp?error="+message);
		//out.println("welcome "+LoginId);
	}
    else
    {
    	message="No user or password matched" ;
    	response.sendRedirect("AdminLogin.jsp?error="+message);
    }
}
catch(Exception e)
{
	e.printStackTrace();
}
    
    
    /// close object and connection
try
    {
         if(psDoLogin!=null)
         {
        	 psDoLogin.close();
         }
         if(rsDoLogin!=null)
         {
        	 rsDoLogin.close();
         }
         
         if(conn!=null)
         {
        	 conn.close();
         }
    }
catch(Exception e)
	{
		e.printStackTrace();
	}

%>