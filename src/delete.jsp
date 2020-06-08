<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import=" javax.servlet.*,
javax.servlet.http.*,
java.io.*,
java.sql.*,
javax.servlet.RequestDispatcher" %>
<%!

RequestDispatcher rd;
Connection con;
PreparedStatement pstmt;
PreparedStatement pstmt1;
ResultSet rs;
%>
<%
try{
String uname=(String) session.getAttribute("uname");
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
pstmt=con.prepareStatement("delete from coursedetails where username=?");
pstmt.setString(1,uname);
int n=pstmt.executeUpdate();
pstmt1=con.prepareStatement("delete from details where username=?");
pstmt1.setString(1,uname);
int m=pstmt1.executeUpdate();

rd=request.getRequestDispatcher("/login.html");
out.println("account deleted");
rd.include(request,response);

}
catch(Exception e){
out.println(e.getMessage());
}
%>