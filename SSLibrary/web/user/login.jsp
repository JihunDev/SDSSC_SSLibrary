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
function login(f) {
	var id = f.id.value;
	var pwd = f.pwd.value;
	$.ajax({
		type : 'POST',
		anync : 'false',
		url : 'loginimpl.do',/* ���� ���� */
		data : {
			'id' : id,
			'pwd' : pwd			
		},
		success : function(data) {
			display(data);
		}
	});
}

function display(data) {
	if(data == 'ok'){
		
	}else{
		alert("���̵�� ��й�ȣ�� ���� �ʽ��ϴ�. �ٽ� �Է����ּ���");
	}
}
</script>
<style></style>
</head>
<body>
<fieldset>
	<legend>Login</legend>
		<form>
			<input type="text" name="id" id="id" placeholder="ID"><br>
			<input type="text" name="pwd" id="pwd" placeholder="PWD"><br>
			<input type="button" value="login" onclick="login(this.form);">
			<a href="register.do">���</a><!-- ���ļ��� -->
		</form>
</fieldset>
</body>
</html>