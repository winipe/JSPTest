<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
<h1>회원전용 페이지</h1>
<br>

<c:choose>
<c:when test="${empty id}">
<table>
<tr><td>로그인 해주세요!</td></tr>
<tr><td><input type="button" value="로그인" onclick="location.href='loginForm.jsp'"></td></tr>
</table>
</c:when>
<c:otherwise>
<form action="modifyForm.jsp?id=${id}" method="POST">
<table>
<tr>
	<td colspan="3">안녕하세요. ${id} 님!</td>
</tr>
<tr>
	<td><input type="button" value="로그아웃" onclick="location.href='logout.jsp'"></td>
	<td><input type="submit" value="회원정보 수정"></td>
	<td><input type="button" value="가입한 회원정보 보기" onclick="location.href='memberList.jsp?pageNum=1'"></td>
</tr>
</table>
</form>
</c:otherwise>
</c:choose>
</body>
</html>