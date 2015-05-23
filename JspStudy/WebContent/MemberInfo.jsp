<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%!
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/javatest";
	String uid = "winipe";
	String pwd = "pc0426";
%>
<%
	Class.forName(driver);
	Connection con = DriverManager.getConnection(url, uid, pwd);
	String query = "select * from user";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(query);
%>

<html>
<body>
<table border=1>
<tr>
	<td>아이디</td><td>이름</td><td>주소</td><td>전화번호</td>
</tr>
<%
	while (rs.next()) {
%>
<tr>
	<td><%= rs.getString("id") %></td>
	<td><%= rs.getString("name") %></td>
	<td><%= rs.getString("address") %></td>
	<td><%= rs.getString("phone") %></td>
</tr>
<%
	}

	if (rs != null) rs.close();
	if (stmt != null) stmt.close();
	if (con != null) con.close();
%>
</table>
</body>
</html>