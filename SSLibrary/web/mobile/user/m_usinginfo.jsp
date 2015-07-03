<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!-- �¼� ���� -->
<table>
	<tr>
		<td>����¼� : </td>
		<td>${userseat.s_id}���¼�</td>
	</tr>
	<tr>
		<td>���ð� : </td>
		<td>${userseat.start_time}~${userseat.end_time}</td>
	</tr>
	<tr>
		<td>����Ƚ�� : </td>
		<td>${userseat.renew_qt}</td>
	</tr>
</table>
<div data-role="controlgroup" data-type="horizontal">
	<a href="#" data-role="button">����</a> 
	<a href="#"	data-role="button">�ݳ�</a> 
	<a href="#" data-role="button">����</a>
</div>

<!-- å ���� -->
<table>
	<tbody>
		<c:forEach items="${booklist}" var="book" varStatus="status">
			<tr>
				<td>������ȣ : </td>
				<td>${book[0]}</td>
			</tr>
			<tr>
				<td>å�̸� : </td>
				<td>${book[1]}</td>
			</tr>
			<tr>
				<td>�뿩�Ⱓ : </td>	
				<td>${book[2]}~${book[3]}</td>
			</tr>
			<div data-role="controlgroup" data-type="horizontal">
				<a href="#" data-role="button">����</a> 
				<a href="#"	data-role="button">�ݳ�</a> 
				
			</div>
			<c:if test="${status.last}">
				<a href="#" data-role="button">����</a>		
			</c:if>
		</c:forEach>
	</tbody>
</table>