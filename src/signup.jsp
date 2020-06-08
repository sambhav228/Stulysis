<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import=" javax.servlet.*,
javax.servlet.http.*,
java.io.*,
java.sql.*" %>
<%!


Connection con;
Statement stmt;
ResultSet rs;
%>

<%


               String email = request.getParameter("email");
               String fname = request.getParameter("fname");
               String uname = request.getParameter("uname");
               String mobno=request.getParameter("mobno");
String psw = request.getParameter("password");

//connect with oracleDB to check whether userdetails available or not
try{
//connection estatblishment

Class.forName("oracle.jdbc.driver.OracleDriver");

con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");


String st7="insert into details values(?,?,?,?,?)";
PreparedStatement ps = con.prepareStatement(st7);
ps.setString(1,email);
ps.setString(2,fname);
ps.setString(3,uname);
ps.setString(4,mobno);
ps.setString(5,psw);
int f=ps.executeUpdate();

out.println("<body bgcolor=#48C9B0 ><center>");
out.println("<h2>");


if( f>0){
out.println("Signup Success<br>");
out.println("Please &nbsp;&nbsp; <a href=login.html>Login</a> &nbsp;&nbsp; here");
}else{
out.println("Invalid Credentials<br>");
out.println("Please &nbsp;&nbsp; <a href=signup.html>Signup</a> &nbsp;&nbsp; Again");
}

out.println("</h2></center></body>");

}catch(Exception e){
out.println(e.getMessage());
}finally{
//close the connection
try{
con.close();
}catch(Exception e1){}
}
%>