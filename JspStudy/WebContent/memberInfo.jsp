<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<html>
<body>

<c:choose>
<c:when test="${empty memberInfo}">
회원 정보가 존재하지 않습니다. <br>
<input type="button" value="돌아가기" onclick="javascript:histroy.back()">
</c:when>
<c:otherwise>
<form method="POST" action="MemberServlet?cmd=update">
<table>
<tr><td>아이디 : </td><td style="color:red; font-size:13px;"><input type="text" name="id" value="${memberInfo.id}" disabled>* 아이디는 변경할 수 없습니다.</td></tr>
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
	<td><input type="text" name="email_id" value="${memberInfo.email_id}">@<select name="email_site" size="1">
	<option value="naver.com" ${memberInfo.email_site == 'naver.com' ? 'selected' : ''}>naver.com</option>
	<option value="nate.com" ${memberInfo.email_site == 'nate.com' ? 'selected' : ''}>nate.com</option>
	<option value="daum.net" ${memberInfo.email_site == 'daum.net' ? 'selected' : ''}>daum.net</option>
	<option value="gmail.com" ${memberInfo.email_site == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
	<option value="hanmail.net" ${memberInfo.email_site == 'hanmail.net' ? 'selected' : ''}>hanmail.net</option>
	<option value="hotmail.com" ${memberInfo.email_site == 'hotmail.com' ? 'selected' : ''}>hotmail.com</option>
	<option value="lycos.co.kr" ${memberInfo.email_site == 'lycos.co.kr' ? 'selected' : ''}>lycos.co.kr</option>
	<option value="yahoo.com" ${memberInfo.email_site == 'yahoo.com' ? 'selected' : ''}>yahoo.com</option>
	</select>
	</td>
</tr>
<tr>
	<td><input type="submit" value="수정"></td>
	<td><input type="button" value="삭제" onclick="location.href='MemberServlet?cmd=delete&id=${param.id}&pageNum=${param.pageNum}'"></td>
	<td><input type="button" value="돌아가기" onclick="javascript:history.back()"></td>
</tr>
</table>
<input type="hidden" name="id" value="${param.id}">
<input type="hidden" name="pageNum" value="${param.pageNum}">
<input type="hidden" name="prevPage" value="memberList.jsp">
</form>
</c:otherwise>
</c:choose>

</body>
</html>