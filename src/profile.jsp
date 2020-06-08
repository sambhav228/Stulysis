<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%!
String uname,email,fullname,pwd,mobno;
%>
<%
try{
uname=(String) session.getAttribute("uname");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
PreparedStatement pstmt=con.prepareStatement("select * from details where uname=?");
pstmt.setString(1,uname);
ResultSet rs=pstmt.executeQuery();
while(rs.next()){
email=rs.getString(1);
fullname=rs.getString(2);
mobno=rs.getString(4);
pwd=rs.getString(5);
}
}
catch(Exception e){
out.println(e.getMessage());
}
%>
<html>
<head>
<title>Profile</title>

  <style>
  article {
  float: center;
  padding: 20px;
  background-color: #f1f1f1;
  height: 690px; /* only for demonstration, should be removed */
 
   }
   
div {
  width: 320px;
  padding: 10px;
  border: 2px solid gray;
  margin: 0;
 }

</style>
</head>

<body>
<form action="delete.jsp" method="post">
<article>
Account:<br>
<div>
Full name <br>
<input type="text" value=<%=fullname %>><br>
Email Address <br>
<input type="text" value=<%=email%>><br>
Username <br>
<input type="text" value=<%=uname%>><br>
Mobile Number <br>
<input type="text" value=<%=mobno%>><br>
</div>
<br>
<br>
Delete Account <br>
<div>
If you delete your account, your personal information and work will be deleted from our server. This action cannot be undone!<br><br>
<input type="submit" name="sub" value="DELETE ACCOUNT">
</div>
</article>
</form>
</body>
</html>