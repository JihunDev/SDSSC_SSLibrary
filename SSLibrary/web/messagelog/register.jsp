<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>�޼��� ����</h1>
<h2>�� 1�� �������� ${user.id}</h2><!-- ���� ���� -->
<form action="msgsendimpl.do" method="POST">
<textarea rows="10" cols="20"></textarea><br>
<input type="submit" value="����">
</form>