<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<body>
<h1>회원가입 입력폼</h1>
<br>
<form method="POST" action="JoinProcess.jsp">
<table>
<tr>
	<td>아이디 : </td><td><input type="text" name="id"></td>
</tr>
<tr>
	<td>이름 : </td><td><input type="text" name="name"></td>
</tr>
<tr>
	<td>비밀번호 : </td><td><input type="password" name="pwd"></td>
</tr>
<tr>
	<td>주소 : </td><td><input type="text" size=50 name="address"></td>
</tr>
<tr>
	<td>전화번호 : </td><td><input type="text" size=5 name="phone1">-<input type="text" size=5 name="phone2">-<input type="text" size=5 name="phone3"></td>
</tr>
<tr>
	<td>이메일 : </td><td><input type="text" name="email_id">@<select name="email_site" size="1">
	<option value="naver.com">naver.com</option>
	<option value="nate.com">nate.com</option>
	<option value="daum.net">daum.net</option>
	<option value="gmail.com" selected>gmail.com</option>
	<option value="hanmail.net">hanmail.net</option>
	<option value="hotmail.com">hotmail.com</option>
	<option value="lycos.co.kr">lycos.co.kr</option>
	<option value="yahoo.com">yahoo.com</option>
	</select>
	</td>
</tr>
<tr>
	<td><input type="submit" value="가입"></td><td><input type="reset" value="취소"></td>
</tr>
</table>
</form>
</body>
</html>