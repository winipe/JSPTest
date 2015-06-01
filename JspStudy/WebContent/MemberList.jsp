<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	Context initContext = new InitialContext();
	Context envContext  = (Context)initContext.lookup("java:/comp/env");
	DataSource ds = (DataSource)envContext.lookup("jdbc/TestDB");

	Connection conn = ds.getConnection();
	
	String query = "select * from user";
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(query);
%>

<html>
<body>
<table cellspacing="0" border="1" style="font-size:13px;">
<tr>
	<th style="border:1px gray solid;">아이디</th>
	<th style="border:1px gray solid;">이름</th>
	<th style="border:1px gray solid;">주소</th>
	<th style="border:1px gray solid;">전화번호</th>
	<th style="border:1px gray solid;">이메일</th>
</tr>
<%
	while (rs.next()) {
%>
<tr>
	<td style="border:1px gray solid;"><%= rs.getString("id") %></td>
	<td style="border:1px gray solid;"><%= rs.getString("name") %></td>
	<td style="border:1px gray solid;"><%= rs.getString("address") %></td>
	<td style="border:1px gray solid;"><%= rs.getString("phone1") %>-<%= rs.getString("phone2") %>-<%= rs.getString("phone3") %></td>
	<td style="border:1px gray solid;"><%= rs.getString("email_id") %>@<%= rs.getString("email_site") %></td>
</tr>
<%
	}

	if (rs != null) rs.close();
	if (stmt != null) stmt.close();
	if (conn != null) conn.close();
%>
<tr><td colspan="5" style="text-align:right;"><input type="button" value="뒤로가기" onclick="javascript:history.back()"></td></tr>
</table>
</body>
</html>