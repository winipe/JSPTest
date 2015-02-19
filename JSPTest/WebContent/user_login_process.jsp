<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>회원 로그인 처리</title>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
%>
</head>
<body>
<%
	if ((id == "") || (password == "")) {
%>
	아이디 또는 비밀번호가 맞지 않습니다.<br/>
	다시 입력해 주세요.<br/>
	<a href="./index.jsp">로그인</a>
<%
	} else {
		try {
		   Context initContext = new InitialContext();
		   Context envContext  = (Context)initContext.lookup("java:/comp/env");
		   DataSource ds = (DataSource)envContext.lookup("jdbc/TestDB");
		
		   Connection conn = ds.getConnection();
		   Statement stmt = conn.createStatement();
		   ResultSet rs = stmt.executeQuery("select id, password, name from User");
		   
		   while (rs.next()) {
			   if (id != null && id.equals(rs.getString("id"))) {
				   if (password != null && password.equals(rs.getString("password"))) {
					   session.setAttribute("id", id);
					   session.setAttribute("name", rs.getString("name"));
%>
						반갑습니다. <%= rs.getString("name") %> 님<br/>
						<form action="./index.jsp" method="POST">
						<!-- <input type="hidden" name="id" value="<%= id %>"> -->
						<!-- <input type="hidden" name="name" value="<%= rs.getString("name") %>"> -->
						<input type="submit" value="메인 페이지로 이동">
						</form>
<%
				   }
			   }
		   }
		   
		   rs.close();
		   stmt.close();
		   conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>
</body>
</html>