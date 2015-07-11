<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function removeUserbook() {
		if ("${userbooklist}" == "[]") {
			alert('�ݳ��� å�� �����ϴ�.');
			return;
		}
		var c = confirm('�ݳ� Ȯ���Ͻðڽ��ϱ�?');
		if (c == true) {
			location.href = "userbookremoveimpl.do";
			alert("�ݳ� Ȯ���� �Ϸ�Ǿ����ϴ�.");
		}
		;

	}
	$(document).ready(
			function() {
				var element = document.getElementById("listtable");
				var element2 = $("#returnbooklist");
				if ("${userbooklist}" == "[]") {
					$('#returnbooklist').html(
							"<tr><td colspan=6>�ݳ��� å�� �����ϴ�.</td><tr>");
				} else if ("${userbooklist}" != "[]"
						&& element2.height() >= 500) {
					$('#listtable').addClass("scroll");
				}
			});
</script>
<div class="fieldsetform">
	<fieldset>
		<legend align="center">�ǽð� �ݳ� ���� ����</legend>
		<form>
			<div>
				<table width="700" id="listtable" class="table table-hover">
					<thead>
						<tr>
							<th>U_ID</th>
							<th>B_ID</th>
							<th class="hidden-xs">START_DATE</th>
							<th>END_DATE</th>
							<th class="hidden-xs">RENEW_QT</th>
							<th width="100px">ISRETURN</th>
						</tr>
					</thead>
					<tbody id="returnbooklist">
						<c:forEach items="${userbooklist}" var="b">
							<!-- ���ļ��� -->
							<tr>
								<td>${b.u_id}</td>
								<td>${b.b_id}</td>
								<td class="hidden-xs">${b.start_date}</td>
								<td>${b.end_date}</td>
								<td class="hidden-xs">${b.renew_qt}</td>
								<td>${b.isreturn}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<input type="button" class="btn btn-default" value="�ݳ�Ȯ��"
					onclick="removeUserbook();">
			</div>
		</form>
	</fieldset>
</div>