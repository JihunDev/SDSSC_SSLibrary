<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<fieldset>
		<legend>ȸ������</legend>
		<h4>${userlist.id}����</h4>
		<table width="700">
			<tr>
				<td rowspan="6"><img width="200px" src="img/${userlist.img}"></td>
			<tr>
				<th>ID</th>
				<td>${userlist.id}</td>
			</tr>
			<tr>
				<th>PWD</th>
				<td>${userlist.pwd}</td>
			</tr>
			<tr>
				<th>NAME</th>
				<td>${userlist.name}</td>
			</tr>
			<tr>
				<th>TEL</th>
				<td>${userlist.phone}</td>
			</tr>
			<tr>
				<th>e-Mail</th>
				<td>${userlist.email}</td>
			</tr>
		</table>
		<div>
			<a href="usermodify.do?id=${userlist.id}">ȸ����������</a>
		</div>
		<div>
			<a href="userremoveimpl.do?id=${userlist.id}">ȸ������</a>
		</div>
	</fieldset>
