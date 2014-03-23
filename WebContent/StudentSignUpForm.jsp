<%@ page contentType="text/html; charset=iso-8859-1" language="java"%>
<%
String SignUpMsg=request.getParameter("SignUpMsg");
if(SignUpMsg==null|| SignUpMsg=="null")
	SignUpMsg="";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
 <title>Student SignUp</title>
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta http-equiv="Content-Type"
 content="text/html; charset=iso-8859-1">
  <link href="css/style.css" rel="stylesheet" type="text/css">
<title>Student SignUp Form</title>
<script>
    function trim(s) 
    {
        return s.replace( /^\s*/, "" );
    }

    function validate()
    {
    	if(trim(document.FormSignUp.LoginId.value)=="")
    	{
    		alert("Roll Number empty");
    		document.FormSignUp.LoginId.focus();
    		return false;
        }
        if(trim(document.FormSignUp.Password.value)=="")
        	{
        		alert("password empty");
        		document.FormSignUp.Password.focus();
        		return false;
        	}
    }
</script>
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
 width="899"></div>
</div>

<p><h1>New Account Form</h1><br><br>
<div><%=SignUpMsg %></div>
<form name="FormSignUp" onSubmit="return validate();" action="StudentSignUp.jsp" method="post">
<table>
<tr>
<td> Roll Number:</td><td><input type="text" name="LoginId" size=20><br></td>
</tr>
<tr>
<td> Password:</td><td><input type="password" name="Password" size=20><br></td>
</tr>
<tr>
<td> First Name:</td><td><input type="text" name="FirstName" size=20><br></td>
</tr>
<tr>
<td> Last Name:</td><td><input type="text" name="LastName" size=20><br></td>
</tr>
<tr>
<td> Email Id:</td><td><input type="email" name="EmailId" size=20><br></td>
</tr>
<tr>
<td> Phone Number:</td><td><input type="text" name="PhoneNumber" size=20><h4>(Without any code)<br></h4></td>
</tr>
<tr>
<td><br><input type="submit" value="Sign Up" ></td>
</tr>
</table>
</form>
<br>
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