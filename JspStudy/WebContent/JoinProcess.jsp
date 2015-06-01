<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String address = request.getParameter("address");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String email_id = request.getParameter("email_id");
	String email_site = request.getParameter("email_site");
	
	Context initContext = new InitialContext();
	Context envContext  = (Context)initContext.lookup("java:/comp/env");
	DataSource ds = (DataSource)envContext.lookup("jdbc/TestDB");

	Connection conn = ds.getConnection();
	String query = "insert into user (id, name, pwd, address, phone1, phone2, phone3, email_id, email_site) values (?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps = conn.prepareStatement(query);
	ps.setString(1, id);
	ps.setString(2, name);
	ps.setString(3, pwd);
	ps.setString(4, address);
	ps.setString(5, phone1);
	ps.setString(6, phone2);
	ps.setString(7, phone3);
	ps.setString(8, email_id);
	ps.setString(9, email_site);
	
	int result = ps.executeUpdate();
%>
<html>
<body>
<%
	if (result == 0) {
		out.println("회원가입에 실패하였습니다.");
	} else {
%>
<b>회원가입을 축하합니다.</b><br>
<a href="MemberList.jsp">회원 가입 정보 보기</a>
<%
	}

	if (ps != null) ps.close();
	if (conn != null) conn.close();
%>
</body>
</html>