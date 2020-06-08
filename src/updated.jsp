<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <style>
  body {
    font-family: Arial, Helvetica, sans-serif;
  }

  /* Style the header */
  header {
    background-color: AntiqueWhite;
    padding: 15px;
    font-size: 15px;
  }
  article {
    float: center;
    padding: 25px;
   
    background-color: #f1f1f1;
    height: 550px; /* only for demonstration, should be removed */
    font-size: 30px;
    text-align: center;
  }
  footer {
    background-color: AntiqueWhite;
    padding: 10px;
    text-align: center;
    color: white;
  }
  </style>
  <script>
     function display()
      {
         var data=new Array("None",2500,1500,3500,1000,3000,4000,4500);
         var x=document.getElementById("course").selectedIndex;
         document.getElementById("price").value=data[x];
       }
     
  </script>
</head>
<body>

 <form action="myevents.jsp" method="post">
 <header align="center">
<h2>SELECT YOUR COURSE</h2>
</header>
 <article>
 <br><br><br>
 <table style="border:1px solidblack;margin-left:auto;margin-right:auto;">
 <tr>
  <td>Course:</td>
   <td><select name="course" id="course" onchange="display()">
          <option>None</option>
          <option>Java</option>
          <option>C</option>
          <option>Python</option>      
          <option>JS</option>
          <option>Hackthon #include </option>
          <option>DataStructures Certification exam</option>
          <option>March Back-ur-code Challenge</option>
          </select>
    </td>
    </tr>            
    <tr>      
    <td>Price:</td>
    <td><input type="text" name="price" id="price"></td>
     </tr>
     <tr>
     <td>Venue:</td>
    <td><select name="venue" id="venue" onchange="display()">
       <option>None</option>
       <option>C Block</option>
       <option>R&D Block</option>
       <option>Mech Block</option>      
         <option>EEE Block</option>
          <option>Civil Block </option>
            <option>Library Block</option>
                   <option>FED Block</option>
                       </select></td>
       </tr>
   <tr>
   <td>Time:</td>
      <td><select name="time" id="time">
       <option>None</option>
       <option>9:00AM to 11:00AM</option>
       <option>12:00PM to 2:00PM</option>
       <option>3:00PM to 5:00PM</option>
    </select></td>
  </tr>
   <tr>
   <td>Date:</td>
      <td><select name="date" id="date">
       <option>None</option>
       <option>27/03/2020 to 30/03/2020</option>
       <option>01/04/2020 to 05/04/2020</option>
    </select></td>
   </tr>
    <tr>
   <td colspan=2 style="align:center"><input type="submit" value="REGISTER"></td>
   </tr>
   </table>
   </article>
   <footer>
  Copyright © group 7
  </footer>
 </form>
</body>
</html><%@page import="java.sql.*"%>
<%
try{
String uname=(String) session.getAttribute("uname");
Class.forName("oracle.jdbcbi.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
PreparedStatement pstmt=con.prepareStatement("select d.email,d.fullname,d.username,d.mobno,d.password,c.course,c.price,c.date_of_start,c.time,c.venue,c.mode_of_pay from details d,coursedetails c where d.username=c.username");
ResultSet rs=pstmt.executeQuery();
%>
<html>
<body style="background-color: Azure">
<center><h1>CUSTOMER DETAILS</h1></center>
<br><br>
<table align="center"  border="1">
<tr>
<td>EMAIL</td>
<td>FULLNAME</td>
<td>USERNAME</td>
<td>MOBILE NUMBER</td>
<td>PASSWORD</td>
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
<td><%=rs.getString(1) %>
<td><%=rs.getString(2) %>
<td><%=rs.getString(3) %>
<td><%=rs.getString(4) %>
<td><%=rs.getString(5) %>
<td><%=rs.getString(6) %>
<td><%=rs.getString(7) %>
<td><%=rs.getString(8) %>
<td><%=rs.getString(9) %>
<td><%=rs.getString(10) %>
<td><%=rs.getString(11) %>
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