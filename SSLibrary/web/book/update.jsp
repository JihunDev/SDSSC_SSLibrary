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
function update(f){

	var c = confirm('�����Ͻðڽ��ϱ�?');
	if(c==true){
		f.action='bookupdateimpl.do';
		f.method = 'POST';
		f.submit();
	} 
};
</script>
<style></style>
</head>
<body>
<h1 align="center">Book Update</h1>
<fieldset>
<legend>å ���� ���</legend>
<form enctype="multipart/form-data">
<table>
<tr><th>ID</th><td align="right"><input type="text" name="id" placeholder="ID" value="${u.id}" disabled></td></tr>
<tr><th>NAME</th><td align="right"><input type="text" name="name" placeholder="NAME" value="${u.name}" ></td></tr>
<tr><th>WRITER</th><td align="right"><input type="text" name="writer" placeholder="WRITER" value="${u.writer}"></td></tr>
<tr><th>IMG</th><td align="right"><input type="file" name="img"  value="${u.img}"></td></tr>
<tr><th>FLOOR</th><td align="right"><select name="floor" value="${u.floor}"><option>����</option><option>1��</option><option>2��</option><option>3��</option><option>4��</option></select></td></tr>
<tr><th>TOTAL_QT</th><td align="right"><input type="text" name="total_qt" placeholder="TOTAL_QT"  value="${u.total_qt}"></td></tr>
<tr><th></th><td align="right"><input type="button" value="����" onclick="update(this.form);"></td></tr>
</table>
</form>
</fieldset>
</body>
</html>