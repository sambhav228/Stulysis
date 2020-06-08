<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>

<%
String course=request.getParameter("course");
String price=request.getParameter("price");
String venue=request.getParameter("venue");
String date=request.getParameter("date");
String time = request.getParameter("time");
String userName = (String) session.getAttribute("uname");
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
//PreparedStatement pstmt=con.prepareStatement("update details set course=?, price=?, date_of_start=?, time=?, venue=? where username=?");
PreparedStatement pstmt=con.prepareStatement("insert into coursedetails values(?, ?, ?, ?, ?, ?)");
pstmt.setString(1,userName);
pstmt.setString(2,course);
pstmt.setInt(3,Integer.parseInt(price));
pstmt.setString(4,date);
pstmt.setString(5,time);
pstmt.setString(6,venue);
int n=pstmt.executeUpdate();

if(n!=0)
{
%>
<jsp:forward page="/bill.jsp">
<jsp:param name="x" value="<%=course %>" />
<jsp:param name="y" value="<%=price %>" />
</jsp:forward>

<%
}
}
catch(Exception e){
out.println(e.getMessage());
}
%>
    