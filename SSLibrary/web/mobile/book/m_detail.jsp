<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(document).ready(function() {
		var borrowbook = "${borrowbook}";
		if (borrowbook == 1) {
			alert("�̹� ���� å�Դϴ�.")
		} else if (borrowbook == 2) {
			alert("���� ������ 0���Դϴ�. �뿩�� �Ұ��� �մϴ�.")
		} else if (borrowbook == 3) {
			alert("�뿩�� �Ϸ�Ǿ����ϴ�.");
		} else if (borrowbook == 4) {
			alert("�����ڰ� �ݳ�Ȯ�� ���̾ �뿩�� �Ұ����մϴ�.")
		}
	});

	function rentbook() {
		var bookid = "${bookdetail.id}";
		var c = confirm('�뿩�Ͻðڽ��ϱ�?');
		if (c == true) {
			location.href = 'm_userbookregister.do?id=' + bookid;
		}
		;
	}
</script>
<style>
tr td{
	border-bottom: 1px solid lightgray;
	text-align: center;
}
tr th{
	border-bottom: 1px solid lightgray;
	text-align: center;
}

table {
	background: white;
	border-radius : 8px 8px 8px 8px;
	
}
</style>
<button type="button" class="btn btn-default" onclick="rentbook();">�뿩</button>
<!-- ������ ������ -->
<table width="100%">
	<tbody>
		<tr>
			<td colspan="2" align ="center"><img width="60%"src="img/book/${bookdetail.img}"></td>
		</tr>
		<tr>
			<th>��� ��ȣ</th>
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
