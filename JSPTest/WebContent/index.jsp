<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="UTF-8"/>

<html>
<head>
<title>우리의 첫번째 웹앱</title>
<script type="text/javascript" src="js/login.js"></script>
</head>
<body>
반갑습니다.<br/>
처음으로 만들어 보는 JSP 웹앱 페이지입니다.<br/><br/>

<c:choose>
<c:when test="${empty id}">

<font color="red">${ user_not_exist }</font><br/><br/>
<form action="login.do" method="POST" name="login">
ID : <input type="text" name="id" autofocus><br/>
비밀번호 : <input type="password" name="password">&nbsp;<input type="submit" value="로그인" onclick="return loginCheck()">
</form>
<br/><br/>
가입하지 않은 경우, <a href="./user_join.jsp">회원가입</a> 을 클릭하세요.
</c:when>
<c:otherwise>

ID : ${ id }<br/>
이름 : ${ name }<br/>
<br/>
<form action="./logout.jsp" method="POST">
<input type="submit" value="로그아웃">
</form>

</c:otherwise>
</c:choose>

</body>
</html>