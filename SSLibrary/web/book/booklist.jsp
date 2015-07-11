<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="fieldsetform">
	<h1 align="center">���� �뿩 ����</h1>

	<table width="700" class="table table-hover">
		<thead>
			<tr>
				<th>å ��Ϲ�ȣ</th>
				<th>�����</th>
				<th>�뿩��</th>
				<th class="hidden-xs hidden-sm">�ݳ���</th>
				<th>�� �ݳ���</th>
				<th class="hidden-xs hidden-sm">���� Ƚ��</th>
		</thead>
		<tbody>
			<c:forEach items="${booklist}" var="b">
				<!-- ���ļ��� -->
				<tr>
					<td><a href="bookdetail.do?id=${b.b_id}">${b.b_id}</a></td>
					<td>${b.u_id}</td>
					<td>${b.start_date}</td>
					<td class="hidden-xs hidden-sm">${b.end_date}</td>
					<td>${b.real_date}</td>
					<td class="hidden-xs hidden-sm">${b.renew_qt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>