<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="member" value="<%=new kr.nipa.javabeans.Member()%>" />

<html>
<head>
<script language="text/javascript">
function confirmDelete(id) {
	if (confirm("정말로 삭제하시겠습니까?")) {
		document.location.href='memberDelete.jsp?' + id;
	}
}
</script>
</head>
<body>
<h1>회원정보 수정</h1><br>

<%
try
{
   Context initContext = new InitialContext();
   Context envContext  = (Context)initContext.lookup("java:/comp/env");
   DataSource ds = (DataSource)envContext.lookup("jdbc/TestDB");

   Connection conn = ds.getConnection();
   Statement stmt = conn.createStatement();
   PreparedStatement ps = conn.prepareStatement("select * from user where id=?");
   ps.setString(1, request.getParameter("id"));
   
   ResultSet rs = ps.executeQuery();
   while (rs.next()) {
%>
<c:set target="${member}" property="id" value='<%= rs.getString("id") %>' />
<c:set target="${member}" property="name" value='<%= rs.getString("name") %>' />
<c:set target="${member}" property="pwd" value='<%= rs.getString("pwd") %>' />
<c:set target="${member}" property="address" value='<%= rs.getString("address") %>' />
<c:set target="${member}" property="phone1" value='<%= rs.getString("phone1") %>' />
<c:set target="${member}" property="phone2" value='<%= rs.getString("phone2") %>' />
<c:set target="${member}" property="phone3" value='<%= rs.getString("phone3") %>' />
<c:set target="${member}" property="email_id" value='<%= rs.getString("email_id") %>' />
<c:set target="${member}" property="email_site" value='<%= rs.getString("email_site") %>' />
<%
	}
} 
catch (Exception e)
{
   e.printStackTrace();
}
%>

<form name="memberForm" method="POST" action="modifyProcess.jsp">
<table>
<tr>
	<td>아이디 : </td><td style="color:red; font-size:13px;"><input type="text" name="id" value="${member.id}" disabled>* 아이디는 변경할 수 없습니다.</td>
</tr>
<tr>
	<td>이름 : </td><td><input type="text" name="name" value="${member.name}"></td>
</tr>
<tr>
	<td>비밀번호 : </td><td><input type="password" name="pwd" value="${member.pwd}"></td>
</tr>
<tr>
	<td>주소 : </td><td><input type="text" size=50 name="address" value="${member.address}"></td>
</tr>
<tr>
	<td>전화번호 : </td>
	<td><input type="text" size=5 name="phone1" value="${member.phone1}">-
	<input type="text" size=5 name="phone2" value="${member.phone2}">-
	<input type="text" size=5 name="phone3" value="${member.phone3}">
	</td>
</tr>
<tr>
	<td>이메일 : </td><td><input type="text" name="email_id" value="${member.email_id}">@<select name="email_site" size="1">
	<option value="naver.com" ${member.email_site == 'naver.com' ? 'selected' : ''}>naver.com</option>
	<option value="nate.com" ${member.email_site == 'nate.com' ? 'selected' : ''}>nate.com</option>
	<option value="daum.net" ${member.email_site == 'daum.net' ? 'selected' : ''}>daum.net</option>
	<option value="gmail.com" ${member.email_site == 'gmail.com' ? 'selected' : ''}>gmail.com</option>
	<option value="hanmail.net" ${member.email_site == 'hanmail.net' ? 'selected' : ''}>hanmail.net</option>
	<option value="hotmail.com" ${member.email_site == 'hotmail.com' ? 'selected' : ''}>hotmail.com</option>
	<option value="lycos.co.kr" ${member.email_site == 'lycos.co.kr' ? 'selected' : ''}>lycos.co.kr</option>
	<option value="yahoo.com" ${member.email_site == 'yahoo.com' ? 'selected' : ''}>yahoo.com</option>
	</select>
	</td>
</tr>
<tr>
	<td><input type="submit" value="수정"></td>
	<td><input type="button" value="돌아가기" onclick="javascript:history.back()"></td>
</tr>
</table>
<input type="hidden" name="id" value="${member.id}">
</form>
</body>
</html>