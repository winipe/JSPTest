<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입 입력폼</h1>
<br>
<form method="POST" action="LoginProcess.jsp">
아이디 : <input type="text" name="id"><br>
이름 : <input type="text" name="name"><br>
비밀번호 : <input type=password name="pwd"><br>
주소 : <input type="text" name="address"><br>
전화번호 : <input type="text" name="phone"><br>
<input type="submit" value="가입">&nbsp;<input type="reset" value="취소">
</form>
</body>
</html>