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
function register(f){
	var id = f.id.value;
	var name = f.name.value;
 	var writer = f.writer.value;
 	var img = f.img.value;
 	var total_qt = f.total_qt.value;
 	var floor = f.floor.value;
	
	if(id == null || id == ''){
		alert('ID�� �Է��ϼ���');
		f.id.focus();
		return;
	};
	if(name == null || name == ''){
		alert('NAME�� �Է��ϼ���');
		f.name.focus();
		return;
	};
	if(writer == null || writer == ''){
		alert('WRITER�� �Է��ϼ���');
		f.name.focus();
		return;
	};
	if(img == null || img == ''){
		alert('IMG�� �־��ּ���');
		f.name.focus();
		return;
	};
	if(floor == '����'){
		alert('������ �������ּ���');
		f.name.focus();
		return;
	};
 	if(total_qt== null || total_qt == ''){
		alert('������ �Է��ϼ���');
		return;
	};
	
	var c = confirm('����Ͻðڽ��ϱ�?');
	if(c==true){
		f.action='bookregisterimpl.do';
		f.method = 'POST';
		f.submit();
	} 
};
</script>
<style></style>
</head>
<body>
<h1 align="center">Book Register</h1>
<fieldset>
<legend>å ��� ���</legend>
<form enctype="multipart/form-data">
<table>
<tr><th>ID</th><td align="right"><input type="text" name="id" placeholder="ID"></td></tr>
<tr><th>NAME</th><td align="right"><input type="text" name="name" placeholder="NAME"></td></tr>
<tr><th>WRITER</th><td align="right"><input type="text" name="writer" placeholder="WRITER"></td></tr>
<tr><th>IMG</th><td align="right"><input type="file" name="img"></td></tr>
<tr><th>FLOOR</th><td align="right"><select name="floor"><option>����</option><option>1��</option><option>2��</option><option>3��</option><option>4��</option></select></td></tr>
<tr><th>TOTAL_QT</th><td align="right"><input type="text" name="total_qt" placeholder="TOTAL_QT"></td></tr>
<tr><th></th><td align="right"><input type="button" value="register" onclick="register(this.form);"></td></tr>
</table>
</form>
</fieldset>
</body>
</html>