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
<style></style>
</head>
<body>
<fieldset>
	<legend>ȸ������</legend>
	<h4>${user.id} ����</h4>
	<table width="700"> <!-- ���ļ��� -->
		<tr><td rowspan="6"><img width="200px" src="img/${user.img}"></td>
		<tr><th>ID</th><td>${user.id}</td></tr>
		<tr><th>PWD</th><td>${user.pwd}</td></tr>
		<tr><th>NAME</th><td>${user.name}</td></tr>
		<tr><th>TEL</th><td>${user.phone}</td></tr>
		<tr><th>e-Mail</th><td>${user.email}</td></tr>
	</table>
	<div>
	<div><a href="usinginfo.do?id=${user.id}">�����̿�����</a></div> <!-- ���ļ��� -->
	<div><a href="modify.do?id=${user.id}">������������</a></div> <!-- ���ļ��� -->
	<div><a href="msgloglist.do?id=${user.id}">�޼��� ����</a></div> <!-- ���ļ��� -->
	</div>
</fieldset>
</body>
</html>