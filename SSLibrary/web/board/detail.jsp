<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
function del(f) {/* delete�� ������ del�� */
	var c = confirm('���� �Ͻðڽ��ϱ�?');
		if (c == true) {
			f.action = 'a.do';/* ���� ���� */
			f.method = 'POST';
			f.submit();
		};
	}
function update(f) {
	var c = confirm('���� �Ͻðڽ��ϱ�?');
		if (c == true) {
			f.action = 'a.do';/* ���� ���� */
			f.method = 'POST';
			f.submit();
		};
	}
function register(f) {
	var c = confirm('������ ��� �Ͻðڽ��ϱ�?');
		if (c == true) {
			f.action = 'a.do';/* ���� ���� */
			f.method = 'POST';
			f.submit();
		};
	}
	
	/* ���� �ҷ����� */
function repls() {
	var reg_date = $('#reg_date').val/* �̰� �³� �߸𸣰��� */
	$.ajax({
		type : 'POST',
		anync : 'false',
		url : 'send.do',/* ���� ���� */
		data : {
			'reg_date' : reg_date
		},
		success : function(data) {
			display(data);
		}
	});
}
function display(data) {
	var output = '';
	output += "<table>";
	output += "<tbody>";
	$(data).each(function(index, item) {
		with (item) {
			output += '</tr>';
			output += '<td>'+content+'</td>';
			output += '<td>'+u_id+'</td>';
			output += '</tr>';
		}
	});
	output += "</tbody>";
	output += "</table>";
	
	$('#repl').html(output);
}
$(document).ready(function() {
		repls();
});
</script>
<style></style>
</head>
<body>
<h1>board detail</h1>
<form>
	<table border="1">
	<tbody>
		<tr>
			<td>����</td>
			<td colspan="5">${boarddetail.title}</td>
		</tr>
		<tr>
			<td>�з�</td>
			<td>${boarddetail.sort}</td>
			<td>�۾���¥</td>
			<td>${boarddetail.reg_date}</td>
			<td>��ȸ</td>
			<td>${boarddetail.counter}</td>
		</tr>
		<tr>
			<td colspan="6">
				${boarddetail.content}
			</td>
		</tr>
	</tbody>
	
	</table>
	<input type="button" value="����" onclick="del(this.form)"><!-- ���� ���� -->
	<input type="button" value="����" onclick="update(this.form)"><!-- ���� ���� -->
</form>		
	<div id="repl">	</div>
<form>
	<div>
	<input type="hidden" id="reg_date" value="${boarddetail.id}"><br><!-- ���ö����� ���� -->
	<textarea rows="5" cols="40"></textarea>
	<input type="button" value="���" onclick="register(this.form)"><!-- ���� ���� -->
	</div>
</form>	
</body>
</html>