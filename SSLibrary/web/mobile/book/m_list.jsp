<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<ul id="list" data-role="listview" data-filter="true"
	data-filter-placeholder="Search..." data-inset="true">
	<c:forEach items="${booklist}" var="b">
		<li>
			<h3>å��ȣ : <a href="m_bookdetail.do?id=${b.b_id}">${b.b_id}</a></h3>
			<p>�뿩�� : ${b.u_id}</p>
			<p>�ð� : ${b.start_date} ~ ${b.real_date}</p> <span
			class="ui-li-count">���� : ${b.renew_qt}</span>
		</li>
	</c:forEach>
</ul>