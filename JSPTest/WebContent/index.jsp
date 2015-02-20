<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
	
	String user_not_exist = (String)request.getAttribute("user_not_exist");
%>
<title>우리의 첫번째 웹앱</title>
</head>
<body>
반갑습니다.<br/>
처음으로 만들어 보는 JSP 웹앱 페이지입니다.<br/><br/>
<%
	if (id == null || (id.isEmpty() == true)) {
		if (user_not_exist != null && (user_not_exist.isEmpty() != true)) {
			out.println("<font color=\"red\">" + user_not_exist + "</font><br/><br/>");
		}
%>
<form action="./user_login_process.jsp" method="POST">
ID : <input type="text" name="id"><br/>
비밀번호 : <input type="password" name="password">&nbsp;<input type="submit" value="로그인">
</form>
<br/><br/>
가입하지 않은 경우, <a href="./user_join.jsp">회원가입</a> 을 클릭하세요.
<%
	} else {
%>
ID : <%= id %><br/>
이름 : <%= name %><br/>
<br/>
<form action="./logout.jsp" method="POST">
<input type="submit" value="로그아웃">
</form>
<%
	}
%>
</body>
</html>