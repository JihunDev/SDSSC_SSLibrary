<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
tbody td {
	border-bottom: 1px solid #d6d6d6;
}

tbody th {
	border-bottom: 1px solid #d6d6d6;
}
</style>

<script>
	function del(f) {
		$('#dels').popup('open');
		$("#delbutton").click(function() {
			f.action = 'm_boardremoveimpl.do';
			f.method = 'POST';
			f.submit();
		});
	}

	function register(f) {
		$('#registers').popup('open');
		$("#registerbutton").click(function() {
			f.action = 'm_boardwriteimpl.do';
			f.method = 'POST';
			f.submit();
		});
	}

	function update(f) {
		var reg_number = f.reg_number.value;
		var id = f.id.value;
		if (reg_number != 0) {
			$('#updates').popup('open');
			$("#updatebutton").click(function() {
				f.action = 'm_boardmodifyimpl.do';
				f.method = 'POST';
				f.submit();
			});
		} else {
			$('#updatereply').popup('open');
			$("#updatereplybutton").click(function() {
				f.action = 'm_boardmodify.do';
				f.method = 'POST';
				f.submit();
			});
		}
	}
</script>

<!-- �Խñ� -->
<table width="100%">
	<tbody>
		<tr>
			<th>����</th>
			<td colspan="5">${boarddetail.title}</td>
		<tr>
			<th>�з�</th>
			<td>${boarddetail.sort}</td>
			<th>�۾���</th>
			<td>${boarddetail.u_id}</td>
			<th>��ȸ</th>
			<td>${boarddetail.counter}</td>
		</tr>
		<tr>
			<th>�ۼ���</th>
			<td colspan="5">${boarddetail.reg_date}</td>
		</tr>
		<tr>
			<th colspan="6">����</th>
		</tr>
		<tr>
			<td colspan="6">${boarddetail.content}</td>
		</tr>
	</tbody>
</table>

<!-- �Խñ� ���� -->
<form>
	<input type="hidden" name="sort" value="${boarddetail.sort}"> <input
		type="hidden" name="id" value="${boarddetail.id}"> <input
		type="hidden" name="reg_number" value="${boarddetail.reg_number}">
	<c:if test="${boarddetail.u_id == user.id}">
		<div class="ui-grid-b">
			<div class="ui-block-a">
				<input type="button" onClick="update(this.form);" value="����">
			</div>
			<div class="ui-block-b">
				<input type="button" onClick="del(this.form);" value="����">
			</div>
			<div class="ui-block-c">
				<a href="m_boardmain.do?sort=${boarddetail.sort}" data-role="button">���</a>
			</div>
		</div>
	</c:if>
	<c:if test="${boarddetail.u_id != user.id}">
		<a href="m_boardmain.do?sort=${boarddetail.sort}" data-role="button">���</a>
	</c:if>
</form>

<!-- reply â -->
<form>
	<input type="hidden" name="reg_number" id="reg_number"
		value="${boarddetail.id}"> <input type="hidden" name="sort"
		value="${boarddetail.sort}"> <input type="hidden" name="u_id"
		value="${user.id}"> <label for="content">Comment:</label>
	<textarea rows="5" cols="40" name="content"></textarea>
	<input type="button" value="���" onclick="register(this.form)">
</form>

<!-- reply ��� -->
<br>
<ul data-role="listview">
	<c:forEach items="${boardreply}" var="reply">
		<li>
			<h3>${reply.content}</h3>
			<p>${reply.u_id}|${reply.reg_date}</p>
			<p class="ui-li-aside">
				<strong>��Ϲ�ȣ : ${reply.id}</strong>
			</p> <c:if test="${reply.u_id == user.id}">
				<form>
					<div data-role="collapsible">
						<h1>��������</h1>
						<textarea rows="5" cols="40" name="content">${reply.content}</textarea>
						<input type="hidden" name="sort" value="${reply.sort}"> <input
							type="hidden" name="id" value="${reply.id}"> <input
							type="hidden" name="reg_number" value="${reply.reg_number}">
						<input type="hidden" name="old_content" value="${reply.content}">
						<input type="hidden" name="u_id" value="${user.id}"> <input
							type="hidden" name="content">
						<div class="ui-grid-a">
							<div class="ui-block-a">
								<input type="button" id="btn_${reply.id}" value="����"
									onclick="update(this.form)">
							</div>
							<div class="ui-block-b">
								<input type="button" value="����" onclick="del(this.form)">
							</div>
						</div>
					</div>
				</form>
			</c:if>
		</li>
	</c:forEach>
</ul>

<!-- popup -->

<div data-role="popup" id="dels">
	<div data-role="header">
		<h1>���</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>���� �Ͻðڽ��ϱ�?</h2>
		<button type="button" id="delbutton">����</button>
	</div>
</div>

<div data-role="popup" id="registers">
	<div data-role="header">
		<h1>���</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>����� ��� �Ͻðڽ��ϱ�?</h2>
		<button type="button" id="registerbutton">���</button>
	</div>
</div>

<div data-role="popup" id="updates">
	<div data-role="header">
		<h1>����</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>����� ���� �Ͻðڽ��ϱ�?</h2>
		<button type="button" id="updatebutton">����</button>
	</div>
</div>

<div data-role="popup" id="updatereply">
	<div data-role="header">
		<h1>����</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>���� �Ͻðڽ��ϱ�?</h2>
		<button type="button" id="updatereplybutton">����</button>
	</div>
</div>
