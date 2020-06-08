<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,javax.servlet.*,javax.servlet.http.*,java.io.*"%>
<%!
Connection con;
Statement stmt;
ResultSet rs;
%>

<%
try{
String uname=request.getParameter("uname");
String psw=request.getParameter("password");

int flag=0;
int uflag=0;
Class.forName("oracle.jdbc.driver.OracleDriver");
   con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
// String s1="select * from userdetails where uname='"+uname+"'"+"password='"+psw+"'";
 //String s1="select * from userdetails where uname="+uname+ "and password='krishna123'";
String s1= "select * from details";
stmt=con.createStatement();
rs=stmt.executeQuery(s1);
out.println("<body bgcolor=#48C9B0><center>");
out.println("<h2>");

if(rs.next()){

	out.println(rs.next());
uflag=1;

flag=1;
response.sendRedirect("homepage.jsp");
session.setAttribute("uname",uname);

}



if(uflag==1 && flag!=1){
out.println("<center>Invalid Password</center>");

out.println("<center> <a href='forgotpassword.jsp?uname="+uname+"'> forget password</a></center>");
}
if(uflag==0){
out.println("<center>Sorry you are not Signup</center>");
}
}

catch(Exception e){
out.println(e);

}


%>