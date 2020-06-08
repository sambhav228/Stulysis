<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import=" javax.servlet.*,
javax.servlet.http.*,
java.io.*,
java.sql.*,
javax.servlet.RequestDispatcher" %>

<%!
Connection con;
PreparedStatement pstmt;
ResultSet rs;

%>

<%
String uname=(String) session.getAttribute("uname");
String cpwd=request.getParameter("cpwd");
String npwd=request.getParameter("npwd");

try{
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
pstmt=con.prepareStatement("select * from details where username=? and password=?");
pstmt.setString(1,uname);
pstmt.setString(2,cpwd);
rs=pstmt.executeQuery();

if(rs.next())
{
pstmt=con.prepareStatement("update details set password=? where username=?");
pstmt.setString(1,npwd);
pstmt.setString(2,uname);
int n=pstmt.executeUpdate();
if(n>0){
RequestDispatcher rd=request.getRequestDispatcher("/home_page.jsp");
out.println("Password changed successfully");
rd.include(request,response);

}
}
else{
RequestDispatcher rd=request.getRequestDispatcher("/home_page.jsp");
out.println("Incorrect Current Password! Please enter correct password");
rd.include(request,response);
}
}
catch(Exception e){
out.println(e.getMessage());
}
%>