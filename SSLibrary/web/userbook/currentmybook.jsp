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
<h1 align="center">���� �뿩�� ������</h1>
<fieldset>
<legend>���� �뿩 ����</legend>
<table width="700">
<thead>
<tr><th>å�̸�</th><th>�뿩�Ⱓ</th></tr>
</thead>
<tbody>
<c:forEach items="${mylist}" var="m">
<tr><td>${m.name}</td><td>${m.period}</td></tr>
</c:forEach>
</tbody>
</table>
<div>
<div><a href="bookreturn.do?id=${mypage.id}">�ݳ�</a></div> <!-- ���ļ��� -->
<div><a href="bookdelay.do?id=${mupage.id}">����</a></div><!-- ���ļ��� -->
</div>
</fieldset>
</body>
</html>