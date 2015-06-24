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
	var id = f.id.value;
	var pwd = f.pwd.value;
	var pwdcheck = f.pwdcheck.value;
	var name = f.name.value;
	
	if(id == null || id == ''){
		alert("ID�� �Է��ϼ���.");
	}else if(pwd == null || pwd == ''){
		alert("PWD�� �Է��ϼ���.");
	}else if(pwd != pwdcheck){
		alert("��й�ȣ�� ���� �ʽ��ϴ�.");
	}else if(name == null || name == ''){
		alert("NAME�� �Է��ϼ���.");
	}else{
		var c = confirm('��� �Ͻðڽ��ϱ�?');
		if (c == true) {
			f.action = '.do';
			f.method = 'POST';
			f.submit();
		};
	}			
}
function idcheck() {
	var id = $('#id').value;
	$.ajax({
		type : 'POST',
		anync : 'false',
		url : 'send.do',
		data : {
			'id' : id
		},
		success : function(data) {
			display(data);
		}
	});
}
function display(data) {
	var output = '';
	if(data == 1){
		output ='��밡��';
	}else{
		output ='���Ұ���';
	}
	$('#idcheck').html(output);
}
$(document).ready(function() {
	$('#pwd').click(function() {
		idcheck();
	});
});
</script>
<style></style>
</head>
<body>
<div>
	<h1>ȸ������</h1>
	<form>
		<input type="hidden" name="isadmin"	value="n"><br>
		<input type="text" name="id" id="id" placeholder="ID"><br><div id="idcheck"></div>
		<input type="text" name="pwd" id="pwd" placeholder="PWD"><br>
		<input type="text" name="pwdcheck" id="pwdcheck" placeholder="PWD"><br>
		<input type="text" name="name" placeholder="NAME"><br>
		<input type="text" name="phone" placeholder="PHONE"><br>
		<input type="text" name="birth" placeholder="BIRTH"><br>
		<input type="file" name="img"><br>
		<input type="button" value="register" onclick="register(this.form);">
	</form>
</div>
</body>
</html>