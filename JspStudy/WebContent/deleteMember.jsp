<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="member" class="kr.nipa.javabeans.db.MemberDAO" />
<c:set var="delete" value="<%= member.deleteMember(request.getParameter("id")) %>" />

<html>
<body>

<c:choose>
<c:when test="${delete == true}">
성공적으로 삭제되었습니다. <br>
<input type="button" value="확인" onclick="location.href='memberList.jsp'">
</c:when>
<c:otherwise>
회원정보 삭제 도중 문제가 발생하였습니다. <br>
<input type="button" value="돌아가기" onclick="javascript:history.back()">
</c:otherwise>
</c:choose>

</body>
</html>