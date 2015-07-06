<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(document).ready(function() {
		if ("${returnqt}" == 1) {
			alert("�뿩�ݳ��� Ȯ�εǾ����ϴ�.");
		}
		var qt = $('#qt').val();
		if (qt == 1) {
			alert("�� �̻� ������ �� �����ϴ�.(�ִ� 2�� ���� ����)");
		} else if (qt == 2) {
			alert("���� �뿩 �Ⱓ ������ �Ϸ�Ǿ����ϴ�.");
		}
	});

	function extendMySeat() {
		if ('${userseat.renew_qt}' != 2) {
			var c = confirm("${userseat.s_id}�� �¼��� �����Ͻðڽ��ϱ�??");
			if (c == true) {
				location.href = "m_userseatmodify.do?id=${userseat.s_id}";
				alert("�¼� ��� �Ⱓ�� ����Ǿ����ϴ�.");
			}
		} else {
			alert("2ȸ ���ķ� �����Ͻ� �� �����ϴ�.");
		}
	}

	function returnMySeat() {
		var c = confirm("${userseat.s_id}�� �¼��� �ݳ��Ͻðڽ��ϱ�??");
		if (c == true) {
			location.href = "m_userseatremove.do?id=${userseat.s_id}";
			alert("�¼��� �ݳ��ϼ̽��ϴ�.");
		}
	}
</script>
<h2>�¼� �̿� ����</h2>
<div data-role="content">
	<ul data-role="listview">
		<li>
			<h3>����¼� : ${userseat.s_id}���¼�</h3>
			<P>���ð�</P>
			<p>${userseat.start_time}~${userseat.end_time}</p>
			<p class="ui-li-aside">
				<strong>����Ƚ�� : ${userseat.renew_qt}</strong>
			</p>
		</li>
	</ul>
</div>
<c:if test="${userseat.s_id != null}">
	<div class="ui-grid-b">
		<div class="ui-block-a">
			<a href="javascript:;" onClick="extendMySeat();" data-role="button">����</a>
		</div>
		<div class="ui-block-b">
			<a href="javascript:;" onClick="returnMySeat();" data-role="button">�ݳ�</a>
		</div>
		<div class="ui-block-c">
			<a href="m_seatloglist.do?id=${user.id}" data-role="button">����</a>
		</div>
	</div>
</c:if>
<input type="hidden" id="qt" value="${qt}">
<c:if test="${userseat.s_id == null}">
	<a href="m_seatloglist.do?id=${user.id}" data-role="button">����</a>
</c:if>
<h2>���� �̿� ����</h2>
<div data-role="content">
	<ul data-role="listview">
		<c:forEach items="${booklist}" var="book" varStatus="status">
			<li>
				<h3>������ȣ : ${book[0]}</h3>
				<p>å�̸� : ${book[1]}</p>
				<P>���ð�</P>
				<p>${book[2]}~${book[3]}</p>
				<p class="ui-li-aside">
					<strong>����Ƚ�� : ${book[4]}</strong>
				</p>
			</li>
			<div class="ui-grid-a">
				<div class="ui-block-a">
					<a href="javascript:;"
						onClick="if (confirm('�����Ͻðڽ��ϱ�?')) location.href='m_userbookmodifyimpl.do?id=${book[0]}'"
						data-role="button">����</a>
				</div>
				<div class="ui-block-b">
					<a href="javascript:;"
						onClick="if (confirm('�ݳ��Ͻðڽ��ϱ�?')) location.href='m_userbookremove.do?id=${book[0]}'"
						data-role="button">�ݳ�</a>
				</div>
			</div>
		</c:forEach>
	</ul>
</div>
<a href="m_bookloglist.do" data-role="button">����</a>
