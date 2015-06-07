<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
<c:if test="${empty id}">
<b>회원 가입에 실패하였습니다.</b><br>
<input type="button" value="회원가입 페이지로 이동" onclick="location.href='joinForm.jsp'">
</c:if>
</body>
</html>