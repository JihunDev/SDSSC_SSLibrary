<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
tr {
	border-bottom: 1px solid lightgray;
}

table {
	background: white;
	border-radius : 8px 8px 8px 8px;
}




</style>
<!-- å �˻� -->
<form action="m_booksearch.do" method="POST">
	<div class="ui-grid-a">
		<div class="ui-block-a">
			<select name="issearch">
				<option value="">����</option>
				<option value="name">å�̸�</option>
				<option value="writer">����</option>
			</select>
		</div>
		<div class="ui-block-b">
			<select name="category">
				<option value="">����</option>
				<option value="i">IT</option>
				<option value="n">�Ҽ�</option>
				<option value="m">��ȭå</option>
			</select>
		</div>
	</div>
	<input type="text" name="search" placeholder="Search for..."> <input
		type="submit" value="�˻�">
</form>

<!-- å ��º�  -->
<div id="book_result">
	<table data-role="table" data-mode="columntoggle" class="ui-responsive"
		id="myTable">
		<thead>
			<tr>
				<th data-priority="8">ID</th>
				<th data-priority="8">NAME</th>
				<th data-priority="8">WRITER</th>
				<th data-priority="4">IMG</th>
				<th data-priority="3">FLOOR</th>
				<th data-priority="2">TOTAL_QT</th>
				<th data-priority="1">CURRENT_QT</th>
				<th data-priority="5">REGDATE</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${booklist}" var="b" varStatus="status">
				<tr>
					<td>${b.id}</td>
					<td><a href="m_bookdetail.do?id=${b.id}">${b.name}</a></td>
					<td>${b.writer}</td>
					<td><img width="30px" src="img/book/${b.img}"></td>
					<td>${b.floor}</td>
					<td>${b.total_qt}</td>
					<td>${b.current_qt}</td>
					<td>${b.reg_date}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>


