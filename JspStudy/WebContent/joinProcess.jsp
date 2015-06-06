<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	session.removeAttribute("id");
%>

<jsp:useBean id="join" class="kr.nipa.javabeans.Join" />
<jsp:setProperty name="join" property="*" />

<%
	boolean bSuccess = join.processOfJoin();
	if (bSuccess) {
		session.setAttribute("id", join.getId());
	}
%>

<html>
<body>
<c:choose>
<c:when test="${empty id}">
<b>회원 가입에 실패하였습니다.</b><br>
<input type="button" value="회원가입 페이지로 이동" onclick="location.href='joinForm.jsp'">
</c:when>
<c:otherwise>
<b>회원가입을 축하합니다.</b><br>
<input type="button" value="메인페이지로 이동" onclick="location.href='main.jsp'">
</c:otherwise>
</c:choose>
</body>
</html>