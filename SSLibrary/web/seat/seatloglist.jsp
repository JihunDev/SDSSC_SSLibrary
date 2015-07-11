<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="fieldsetform">
<fieldset>
<legend align="center">Seat Log List Page</legend>
	<table width="700" class="table table-hover scroll">		
		<thead>
			<tr>
				<th>������ ID</th>
				<th>�¼� ID</th>
				<th>���� ���� �ð�</th>
				<th>�ݳ� ���� �ð�</th>
				<th>�� �ݳ� �ð�</th>
				<th>����</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${seatloglist}" var='sl'>
				<tr>
					<td>${sl.u_id}</td>
					<td>${sl.s_id}</td>
					<td>${sl.start_date}</td>
					<td>${sl.end_date}</td>
					<td>${sl.real_date}</td>
					<td>${sl.renew_qt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</fieldset>
	
</div>