<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<title>회원가입 페이지</title>
</head>
<body>
아래 사항을 입력해주세요<br/><br/>
<form action="./user_join_process.jsp" method="POST">
ID : <input type="text" name="id"><br/>
이름 : <input type="text" name="name"><br/>
e-mail : <input type="text" name="email"><br/>
비밀번호 : <input type="password" name="password"><br/>
<br/>
<input type="submit" value="가입하기">
</form>
</body>
</html>