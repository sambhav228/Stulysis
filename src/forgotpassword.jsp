<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%!
PreparedStatement pstmt;
Connection con;

%>
<%
String uname=request.getParameter("uname");
%>

<%
try{
//String uname = request.getParameter("uname");
String newpassword = request.getParameter("newpassword");
Class.forName("oracle.jdbc.driver.OracleDriver");
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
  String vsql ="update details set password='"+newpassword +"' where username='"+uname+"'";
//String vsql ="update eplab7 set pwd=? where uname=?";
//String vsql ="update eplab7 set pwd=? where uname=?";
pstmt = con.prepareStatement(vsql);
//pstmt.setString(1,new password);
//pstmt.setString(2,uname);
int n=pstmt.executeUpdate();
out.println("<body bgcolor=#48C9B0><center>");
out.println("<h2>");
if(n!=0){
out.println("password changed successfully");
out.println("<a href=login.html>login</a>");
}
}
catch(Exception e){
out.println(e.getMessage());
}finally{
//close the connection
try{
con.close();
}catch(Exception e1){}
}
 %>