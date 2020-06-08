<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
try{
String uname=(String) session.getAttribute("uname");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
PreparedStatement pstmt=con.prepareStatement("select * from coursedetails where uname=?");
pstmt.setString(1,uname);
ResultSet rs=pstmt.executeQuery();
%>
<html>
<body style="background-color: Azure";>
<center><h1>MY EVENTS</h1></center>
<br><br>
<table align="center"  border="1">
<tr>
<td>COURSE</td>
<td>PRICE</td>
<td>DATE</td>
<td>TIME</td>
<td>VENUE</td>
<td>MODE OF PAYMENT</td>
</tr>
<%
while(rs.next()){
%>
<tr>
<td><%out.println(rs.getString(2));%></td>
<td><%out.println(rs.getInt(3));%></td>
<td><%out.println(rs.getString(4));%></td>
<td><%out.println(rs.getString(5));%></td>
<td><%out.println(rs.getString(6));%></td>
<td><%out.println(rs.getString(7));%></td>

</tr>
<%
}
%></table>
</body>
</html>
<%
}
catch(Exception e){
out.println(e.getMessage());
}
%>