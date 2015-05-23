<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
try
{
   Context initContext = new InitialContext();
   Context envContext  = (Context)initContext.lookup("java:/comp/env");
   DataSource ds = (DataSource)envContext.lookup("jdbc/TestDB");

   Connection conn = ds.getConnection();
   Statement stmt = conn.createStatement();
   ResultSet rs = stmt.executeQuery("select * from User");
   while (rs.next()) {
%>

ID : <%= rs.getString(1) %><br>
Name : <%= rs.getString(2) %><br>
Email : <%= rs.getString(3) %><br>
<br>
<%
   }
}
catch (Exception e)
{
   e.printStackTrace();
}
%>
</body>
</html>