<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% User user = (User) session.getAttribute("user"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>