<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Final Payment</title>
</head>
<body>
<% String x=request.getParameter("mode");
String uname=(String)session.getAttribute("uname");
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
PreparedStatement pstmt=con.prepareStatement("update coursedetails SET uname=?");

pstmt.setString(1,uname);
pstmt.executeUpdate();
}
catch(Exception e){
out.println(e.getMessage());
}
%>
<form action="homepage.jsp" method="post">
<table align="center">
<tr>
<td> The link for the payment is sent to your email id. Kindly open the link to complete the transaction.</td>
</tr>
<tr>
<td><input type="submit" value="GO TO HOMEPAGE"></td>
</tr>
</table>
</form>
</body>
</html>