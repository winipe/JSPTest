<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*, kr.nipa.*" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="login" class="kr.nipa.Login">
	<jsp:setProperty name="login" property="*" />
</jsp:useBean>

<html>
<head>
<title>회원가입 처리</title>
</head>
<body>
<%
Connection conn = null;
PreparedStatement ps = null;

try
{
   Context initContext = new InitialContext();
   Context envContext  = (Context)initContext.lookup("java:/comp/env");
   DataSource ds = (DataSource)envContext.lookup("jdbc/TestDB");

   String insertUsers = "insert into User (id, name, email, password) values (?, ?, ?, ?)";
 
   conn = ds.getConnection();
   conn.setAutoCommit(false);
   ps = conn.prepareStatement(insertUsers);
   int result = 0;
   
   ps.setString(1, login.getId());
   ps.setString(2, login.getName());
   ps.setString(3, login.getEmail());
   ps.setString(4, login.getPassword());

   result = ps.executeUpdate();
   conn.commit();
   
   if (result != 0) {
%>

ID : <%= login.getId() %><br/>
이름 : <%= login.getName() %><br/>
e-mail : <%= login.getEmail() %><br/><br/>

<b>가입이 완료되었습니다.</b><br/><br/>
<b><a href="./index.jsp">메인 페이지로 이동</a></b>
<%
   }
}
catch (Exception e)
{
   e.printStackTrace();
}
finally
{
	if (ps != null) ps.close();
	if (conn != null) conn.close();
}
%> 
</body>
</html>