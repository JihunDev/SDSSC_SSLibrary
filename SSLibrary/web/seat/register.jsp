<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String receiver_id = (String) request.getAttribute("receiver_id"); %>
<h1>�޼��� ����</h1>
<h2>�߽���: ${user.id}(${user.name}) </h2>
<h2>������: ${receiver_id}</h2>

<!-- ���� ���� -->
<form action="msgsendimpl.do" method="POST">
	<textarea rows="10" cols="20"></textarea>
	<br> <input type="button" value="����">
</form>