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
</script>
<style></style>
</head>
<body>
<h1 align="center">���� �ݳ�</h1>
<fieldset>
<legend>�ݳ� ����</legend>
<form>
<div>
<table width="700">
<thead><tr><th>U_ID</th><th >B_ID</th><th >START_DATE</th><th>END_DATE</th><th>RENEW_QT</th>
</tr></thead>
<tbody>
<c:forEach items="${userbooklist}" var="b"> <!-- ���ļ��� -->
<tr>
<td>${b.u_id}</td>
<td>${b.b_id}</td>
<td>${b.name}</td>
<td>${b.writer}</td>
<td><img width="50px" src="img/${b.img}"></td>
<td>${b.floor}</td>
<td>${b.current_qt}</td>
<td>${b.reg_date}</td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</form>
</fieldset>
</body>
</html>