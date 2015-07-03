<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!-- �¼� ���� -->
<table>
	<tr>
		<td>����¼� : </td>
		<td colspan="2">${userseat.s_id}���¼�</td>
	</tr>
	<tr>
		<td>���ð� : </td>
		<td>${userseat.start_time} ~ ${userseat.end_time}</td>
		<td><a href="#" data-role="button">����</a></td>
	</tr>
	<tr>
		<td>����Ƚ�� : </td>
		<td>${userseat.renew_qt}</td>
		<td><a href="#"	data-role="button">�ݳ�</a></td>
	</tr>
	<tr>
		<td colspan="3"><a href="#" data-role="button">����</a></td>
	</tr>
</table>

<!-- å ���� -->
<table>
	<tbody>
		<c:forEach items="${booklist}" var="book" varStatus="status">
			<tr>
				<td>������ȣ : </td>
				<td colspan="2">${book[0]}</td>
			</tr>
			<tr>
				<td>å�̸� : </td>
				<td>${book[1]}</td>
				<td><a href="#" data-role="button">����</a></td>
			</tr>
			<tr>
				<td>�뿩�Ⱓ : </td>	
				<td>${book[2]}~${book[3]}</td>
				<td><a href="#"	data-role="button">�ݳ�</a></td>
			</tr>
			<c:if test="${status.last}">
				<tr>
					<td colspan="3">
						<a href="#" data-role="button">����</a>
					</td>	
				</tr>	
			</c:if>
		</c:forEach>
	</tbody>
</table>