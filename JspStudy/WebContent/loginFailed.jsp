<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.nipa.javabeans.db.MemberDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
<c:if test="${empty id}">
<b>아이디가 존재하지 않거나 비밀번호가 맞지 않습니다. 확인해주세요</b><br>
<input type="button" value="로그인 하기" onclick="location.href='loginForm.jsp'">
</c:if>
</body>
</html>