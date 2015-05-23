<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="UTF-8" />

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
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
		   Context initContext = new InitialContext();
		   Context envContext  = (Context)initContext.lookup("java:/comp/env");
		   DataSource ds = (DataSource)envContext.lookup("jdbc/TestDB");
		   
		   String selectUsers = "select id, password, name from User where id = ? and password = ?";
		
		   conn = ds.getConnection();
		   conn.setAutoCommit(false);
		   
		   ps = conn.prepareStatement(selectUsers);
		   if (ps != null) {
			   if (id != null && password != null){
				   ps.setString(1, id);
				   ps.setString(2, password);
				   
				   ResultSet rs = null;
				   
				   try {
					   rs = ps.executeQuery();
					   conn.commit();
					   
					   if (rs.next()) {
							if (id.equals(rs.getString("id"))) {
								if (password.equals(rs.getString("password"))) {
									session.setAttribute("id", id);
									session.setAttribute("name", rs.getString("name"));
%>
									반갑습니다. <%= rs.getString("name") %> 님<br/>
									<form action="./index.jsp" method="POST">
									<!-- <input type="hidden" name="id" value="${id}"> -->
									<!-- <input type="hidden" name="name" value="${rs.getString("name")}"> -->
									<input type="submit" value="메인 페이지로 이동">
									</form>
<%
								}
							}
						} else {
							request.setAttribute("user_not_exist", "사용자 정보가 올바르지 않습니다. 다시 입력해주세요");
							
							RequestDispatcher dispatcher = request.getRequestDispatcher("./index.jsp");
							dispatcher.forward(request, response);
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						rs.close();
					}
			   	}
		   	}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ps.close();
			conn.close();
		}
	}
%>
</body>
</html>