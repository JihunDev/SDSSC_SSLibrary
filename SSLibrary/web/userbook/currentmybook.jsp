<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<body>
<h1 align="center">���� �뿩�� ������</h1>
<fieldset>
<legend>���� �뿩 ����</legend>
<table width="700">
<thead>
<tr><th>å�̸�</th><th>�뿩�Ⱓ</th><th></th><th></th></tr>
</thead>
<tbody>
<c:forEach items="${mylist}" var="m">    <!-- ���� ���� -->
<tr><td>${m.name}</td><td>${m.period}</td><td><a href="bookreturn.do?id=${mypage.id}">�ݳ�</a></td><td><a href="bookdelay.do?id=${mypage.id}">����</a></td></tr>
</c:forEach>
</tbody>
</table>
<div>
</div>
</fieldset>