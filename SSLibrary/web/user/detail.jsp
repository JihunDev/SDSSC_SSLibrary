<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% User user = (User) session.getAttribute("user"); %>
<div class="fieldsetform">
<fieldset>
	<legend>ȸ������</legend>
	<h4>${user.id} ����</h4>
	<table class="table table-hover" width="700"> <!-- ���ļ��� -->
		<tr><td rowspan="6"><img width="300px" src="img/user/${user.img}"></td>
		<tr><th>ID</th><td>${user.id}</td></tr>
		<tr><th>PWD</th><td>${user.pwd}</td></tr>
		<tr><th>NAME</th><td>${user.name}</td></tr>
		<tr><th>TEL</th><td>${user.phone}</td></tr>
		<tr><th>e-Mail</th><td>${user.email}</td></tr>
	</table>
	<div class="btn-group">
		<a class="btn btn-default" href="modify.do?id=${user.id}">������������</a>
	</div>
</fieldset>
</div>