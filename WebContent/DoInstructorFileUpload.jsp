<%@ page import="java.io.*" %>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%
	//to get the content type information from JSP Request Header
	String contentType = request.getContentType();
	//here we are checking the content type is not equal to Null and as well as the passed data from mulitpart/form-data is greater than or equal to 0
	if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) 
	{
 		DataInputStream in = new DataInputStream(request.getInputStream());
		//we are taking the length of Content type data
		int formDataLength = request.getContentLength();
		byte dataBytes[] = new byte[formDataLength];
		int byteRead = 0;
		int totalBytesRead = 0;
		//this loop converting the uploaded file into byte code
		while (totalBytesRead < formDataLength) {
			byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
			totalBytesRead += byteRead;
			}

		String file = new String(dataBytes);
		//for saving the file name
		String saveFile = file.substring(file.indexOf("filename=\"") + 10);
		saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
		saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
		int lastIndex = contentType.lastIndexOf("=");
		String boundary = contentType.substring(lastIndex + 1,contentType.length());
		int pos;
		//extracting the index of file 
		pos = file.indexOf("filename=\"");
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		pos = file.indexOf("\n", pos) + 1;
		int boundaryLocation = file.indexOf(boundary, pos) - 4;
		int startPos = ((file.substring(0, pos)).getBytes()).length;
		int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

		// creating a new file with the same name and writing the content in new file
		FileOutputStream fileOut = new FileOutputStream(saveFile);
		fileOut.write(dataBytes, startPos, (endPos - startPos));
		fileOut.flush();
		fileOut.close();
		%><Br><table><tr><td><b>You have successfully uploaded the file by the name of:</b>
		<% out.println(saveFile); %>
		<br>Please close this window
		<% session.setAttribute("File",saveFile); %></td></tr></table> <%
	}
	
%>	
	<!--// upload the file in databases;-->
	
	
	
	
	
<%	
	Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GradingPortal","root","xpd54");
    
    ResultSet rs = null;
    PreparedStatement ps=null;
    String message="User login successfully ";
try
{
	String sqlOption="load data local infile '/home/xpd54/"+session.getAttribute("File").toString()+"' replace into table StudentPerformance fields terminated by ',' lines terminated by '\n' ignore 1 lines (RollNumber,CourseId,Quiz1,Quiz2,Quiz3,Quiz4,MidSemMarks,EndSemMarks,Total,Grade) set CourseId='"+session.getAttribute("CourseId").toString()+"' ;";
	ps=conn.prepareStatement(sqlOption);
	rs=ps.executeQuery();
	if(rs.next())
	{
		response.sendRedirect("InstructorHome.jsp?error="+message);
	}
    else
    {
    	message="No user or password matched" ;
    	response.sendRedirect("InstructorLogin.jsp?error="+message);
    }
}
catch(Exception e)
{
	e.printStackTrace();
}
    
    
    /// close object and connection
try
    {
         if(ps!=null)
         {
        	 ps.close();
         }
         if(rs!=null)
         {
        	 rs.close();
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
