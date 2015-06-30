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
			f.action = 'boardremoveimpl.do';/* ���� ���� */
			f.method = 'POST';
			f.submit();
		};
	}
function update(f) {
	var c = confirm('���� �Ͻðڽ��ϱ�?');
		if (c == true) {
			f.action = 'boardmodify.do';/* ���� ���� */
			f.method = 'POST';
			f.submit();
		};
	}
function register(f) {
	var c = confirm('������ ��� �Ͻðڽ��ϱ�?');
		if (c == true) {
			f.action = 'boardwriteimpl.do';/* ���� ���� */
			f.method = 'POST';
			f.submit();
		};
	}
</script>
<style></style>
</head>
<body>
<h1>board detail</h1>

	<table border="1">
	<tbody>
		<tr>
			<td>����</td>
			<td colspan="3">${boarddetail.title}</td>
			<td>�۾���</td>
			<td>${boarddetail.u_id}</td>
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
<form>
	<input type="hidden" name="sort" value="${boarddetail.sort}">
	<input type="hidden" name="id" value="${boarddetail.id}">
	<input type="button" value="����" onclick="del(this.form)">
	<input type="button" value="����" onclick="update(this.form)">
</form>
	<table border=1>
		<c:forEach items="${boardreply}" var="reply">
		<form>
			<input type="hidden" name="sort" value="${boarddetail.sort}">
			<input type="hidden" name="id" value="${boarddetail.id}">
	
			<tr>
				<td>��Ϲ�ȣ</td><td>${reply.id}</td>
				<td>�ð�</td><td>${reply.reg_date}</td>
				<td><input type="button" value="����" onclick="del(this.form)"></td>
			</tr>
			<tr>			
				<td>�۾���</td><td>${reply.u_id}</td>
				<td>����</td>
				<td>${reply.content}</td>
				<td><input type="button" value="����" onclick="update(this.form)"></td>
			</tr>
		</form>
		</c:forEach>
	</table>
	<form>
	<div>
		<input type="hidden" name="reg_number" id="reg_number" value="${boarddetail.id}"><br>
		<input type="hidden" name="sort" value="${boarddetail.sort}"><br>
		<input type="hidden" name="u_id" value="${id}"><br>
		<textarea rows="5" cols="40" name="content"></textarea>
		<input type="button" value="���" onclick="register(this.form)">
	</div>
</form>	
</body>
</html>