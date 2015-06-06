<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<body>
<h1>회원로그인 폼</h1>
<br>
<form name="loginForm" method="POST" action="loginProcess.jsp">
<table>
<tr>
	<td>아이디</td><td colspan=2><input type="text" name="id"></td>
</tr>
<tr>
	<td>비밀번호</td><td colspan=2><input type=password name="pwd"></td>
</tr>
<tr>
	<td style="text-align:left;" ><input type="submit" value="로그인"></td><td style="text-align:center;"><input type="reset" value="취소"></td><td style="text-align:right;"><input type="button" value="회원가입" onclick="location.href='joinForm.jsp'"></td>
</tr>
</table>
</form>
</body>
</html>