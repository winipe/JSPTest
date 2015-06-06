<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.nipa.javabeans.Member" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<jsp:useBean id="member" class="kr.nipa.javabeans.Member" />
<jsp:setProperty name="member" property="id" value="${param.id}" />

<%
	Member memberInfo = member.getMemberInfo();
	if (memberInfo != null)
		pageContext.setAttribute("memberInfo", memberInfo);
%>

<html>
<body>

<c:choose>
<c:when test="${empty memberInfo}">
회원 정보가 존재하지 않습니다. <br>
<input type="button" value="돌아가기" onclick="javascript:histroy.back()">
</c:when>
<c:otherwise>
<form method="POST" action="deleteMember.jsp">
<table>
<tr><td>아이디 : </td><td style="color:red; font-size:13px;"><input type="text" name="id" value="${memberInfo.id}" disabled></td></tr>
<tr><td>이름 : </td><td><input type="text" name="name" value="${memberInfo.name}"></td></tr>
<tr><td>비밀번호 : </td><td><input type="password" name="pwd" value="${memberInfo.pwd}"></td></tr>
<tr><td>주소 : </td><td><input type="text" size=50 name="address" value="${memberInfo.address}"></td></tr>
<tr>
	<td>전화번호 : </td>
	<td><input type="text" size=5 name="phone1" value="${memberInfo.phone1}">-
	<input type="text" size=5 name="phone2" value="${memberInfo.phone2}">-
	<input type="text" size=5 name="phone3" value="${memberInfo.phone3}">
	</td>
</tr>
<tr>
	<td>이메일 : </td>
	<td><input type="text" name="email_id" value="${memberInfo.email_id}">@<input type="text" name="email_id" value="${memberInfo.email_site}"></td>
</tr>
<tr>
	<td><input type="button" value="수정" onclick="location.href='modifyForm.jsp?id=${param.id}'"></td>
	<td><input type="submit" value="삭제"></td>
	<td><input type="button" value="돌아가기" onclick="javascript:history.back()"></td>
</tr>
</table>
<input type="hidden" name="id" value="${param.id}">
<input type="hidden" name="pageNum" value="${param.pageNum}">
</form>
</c:otherwise>
</c:choose>

</body>
</html>