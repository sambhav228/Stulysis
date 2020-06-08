<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
  background-color: AntiqueWhite;
  padding: 45px;
  font-size: 30px;
}
article {
  float: center;
  padding: 10px;
 
  background-color: #f1f1f1;
  height: 590px; /* only for demonstration, should be removed */
  font-size: 70px;
  text-align: center;
}
footer {
  background-color: AntiqueWhite;
  padding: 10px;
  text-align: center;
  color: white;
}
</style>
</head>
<body>
<form action="redirect.jsp" method="post">
<header>
 <table  align='right'>
  <tr>
  <td><input type="submit"  name="x" value="Courses"> &nbsp</td>
  <td><input type="submit"  name="x" value="My Events"> &nbsp</td>
  <td><input type="submit"  name="x" value="Profile"> &nbsp</td>
  <td><input type="submit"  name="x" value="Logout"></td>
 </tr>
 </table>
</header>
<article>
    <p><br><br>
    Welcome! <%=session.getAttribute("uname") %></p>
  </article>
  <footer>
  Copyright © group 7
  </footer>
  </form>
</body>
</html>