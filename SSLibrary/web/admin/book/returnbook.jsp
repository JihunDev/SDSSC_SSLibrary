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
<div class="logtabletitle">	
	<table class="table" style="width:100%;min-width:300px;">
		<tr>
			<th><h1>Returning Books Approval</h1></th>
		</tr>
	</table>	
</div>
				<div style="text-align:right;margin:2px;">
					<input type="button" class="btn btncolor btn-default"  value="�ݳ� ����" onclick="removeUserbook();">
				</div>
	<fieldset>
		<form>
			<div>
				<table width="700" id="listtable" class="table table-striped theadcolor">
					<thead>
						<tr>
							<th>�ݳ���</th>
							<th>���� ��� ��ȣ</th>
							<th class="hidden-xs">�뿩 �ð�</th>
							<th>�ݳ� �����ð�</th>
							<th class="hidden-xs">����</th>
<!-- 							<th width="100px">�ݳ� ����</th> -->
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
<%-- 								<td>${b.isreturn}</td> --%>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</form>
	</fieldset>
</div>