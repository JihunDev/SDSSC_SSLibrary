<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>Seat State(���� �¼� ����)</h1>
<table border="1">
<c:forEach items="${seatlist}" var="s"> <!-- ���ļ��� -->
<tr>
<td><a href="seatmodify.do?id=${s.id}">${s.id}</a></td>
</c:forEach>
</tr>
</table>