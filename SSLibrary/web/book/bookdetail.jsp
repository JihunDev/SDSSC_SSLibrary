<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<style></style>
</head>
<body>
<h1 align="center">Book Detail Page</h1>
<fieldset>
<legend>Book Detail</legend>
<table width="700"> <!-- ���ļ��� -->
<tr><td rowspan="6"><img width="200px" src="img/${b.img}"></td><th>ID</th><td>${b.id}</td></tr>
<tr><th>å����</th><td>${b.name}</td></tr>
<tr><th>����</th><td>${b.writer}</td></tr>
<tr><th>�ڷ��</th><td>${b.floor}</td></tr>
<tr><th>��������</th><td>${b.total_qt}</td></tr>
<tr><th>�����</th><td>${b.reg_date}</td></tr>
</tbody>
</table>
<div>
<div><a href="bookdelete.do?id=${bookdetail.id}">����</a></div> <!-- ���ļ��� -->
<div><a href="bookupdate.do?id=${bookdetail.id}">����</a></div> <!-- ���ļ��� -->
</div>
</fieldset>
</body>
</html>