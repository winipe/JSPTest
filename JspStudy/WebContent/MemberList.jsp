<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String pageNumber = request.getParameter("pageNum");
	int pageNum = 0;
	if (pageNumber != null)
		pageNum = Integer.parseInt(pageNumber);
	
	Context initContext = new InitialContext();
	Context envContext  = (Context)initContext.lookup("java:/comp/env");
	DataSource ds = (DataSource)envContext.lookup("jdbc/TestDB");

	Connection conn = ds.getConnection();
	
	final int PAGE_SIZE = 3;
	
	String totalList = "select count(*) from user";
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(totalList);
	int totalCount = 0;
	int totalPage = 0;
	if (rs.next())
		totalCount = rs.getInt(1)	;
	
	if (rs != null)
		rs.close();

	int start = (pageNum - 1) * PAGE_SIZE;
	int end = pageNum  * PAGE_SIZE;
	
	if (start < 0)
		start = 0;
	if (end > totalCount)
		end = totalCount;
	
	totalPage = totalCount / PAGE_SIZE + 1;
	
	String query = "select * from user where num between ? and ?";
	PreparedStatement ps = conn.prepareStatement(query);
	ps.setInt(1, start);
	ps.setInt(2, end);
		
	rs = ps.executeQuery();
%>

<html>
<body>
<table cellspacing="0" border="1" style="font-size:13px;">
<tr>
	<th style="border:1px gray solid;">번호</th>
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
	<td style="border:1px gray solid;"><%= rs.getString("num") %></td>
	<td style="border:1px gray solid;"><%= rs.getString("id") %></td>
	<td style="border:1px gray solid;"><%= rs.getString("name") %></td>
	<td style="border:1px gray solid;"><%= rs.getString("address") %></td>
	<td style="border:1px gray solid;"><%= rs.getString("phone1") %>-<%= rs.getString("phone2") %>-<%= rs.getString("phone3") %></td>
	<td style="border:1px gray solid;"><%= rs.getString("email_id") %>@<%= rs.getString("email_site") %></td>
</tr>
<%
	}

	if (rs != null) rs.close();
	if (ps != null) ps.close();
	if (conn != null) conn.close();
%>
<tr>
	<td colspan="6" style="text-align:center;">
	<c:forEach var="page" begin="1" end="<%= totalPage %>" varStatus="status">
	<c:choose>
	<c:when test="${page != param.pageNum}"><a href="MemberList.jsp?pageNum=${page}">${page}</a></c:when>
	<c:otherwise>${page}</c:otherwise>
	</c:choose>
	<c:if test="${not status.last}">&nbsp;</c:if></c:forEach>
	</td>
</tr>
</table>
</body>
</html>