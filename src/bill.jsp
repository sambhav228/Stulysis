<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PAYMENT PORTAL</title>
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
<form action="finalpay.jsp" method="post">
<% String course=request.getParameter("x");
String price=request.getParameter("y"); %>
<article>
<table align="center">
<tr>
<td>
You are making a payment of an amount of <%=price%> for the course <%=course %>
</td>
</tr>
<tr>
<td>
Enter the mode of payment:
</td></tr>
<tr>
<td><input type="radio" name="mode" value="Debit Card">DEBIT CARD</td></tr>
<tr><td><input type="radio" name="mode" value="Credit Card">CREDIT CARD</td></tr>
<tr><td><input type="radio" name="mode" value="G Pay">G PAY</td></tr>
<tr><td><input type="radio" name="mode" value="Phone Pe">PHONE PE</td></tr>
<tr><td><input type="submit" value="PAY AMOUNT"></td></tr>
</table>
</article>
</form>
</body>
</html>