<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%!
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/javatest";
	String uid="winipe";
	String pwd ="pc0426";
	String sql = "select * from User";
%>

<html>
<body>
<table width=800 border=1>
<tr>
	<th>아이디</th><th>이름</th><th>이메일</th>
</tr>

<%
try
{
		Class.forName(driver);
		conn = DriverManager.getConnection(url, uid, pwd);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while (rs.next()) {
%>
<tr>
	<td><%= rs.getString("id") %></td>
	<td><%= rs.getString("name") %></td>
	<td><%= rs.getString("email") %></td>
</tr>
<%
		}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	try {
		if (rs != null) rs.close();
		if (stmt != null) stmt.close();
		if (conn != null) conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>

</table>
</body>
</html>