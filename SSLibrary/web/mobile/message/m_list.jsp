<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
tr {
    border-bottom: 1px solid #d6d6d6;
}
</style>
    
    <table>
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
				<tr>
					<td>${m.id}</td>
					<td>${m.sender_id}</td>
					<td><a href="m_msgdetail.do?id=${m.id}">${m.text}</a></td>
					<td>${m.send_date}</td>
					<td>${m.read}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>