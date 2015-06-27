<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% User user = (User) session.getAttribute("user"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>

</script>
<style></style>
</head>
<body>
<%if(user == null){  %>
	<fieldset>
		<legend>Login</legend>
			<form action="loginimpl.do" method="POST">
				<input type="text" name="id" id="id" placeholder="ID"><br>
				<input type="text" name="pwd" id="pwd" placeholder="PWD"><br>
				<input type="submit" value="login">
				<a href="register.do">���</a>
			</form>
	</fieldset>
<%}else{ %>
	<fieldset>
		<legend>MainPage</legend>
			<table>
				<tbody>
					<tr>
						<td rowspan="2"><img src="${user.img}"></td>
						<td>${user.id}��</td>
					</tr>
					<tr>
						<td>ȯ���մϴ�.</td>
					</tr>
					<tr>
						<td><a href="detail.do?id='${user.id}'">����������</a></td>
						<td><a href="logout.do">�α׾ƿ�</a></td>
					</tr>
				</tbody>
			</table>
		</fieldset>
<%} %>
</body>
</html>