<%@page import="com.entity.User"%>
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
function update(f) {
	var id = f.id.value;
	var pwd = f.pwd.value;
	var pwdcheck = f.pwdcheck.value;
	var name = f.name.value;
	
	if(pwd == null || pwd == ''){
		alert("PWD�� �Է��ϼ���.");
	}else if(pwd != pwdcheck){
		alert("��й�ȣ�� ���� �ʽ��ϴ�.");
	}else if((pwd.length < 8 || pwd.length > 16) || (pwdcheck.length < 8 || pwdcheck.length > 16)){
		alert("��й�ȣ�� 8�ڸ� �̻� 16�ڸ� ���Ϸ� ����Ͻñ� �ٶ��ϴ�.");	
	}else{
		var c = confirm('���� �Ͻðڽ��ϱ�?');
		if (c == true) {
			f.action = 'modifyimpl.do';/* ���� ���� */
			f.method = 'POST';
			f.submit();
		};
	}			
}

function del(f) {
	var c = confirm('���� �Ͻðڽ��ϱ�?');
	var id = f.id.value;
	if (c == true) {
		f.action = 'del.do';/* ���� ���� */
		f.method = 'POST';
		f.submit();
		alert(id+"���� Ż��Ǽ̽��ϴ�.")
	};		
}
</script>
<style></style>
</head>
<body>
	<h1>ȸ������</h1>
	<form enctype="multipart/form-data">
		<input type="hidden" name="oldimg" value="${userupdate.img}"><br><!-- ���� ����̹��� -->
		<input type="hidden" name="isadmin" value="${userupdate.isadmin}"><br>
		<input type="hidden" name="id" value="${userupdate.id}"><br>
		<input type="text" name="id" id="id" value="${userupdate.id}" disabled="disabled"><br>
		<input type="text" name="pwd" id="pwd" placeholder="PWD"><br>
		<input type="text" name="pwdcheck" id="pwdcheck" placeholder="PWD"><br>
		<input type="text" name="name" value="${userupdate.name}"><br>
		<input type="text" name="phone" value="${userupdate.phone}"><br>
		<input type="text" name="email" value="${userupdate.email}"><br>
		<h5>���� ���� ${userupdate.img}</h5>
		<input type="file" name="img"><br><!-- ���ο� ����̹��� -->
		<input type="button" value="update" onclick="update(this.form);">
		<input type="button" value="delete" onclick="del(this.form);">
		<!-- delete�� ������ del�� ���� -->
	</form>
</body>
</html>