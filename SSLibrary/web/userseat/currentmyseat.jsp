<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1 align="center">�� �߱� ����</h1>
<fieldset>
<legend>�� �߱� �¼�</legend>
<table width="700">
<thead>
<tr><th>�߱� �¼�</th><th>��� �ð�</th><th></th><th></th></tr>
</thead>
<tbody>
<c:forEach items="${myseatlist}" var="m">    <!-- ���� ���� -->
<tr><td>${m.id}</td><td>${m.period}</td><td><a href="userseatremove.do?id=${mypage.id}">�ݳ�</a></td><td><a href="userseatmodify.do?id=${mypage.id}">����</a></td></tr>
</c:forEach>
</tbody>
</table>
<div>
</div>
</fieldset>