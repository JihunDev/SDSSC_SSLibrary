<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="fieldsetform">
	<legend align="center">Message List Page</legend>
	<table width="700" class="table table-hover">
		<thead>
			<tr>
				<th>��ȣ</th>
				<th>������� ID</th>
				<th>text</th>
				<th>�����ð�</th>
				<th>�о��� Ȯ��</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${messagelog}" var="m">
				<!-- ���ļ��� -->
				<tr>
					<td>${m.id}</td>
					<td>${m.sender_id}</td>
					<td><a href="msgdetail.do?id=${m.id}">${m.text}</a></td>
					<td>${m.send_date}</td>
					<td>${m.read}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
