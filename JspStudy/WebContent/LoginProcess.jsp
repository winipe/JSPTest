<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/javatest";
	String uid="winipe";
	String password ="pc0426";

	Class.forName(driver);
	Connection con = DriverManager.getConnection(url, uid, password);
	String query = "insert into user values (?,?,?,?,?)";
	PreparedStatement ps = con.prepareStatement(query);
	ps.setString(1, id);
	ps.setString(2, name);
	ps.setString(3, pwd);
	ps.setString(4, address);
	ps.setString(5, phone);
	
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
<a href="MemberInfo.jsp">회원 가입 정보 보기</a>
<%
	}

	if (ps != null) ps.close();
	if (con != null) con.close();
%>
</body>
</html>