<%@page import="com.entity.UserBook"%>
<%@page import="com.entity.UserSeat"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% UserSeat userseat = (UserSeat) session.getAttribute("userseat"); %>
<% UserBook userbook = (UserBook) session.getAttribute("userbooklist"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<fieldset>
	<legend>��������</legend>
		<table border="3" width="400">
			<thead>
				<tr>
					<th colspan="5">�����̿�����</th>
				<tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5">���� ������ ����������</td>
				</tr>
				<tr>
					<td>������</td>
					<td>�¼�</td>
					<td>����ȸ��</td>
					<td><a href="#">����</a></td>
					<td rowspan="2"><a href="#">�̷�</a></td>
				</tr>
				<tr>
					<td colspan="2">���ð�</td>
					<td>1</td>
					<td><a href="#">�ݳ�</a></td>
				</tr>
					<tr>
					<td colspan="5">����뿩 ���� ����</td>
				</tr>
				<tr>
					<td>������ȣ</td>
					<td colspan="2">�뿩�Ⱓ</td>
					
					<td><a href="#">����</a></td>
					<td rowspan="2"><a href="#">�̷�</a></td>
				</tr>
				<tr>
					<td>å�̸�</td>
					<td colspan="2">���ð�</td>
					<td><a href="#">�ݳ�</a></td>
				</tr>
			</tbody>
		</table>
</fieldset>
</body>
</html>