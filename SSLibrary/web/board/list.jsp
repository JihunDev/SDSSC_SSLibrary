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
<h1>board list</h1>
	<table>
			<thead>
				<tr>
					<th>�۹�ȣ</th>
					<th>����</th>
					<th>�۾���</th>
					<th>�ۼ���</th>
					<th>��ȸ��</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardlist}" var="b">
					<tr>
						<td>${b.id}</td>
						<td><a href="a.do?id='${b.title}'">${b.title}</a></td><!-- ���� ���� -->
						<td>${b.u_id}</td>
						<td>${b.reg_date}</td>
						<td>${b.counter}</td>
					</tr>
				</c:forEach>
			</tbody><!-- test�� ������ �Ѿ�� �� ���� -->
		</table>
<div>
<input type="button" value="���" onclick="a.do?id='${b.id}'"><!-- ���ļ��� -->
</div>
</body>
</html>