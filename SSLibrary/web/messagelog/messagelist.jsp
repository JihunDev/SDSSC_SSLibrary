<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.theadcolor>thead>tr>th{
	background:#fcce18;
	color:black;
}
</style>
<script>
window.onload=function(){
	if ("${messagelog}" == "[]") {
		$('#received_msg').html(
				"<tr><td colspan=4>���� �޼����� �����ϴ�.</td><tr>");
	}
	
}


</script>
<div class="fieldsetform">
<div class="listtabletitle">	
	<table class="table" style="width:100%;min-width:300px;">
		<tr>
			<th><h1>My Message</h1></th>
		</tr>
	</table>	
</div>
	<table width="700" class="table table-hover theadcolor">
		<thead>
			<tr>
				<th>��ȣ</th>
				<th>�߽���</th>
				<th>����</th>
				<th class="hidden-xs">�߼۽ð�</th>
<!-- 				<th>Ȯ��</th> -->
			</tr>
		</thead>
		<tbody id="received_msg">
			<c:forEach items="${messagelog}" var="m">
				<!-- ���ļ��� -->
				<c:choose>
				<c:when test="${m.read == 'n'}">
					<tr style="background:#FAF4C0;">
				</c:when>
				<c:otherwise>
					<tr>
				</c:otherwise>
				</c:choose>
						<td>${m.id}</td>
						<td>${m.sender_id}</td>
						<td><a href="msgdetail.do?id=${m.id}">${m.text}</a></td>
						<td class="hidden-xs">${m.send_date}</td>
				<%-- <td>${m.read}</td> --%>
					</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
