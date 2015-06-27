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
		f.action='bookmodifyimpl.do';
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
<form name="updatebook" enctype="multipart/form-data">
<input type ="hidden" name="id" value="${bookinfo.id}">
<input type ="hidden" name="oldimg" value="${bookinfo.img}">
<input type ="hidden" name="current_qt" value="${bookinfo.current_qt}">
<table>
<tr><th>ID</th><td align="right"><input type="text" name="id" placeholder="ID" value="${bookinfo.id}" disabled></td></tr>
<tr><th>NAME</th><td align="right"><input type="text" name="name" placeholder="NAME" value="${bookinfo.name}" ></td></tr>
<tr><th>WRITER</th><td align="right"><input type="text" name="writer" placeholder="WRITER" value="${bookinfo.writer}"></td></tr>
<tr><th>IMG</th><td align="right"><img width="30" src="img/book/${bookinfo.img}">${bookinfo.img}</td></tr>
<tr><th>NEW IMG</th><td><input type="file" name="img"></td></tr>
<tr><th>FLOOR</th>
<td align="right">
<c:choose>
<c:when test="${bookinfo.floor=='1��'}"> 
<select name="floor">
<option>����</option>
<option value="1��" selected>1��</option>
<option value="2��">2��</option>
<option value="3��">3��</option>
<option value="4��">4��</option>
</select> 
</c:when> 
<c:when test="${bookinfo.floor=='2��'}">
<select name="floor">
<option>����</option>
<option value="1��" >1��</option>
<option value="2��" selected>2��</option>
<option value="3��">3��</option>
<option value="4��">4��</option>
</select> 
</c:when>
<c:when test="${bookinfo.floor=='3��'}">
<select name="floor">
<option>����</option>
<option value="1��" >1��</option>
<option value="2��">2��</option>
<option value="3��" selected>3��</option>
<option value="4��">4��</option>
</select> 
</c:when>
<c:otherwise>
<select name="floor">
<option>����</option>
<option value="1��" >1��</option>
<option value="2��">2��</option>
<option value="3��" >3��</option>
<option value="4��" selected>4��</option>
</select> 
</c:otherwise>
</c:choose> 
</td></tr>
<tr><th>TOTAL_QT</th><td align="right"><input type="text" name="total_qt" placeholder="TOTAL_QT"  value="${bookinfo.total_qt}"></td></tr>
<tr><th></th><td align="right"><input type="button" value="����" onclick="update(this.form);"></td></tr>
</table>
</form>
</fieldset>
</body>
</html>