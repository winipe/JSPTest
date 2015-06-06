<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="modify" class="kr.nipa.javabeans.Modify" />
<jsp:setProperty name="modify" property="*" />

<%
	boolean bSuccess = modify.processOfModify();
	if (bSuccess)
		response.sendRedirect("main.jsp");
%>
<html>
<body>
회원정보 수정에 실패하였습니다.<br>
<input type="button" value="회원정보 수정 페이지로 이동" onclick="location.href='modifyForm.jsp'">
</body>
</html>