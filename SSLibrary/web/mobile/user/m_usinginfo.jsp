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
<!-- �¼� ���� -->
<table>
	<tr>
		<td>����¼� :</td>
		<td colspan="2">${userseat.s_id}���¼�</td>
	</tr>
	<tr>
		<td>���ð� :</td>
		<td>${userseat.start_time}~${userseat.end_time}</td>
		<td><a href="javascript:;" onClick="extendMySeat();"
			data-role="button">����</a></td>
	</tr>
	<tr>
		<td>����Ƚ�� :</td>
		<td>${userseat.renew_qt}</td>
		<td><a href="javascript:;" onClick="returnMySeat();"
			data-role="button">�ݳ�</a></td>
	</tr>
	<tr>
		<td colspan="3"><a href="m_seatloglist.do?id=${user.id}"
			data-role="button">����</a></td>
	</tr>
</table>

<!-- å ���� -->
<table>
	<tbody>
		<c:forEach items="${booklist}" var="book" varStatus="status">
			<tr>
				<td>������ȣ :</td>
				<td colspan="2">${book[0]}</td>
			</tr>
			<tr>
				<td>å�̸� :</td>
				<td>${book[1]}</td>
				<td><a href="javascript:;"
					onClick="if (confirm('�����Ͻðڽ��ϱ�?')) location.href='m_userbookmodifyimpl.do?id=${book[0]}'"
					data-role="button">����</a></td>
			</tr>
			<tr>
				<td>�뿩�Ⱓ :</td>
				<td>${book[2]}~${book[3]}</td>
				<td><a href="javascript:;"
					onClick="if (confirm('�ݳ��Ͻðڽ��ϱ�?')) location.href='m_userbookremove.do?id=${book[0]}'"
					data-role="button">�ݳ�</a></td>
			</tr>
			<c:if test="${status.last}">
				<tr>
					<td colspan="3"><a href="m_bookloglist.do" data-role="button">����</a></td>
				</tr>
			</c:if>
		</c:forEach>
	</tbody>
</table>