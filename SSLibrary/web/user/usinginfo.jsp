<%@page import="com.entity.UserBook"%>
<%@page import="com.entity.UserSeat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% UserSeat userseat = (UserSeat) session.getAttribute("userseat"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>
</head>
<body>
<fieldset>
	<legend>��������</legend>
	${userseat}
	${userbooklist}
		<table border="3" width="700">
			<thead>
				<tr>
					<th colspan="6">�����̿�����</th>
				<tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="6">���� ������ ����������</td>
				</tr>
				<tr>
					<td>������ �¼�</td>
					<td>${userseat.s_id}�� �¼�</td>
					<td>����ȸ��</td>
					<td><a href="#">����</a></td>
					<td rowspan="2"><a href="#">�̷�</a></td>
				</tr>
				<tr>
					<td>���ð�</td>
					<td>${userseat.start_time}~${userseat.end_time}</td>
					<td>${userseat.renew_qt}</td>
					<td><a href="#">�ݳ�</a></td>
				</tr>
				<tr>
					<td colspan="6">����뿩 ���� ����</td>
				</tr>
				<c:forEach items="${userbooklist}" var="list">
				<tr>
					<td>������ȣ</td>
					<td colspan="2">�뿩 �Ⱓ</td>
					<td><a href="#">����</a></td>
					<td rowspan="2"><a href="#">�̷�</a></td>
				</tr>
				<tr>
					<td>å�̸�</td>
					<td colspan="2">${list.start_date}~${list.end_date}</td>
					<td><a href="#">�ݳ�</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
</fieldset>
</body>
</html>