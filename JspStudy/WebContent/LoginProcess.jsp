<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	Context initContext = new InitialContext();
	Context envContext  = (Context)initContext.lookup("java:/comp/env");
	DataSource ds = (DataSource)envContext.lookup("jdbc/TestDB");

	Connection conn = ds.getConnection();
	String query = "select * from user where id = ? and pwd = ?";
	PreparedStatement ps = conn.prepareStatement(query);
	ps.setString(1, id);
	ps.setString(2, pwd);
	
	ResultSet rs = ps.executeQuery();
%>
<html>
<body>
<%
	String loginId = null;
	String loginPwd = null;
	boolean bFind = false;
	while (rs.next()) {
		loginId = rs.getString("id");
		loginPwd = rs.getString("pwd");
		
		if (loginId.equals(id)) {
			if (loginPwd.equals(pwd))
				bFind = true;
				break;
		}
	}
	
	if (bFind) {
		session.removeAttribute("id");
		session.setAttribute("id", rs.getString("id"));
%>
<jsp:forward page="main.jsp" />
<%
	} else {
%>
	<b>아이디가 존재하지 않거나 비밀번호가 맞지 않습니다. 확인해주세요</b><br>
	<a href="JoinForm.jsp">회원 가입하기</a>
<%
	}
	
	if (ps != null) ps.close();
	if (conn != null) conn.close();
%>
</body>
</html>