<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<body>
<h1>가입한 회원정보 보기 페이지</h1>
<br>

<table cellspacing="0" border="1" style="font-size:13px;">
<tr><td colspan=7 style="text-align:right;"><input type="button" value="메인페이지로 이동" onclick="location.href='main.jsp'"></td></tr>
<tr>
	<th style="border:1px gray solid;">번호</th>
	<th style="border:1px gray solid;">아이디</th>
	<th style="border:1px gray solid;">이름</th>
	<th style="border:1px gray solid;">주소</th>
	<th style="border:1px gray solid;">전화번호</th>
	<th style="border:1px gray solid;">이메일</th>
	<th style="border:1px gray solid;">비고</th>
</tr>
<c:forEach var="memberInfo" items="${memberList}">
<tr>
	<td style="border:1px gray solid;">${memberInfo.num}</td>
	<td style="border:1px gray solid;">${memberInfo.id }</td>
	<td style="border:1px gray solid;">${memberInfo.name }</td>
	<td style="border:1px gray solid;">${memberInfo.address }</td>
	<td style="border:1px gray solid;">${memberInfo.phone1 }-${memberInfo.phone2 }-${memberInfo.phone3 }</td>
	<td style="border:1px gray solid;">${memberInfo.email_id }@${memberInfo.email_site }</td>
	<td style="border:1px gray solid;"><input type="button" value="상세보기" onclick="location.href='MemberServlet?cmd=get&id=${memberInfo.id}&pageNum=${param.pageNum}'"></td>
</tr>
</c:forEach>
<tr>
	<td colspan="6" style="text-align:center;">
	<c:forEach var="page" begin="1" end="${totalPage}" varStatus="status">
	<c:choose>
	<c:when test="${page != param.pageNum}"><a href="MemberServlet?cmd=getlist&pageNum=${page}">${page}</a></c:when>
	<c:otherwise>${page}</c:otherwise>
	</c:choose>
	<c:if test="${not status.last}">&nbsp;</c:if></c:forEach>
	</td>
</tr>
</table>
</body>
</html>