<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	function register(f) {
		if (f.sort.value == null || f.sort.value == "") {
			$('#sort').popup('open');
		} else {
			$('#registers').popup('open');
			$("#registerbutton").click(function() {
				window.setTimeout(function name() {
					f.action = 'm_boardwriteimpl.do';
					f.method = 'POST';
					f.submit();
				}, 1000);
			});
		}
	}
</script>

<form class="form-inline" enctype="multipart/form-data">
	<input type="hidden" name="u_id" value="${user.id}"> 
	<input type="hidden" name="reg_number" value="0"> 
	<select class="form-control input-sm" id="sort" name="sort">
		<option value="">����</option>
		<c:if test="${user.isadmin == 'y'}">
			<option value="notice">��������</option>
		</c:if>
		<option value="free" selected="selected">�����Խ���</option>
	</select> 
	<input type="text" class="form-control input-sm" name="title" placeholder="������ �Է��ϼ���.">
	<br>
	<textarea class="form-control" rows="50" cols="90" name="content"></textarea>
	<input type="file" name="file_name"> <br> <input
		type="button" class="btn btn-default" value="���"
		onclick="register(this.form)">
</form>

<!-- popup -->

<div data-role="popup" id="registers">
	<div data-role="header">
		<h1>���</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>��� �Ͻðڽ��ϱ�?</h2>
		<button type="button" id="registerbutton">���</button>
	</div>
</div>

<div data-role="popup" id="sort">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>ī�װ��� �����ϼ���</h2>
	</div>
</div>
