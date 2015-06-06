<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="modify" class="kr.nipa.javabeans.Modify" />
<jsp:setProperty name="modify" property="*" />

<%
	boolean bSuccess = modify.processOfModify();
	if (bSuccess)
		pageContext.setAttribute("success", bSuccess);
%>

<html>
<body>

<c:choose>
<c:when test="${empty success}">
회원정보 수정에 실패하였습니다.<br>
<input type="button" value="회원정보 수정 페이지로 이동" onclick="location.href='modifyForm.jsp'">
</c:when>
<c:otherwise>
<jsp:forward page="${param.prevPage}?pageNum=${param.pageNum}" />
</c:otherwise>
</c:choose>

</body>
</html>