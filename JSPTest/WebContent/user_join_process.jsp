<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
%>
<title>회원가입 처리</title>
</head>
<body>
<%
try
{
   Context initContext = new InitialContext();
   Context envContext  = (Context)initContext.lookup("java:/comp/env");
   DataSource ds = (DataSource)envContext.lookup("jdbc/TestDB");

   Connection conn = ds.getConnection();
   Statement stmt = conn.createStatement();
   int result = stmt.executeUpdate("insert into User value ('"+ id + "','" + name + "','" + email + "','" + password + "')");
   
   if (result != 0) {
%>

ID : <%= id %><br/>
이름 : <%= name %><br/>
e-mail : <%= email %><br/><br/>

<b>가입이 완료되었습니다.</b><br/><br/>
<b><a href="./index.jsp">메인 페이지로 이동</a></b>
<%
   }

   stmt.close();
   conn.close();
}
catch (Exception e)
{
   e.printStackTrace();
}
%> 
</body>
</html>