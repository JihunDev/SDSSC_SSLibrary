<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="usersearchname.do" method="POST">
	<select name="isadmin">
		<option value="">��ü</option>
		<option value="n">ȸ��</option>
		<option value="s">����</option>
		<option value="d">Ż��</option>
	</select>
	<input type="text" name="name" >
	<input type="submit" value="�˻�">
</form>
	<h1>User list</h1>
	<div>
	
	</div>
	<div>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>PWD</th>
					<th>NAME</th>
					<th>TEL</th>
					<th>E-MAIL</th>
					<th>ȸ������</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${userlist}" var="u">
					<tr>
						<td><a href="userdetail.do?id=${u.id}">${u.id}</a></td>
						<td>${u.pwd}</td>
						<td>${u.name}</td>
						<td>${u.phone}</td>
						<td>${u.email}</td>
						<td>${u.isadmin}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>