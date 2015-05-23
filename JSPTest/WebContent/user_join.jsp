<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="UTF-8" />

<c:if test="${empty exist_user_id }">
<c:set var="exist_user_id" value="아래 사항을 입력해주세요." />
</c:if>

<html>
<head>
<title>회원가입 페이지</title>
<script type="text/javascript"	 src="js/login.js"></script>
</head>
<body>
<font color="red">${exist_user_id}</font><br/><br/>
<form action="./user_join_process.jsp" method="POST" name="join">
ID : <input type="text" name="id" autofocus><br/>
이름 : <input type="text" name="name"><br/>
e-mail : <input type="text" name="email"><br/>
비밀번호 : <input type="password" name="password"><br/>
<br/>
<input type="submit" value="가입하기" onclick="return joinCheck()">
</form>
</body>
</html>