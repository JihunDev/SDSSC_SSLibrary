<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
$(document).ready(function(){
	
	var borrowbook = $('#borrowbook').val();
	if(borrowbook==1){
		alert("�̹� ���� å�Դϴ�.")	
	}else if(borrowbook==2){
		alert("���� ������ 0���Դϴ�. �뿩�� �Ұ��� �մϴ�.")	
	}else if(borrowbook==3){
		alert("�뿩�� �Ϸ�Ǿ����ϴ�.");
	}		
});

function rentbook(){
	var  bookid = $('#bookid').val();
	var c = confirm('�뿩�Ͻðڽ��ϱ�?');
	if (c == true) {
		location.href ='m_userbookregister.do?id='+bookid;
	};			
}
</script>
<input type="text" id="bookid" value="${bookdetail.id}">
<input type="text" id="borrowbook" value="${borrowbook}">
<button type="button" class="btn btn-default" onclick="rentbook();">�뿩</button>
<!-- ������ ������ -->
<table width="100%">
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




