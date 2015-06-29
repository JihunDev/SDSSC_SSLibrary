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
<script>
$(document).ready(function(){
	var qt = $('#qt').val();
			if(qt==1){
				alert("2�� �����ϼ����Ƿ�  �� �̻� ������ �� �����ϴ�.(�ִ� 2�� ���� ����)");	
			}else if(qt==2){
				alert("������ �Ϸ�Ǿ����ϴ�.");	
			}
	});

</script>
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="qt" value="${qt}">
<fieldset>
	<legend>��������</legend>
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
					<td><a href="#">����</a></td><!-- ���ļ��� -->
					<td rowspan="2"><a href="#">�̷�</a></td><!-- ���ļ��� -->
				</tr>
				<tr>
					<td>���ð�</td>
					<td>${userseat.start_time}~${userseat.end_time}</td>
					<td>${userseat.renew_qt}</td>
					<td><a href="#">�ݳ�</a></td><!-- ���ļ��� -->
				</tr>
				<tr>
					<td colspan="6">����뿩 ���� ����</td>
				</tr>
				<c:forEach items="${booklist}" var="book" varStatus="status">
				<tr>
					<td>������ȣ : ${book[0]}</td>
					<td colspan="2">�뿩 �Ⱓ</td>
					<td><a href="javascript:;" onClick="if (confirm('�����Ͻðڽ��ϱ�?')) location.href='userbookmodifyimpl.do?id=${book[0]}'">����</a></td><!-- ���ļ��� -->
					<c:if test="${status.first}">
						<td rowspan="2"><a href="#">�̷�</a></td><!-- ���ļ��� -->
					</c:if>
				</tr>
				<tr>
					<td>å�̸� : ${book[1]}</td>
					<td colspan="2">${book[2]}~${book[3]}</td>
					<td><a href="#">�ݳ�</a></td><!-- ���ļ��� -->
				</tr>
				</c:forEach>
			</tbody>
		</table>
</fieldset>
</body>
</html>