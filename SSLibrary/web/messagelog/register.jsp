<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>메세지 전송</h1>
<h2>제 1번 열람실의 ${user.id}</h2><!-- 추후 변경 -->
<form action="msgsendimpl.do" method="POST">
<textarea rows="10" cols="20"></textarea><br>
<input type="submit" value="전송">
</form>