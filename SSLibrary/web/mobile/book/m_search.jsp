<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#myTable tr {
	border-bottom: 1px solid lightgray;
}

#myTable {
	background: white;
	border-radius: 8px 8px 8px 8px;
	text-align: center;
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
				<th data-priority="8" style="text-align:center;">��ȣ</th>
				<th data-priority="8" style="text-align:center;">å �̸�</th>
				<th data-priority="2" style="text-align:center;">����</th>
				<th data-priority="5" style="text-align:center;">ǥ��</th>
				<th data-priority="4" style="text-align:center;">����/��</th>
				<th data-priority="3" style="text-align:center;">�� ����</th>
				<th data-priority="1" style="text-align:center;">�뿩���� ����</th>
				<th data-priority="6" style="text-align:center;">�����</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${booklist}" var="b" varStatus="status">
				<tr>
					<td style="text-align:center;">${b.id}</td>
					<td style="text-align:center;"><a href="m_bookdetail.do?id=${b.id}">${b.name}</a></td>
					<td style="text-align:center;">${b.writer}</td>
					<td style="text-align:center;"><img width="30px" src="img/book/${b.img}"></td>
					<td style="text-align:center;">${b.floor}</td>
					<td style="text-align:center;">${b.total_qt}</td>
					<td style="text-align:center;">${b.current_qt}</td>
					<td style="text-align:center;">${b.reg_date}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>


