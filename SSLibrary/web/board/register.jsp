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
function register(f) {
	var c = confirm('��� �Ͻðڽ��ϱ�?');
		if (c == true) {
			f.action = 'a.do';/* ���� ���� */
			f.method = 'POST';
			f.submit();
		};
	}
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
</script>
<style></style>
</head>
<body>
<h1>board register</h1>
<form>
	<select id="category">
		<option value="">����</option>
		<option value="n">��������</option>
		<option value="f">�����Խ���</option>
	</select>
	<input type="text" placeholder="������ �Է��ϼ���."><br>
	<textarea rows="40" cols="40"></textarea><br>
	<input type="button" value="����" onclick="del(this.form)"><!-- ���� ���� -->
	<input type="submit" value="����" onclick="update(this.form)"><!-- ���� ���� -->
	<input type="submit" value="���" onclick="register(this.form)"><!-- ���� ���� -->
</form>
</body>
</html>