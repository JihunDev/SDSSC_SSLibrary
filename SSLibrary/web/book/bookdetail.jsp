<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%User user = (User)session.getAttribute("user");%>
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
<h1 align="center">Book Detail Page</h1>
<fieldset>
<legend>Book Detail</legend>
<table width="700"> <!-- ���ļ��� -->
<tr><td rowspan="7"><img width="200px" src="img/book/${bookdetail.img}"></td><th>ID</th><td>${bookdetail.id}</td></tr>
<tr><th>å����</th><td>${bookdetail.name}</td></tr>
<tr><th>����</th><td>${bookdetail.writer}</td></tr>
<tr><th>�ڷ��</th><td>${bookdetail.floor}</td></tr>
<tr><th>��������</th><td>${bookdetail.total_qt}</td></tr>
<tr><th>�뿩���ɰ���</th><td>${bookdetail.current_qt}</td></tr>
<tr><th>�����</th><td>${bookdetail.reg_date}</td></tr>
</tbody>
</table>
<%if(user!=null && user.getIsadmin().equals("y")){ %>
<div><a href="bookmodify.do?id=${bookdetail.id}">����</a></div>
<div><a href="javascript:;" onClick="if (confirm('���� �����Ͻðڽ��ϱ�?')) location.href='bookremoveimpl.do?id=${bookdetail.id}'">����</a></div>
<div><a href="userbookregister.do?id=${bookdetail.id}">�뿩</a></div>
<%}else if(user!=null && user.getIsadmin().equals("n")){ %>
<div><a href="userbookregister.do?id=${bookdetail.id}">�뿩</a></div>
<%}else{ %>
<%} %>
</fieldset>
</body>
</html>