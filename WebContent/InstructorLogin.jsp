<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%
String error=request.getParameter("error");
if(error==null || error=="null"){
 error="";
}
%>
<%
String dologin=request.getParameter("dologin");
if(dologin==null|| dologin=="null")
	dologin="";
%>
<html>
<head>
  <title>Instructor Login</title>
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta http-equiv="Content-Type"
 content="text/html; charset=iso-8859-1">
  <link href="css/style.css" rel="stylesheet" type="text/css">

  
  <title>Instructor Login</title>
<script>
    function trim(s) 
    {
        return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
    }

    function validate()
    {
        if(trim(document.FormLogin.LoginId.value)=="")
        {
          alert("Login empty");
          document.FormLogin.LoginId.focus();
          return false;
        }
        else if(trim(document.FormLogin.Password.value)=="")
        {
          alert("password empty");
          document.FormLogin.Password.focus();
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

<br><br><br><br><br><br><br>
<div><%=error%></div>
<div><%=dologin %></div>
<div align="center"><h1>Instructor Login</h1>
<br><br><br><br>
<form name="FormLogin" onSubmit="return validate();" action="DoInstructorLogin.jsp" method="post">
<ul>

<li>Login Id:&nbsp<input type="text" name="LoginId" size=20><br><br></li>
Password:<input type="password" name="Password" size=20><br><br>
<p><input type="submit" name="FormSubmit"value="SignIn"></p><br>
</form>
<form action="InstructorSignUpForm.jsp" method="post" >
If Don't Have a Account<br><br>
<input type="submit" value="SignUp"><br><br>
</form>
</div>

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