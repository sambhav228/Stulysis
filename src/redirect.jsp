<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String x=request.getParameter("x");
if(x.equals("Courses"))
response.sendRedirect("updated.jsp");
else if (x.equals("My Events"))
response.sendRedirect("admindisplay.jsp");
else if (x.equals("Profile"))
response.sendRedirect("profile.jsp");
else if (x.equals("Logout"))
response.sendRedirect("login.html");
%>