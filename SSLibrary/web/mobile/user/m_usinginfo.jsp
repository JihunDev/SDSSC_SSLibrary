<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(document).ready(function() {
		if ("${returnqt}" == 1) {
			$('#bookokpopup').popup('open');
		}
		var qt = $('#qt').val();
		if (qt == 1) {
			$('#bookfailpopup').popup('open');
		} else if (qt == 2) {
			$('#bookokpopup').popup('open');
		}
	});

	function extendMySeat() {
		if ('${userseat.renew_qt}' != 2) {
			$('#extendMySeat').popup('open');
			$("#extendMySeatbutton").click(function() {
				location.href = "m_userseatmodify.do?id=${userseat.s_id}";
				window.setTimeout(function name() {
					$('#seatuppopup').popup('open');
				}, 1000);
				
			});
		} else {
			$('#seatpopup').popup('open');
		}
	}

	function returnMySeat() {
		$('#returnMySeat').popup('open');
		$("#returnMySeatbutton").click(function() {
			location.href = "m_userseatremove.do?id=${userseat.s_id}";
			window.setTimeout(function name() {
				$('#seatrepopup').popup('open');
			}, 1000);
			
		});
	}
</script>
<h2>�¼� �̿� ����</h2>
<div>
	<ul data-role="listview" data-inset="true">
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
<br>
<c:if test="${userseat.s_id == null}">
	<a href="m_seatloglist.do?id=${user.id}" data-role="button">����</a>
</c:if>
<h2>���� �̿� ����</h2>
<div>
	<c:forEach items="${booklist}" var="book" varStatus="status">
		<ul data-role="listview" data-inset="true">
			<li>
				<h3>������ȣ : ${book[0]}</h3>
				<p>å�̸� : ${book[1]}</p>
				<P>���ð�</P>
				<p>${book[2]}~${book[3]}</p>
				<p class="ui-li-aside">
					<strong>����Ƚ�� : ${book[4]}</strong>
				</p>
			</li>
		</ul>
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
</div>
<br>
<a href="m_bookloglist.do" data-role="button">����</a>


<!-- popup -->

<!-- seat -->
<div data-role="popup" id="seatuppopup">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>�¼� ��� �Ⱓ�� ����Ǿ����ϴ�.</h2>
	</div>
</div>

<div data-role="popup" id="seatpopup">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>2ȸ ���ķ� �����Ͻ� �� �����ϴ�.</h2>
	</div>
</div>

<div data-role="popup" id="seatrepopup">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>�¼��� �ݳ��ϼ̽��ϴ�.</h2>
	</div>
</div>

<div data-role="popup" id="extendMySeat">
	<div data-role="header">
		<h1>�¼�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>${userseat.s_id}�� �¼��� �����Ͻðڽ��ϱ�?</h2>
		<button type="button" id="extendMySeatbutton">����</button>
	</div>
</div>

<div data-role="popup" id="returnMySeat">
	<div data-role="header">
		<h1>�¼�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>${userseat.s_id}�� �¼��� �ݳ��Ͻðڽ��ϱ�?</h2>
		<button type="button" id="returnMySeatbutton">�ݳ�</button>
	</div>
</div>

<!-- book popup -->

<div data-role="popup" id="bookokpopup">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>�뿩�ݳ��� Ȯ�εǾ����ϴ�.</h2>
	</div>
</div>

<div data-role="popup" id="bookfailpopup">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>�� �̻� ������ �� �����ϴ�.(�ִ� 2�� ���� ����)</h2>
	</div>
</div>

<div data-role="popup" id="bookokpopup">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>���� �뿩 �Ⱓ ������ �Ϸ�Ǿ����ϴ�.</h2>
	</div>
</div>


