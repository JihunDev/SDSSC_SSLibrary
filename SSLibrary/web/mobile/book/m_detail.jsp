<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table>
	<tbody>
		<tr>
			<th>ID</th>
			<td>${bookdetail.id}</td>
		</tr>
		<tr>
			<th>å����</th>
			<td>${bookdetail.name}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${bookdetail.writer}</td>
		</tr>
		<tr>
			<th>�ڷ��</th>
			<td>${bookdetail.floor}</td>
		</tr>
		<tr>
			<th>��������</th>
			<td>${bookdetail.total_qt}</td>
		</tr>
		<tr>
			<th>�뿩���ɰ���</th>
			<td>${bookdetail.current_qt}</td>
		</tr>
		<tr>
			<th>�����</th>
			<td>${bookdetail.reg_date}</td>
		</tr>
	</tbody>
</table>

