<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table>
	<tbody>
		<c:forEach items="${seatloglist}" var='sl'>
			<tr>
				<td>������ :</td>
				<td>${sl.u_id}</td>
			</tr>
			<tr>
				<td>�¼� :</td>
				<td>${sl.s_id}</td>
			</tr>
			<tr>
				<td>������۽ð� :</td>
				<td>${sl.start_date}</td>
			</tr>
			<tr>
				<td>�ǹݳ��ð� :</td>
				<td>${sl.real_date}</td>
			</tr>
			<tr>
				<td>���� :</td>
				<td>${sl.renew_qt}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
