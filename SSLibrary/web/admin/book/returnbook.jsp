<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function removeUserbook(){
	var c = confirm('�ݳ� Ȯ���Ͻðڽ��ϱ�?');
	if (c == true) {
		location.href = "userbookremoveimpl.do";
		alert("�ݳ� Ȯ���� �Ϸ�Ǿ����ϴ�.");
	};		
	
}
</script>
<div class="fieldsetform">
<fieldset>
<legend align="center">�ǽð� �ݳ� ���� ����</legend>
<form>
<div>
<table width="700" class="table table-hover">
<thead><tr><th>U_ID</th><th >B_ID</th><th >START_DATE</th><th>END_DATE</th><th>RENEW_QT</th>
<th>ISRETURN</th></tr></thead>
<tbody>
<c:forEach items="${userbooklist}" var="b"> <!-- ���ļ��� -->
<tr>
<td>${b.u_id}</td>
<td>${b.b_id}</td>
<td>${b.start_date}</td>
<td>${b.end_date}</td>
<td>${b.renew_qt}</td>
<td>${b.isreturn}</td>
</tr>
</c:forEach>
</tbody>
</table>
<input type="button" class="btn btn-default" value="�ݳ�Ȯ��" onclick="removeUserbook();">
</div>
</form>
</fieldset>
</div>