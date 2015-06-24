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

function del(f) {
		var c = confirm('���� �Ͻðڽ��ϱ�?');
		if (c == true) {
			f.action = 'del.do';
			f.method = 'POST';
			f.submit();
		};		
}

</script>
<style></style>
</head>
<body>
	<h1>ȸ������</h1>
	<form>
		<input type="hidden" name="oldimg" value="#{user.img}"><br><!-- ���� ����̹��� -->
		<input type="hidden" name="isadmin" value="#{user.isadmin}"><br>
		<input type="text" name="id" id="id" value="#{user.id}" disabled="disabled"><br>
		<input type="text" name="pwd" id="pwd" placeholder="PWD"><br>
		<input type="text" name="pwdcheck" id="pwdcheck" placeholder="PWD"><br>
		<input type="text" name="name" value="#{user.name}"><br>
		<input type="text" name="phone" varue><br>
		<input type="text" name="birth" placeholder="BIRTH"><br>
		<input type="file" name="img"><br><!-- ���ο� ����̹��� -->
		<input type="button" value="update" onclick="update(this.form);">
		<input type="button" value="delete" onclick="del(this.form);">
		<!-- delete�� ������ del�� ���� -->
	</form>
</body>
</html>