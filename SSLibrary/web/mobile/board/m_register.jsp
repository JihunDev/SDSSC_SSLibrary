<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
	function register(f) {
		if (f.sort.value == null || f.sort.value == "") {
			alert("ī�װ��� �����ϼ���");
			f.sort.focus();

		} else {
			var c = confirm('��� �Ͻðڽ��ϱ�?');
			if (c == true) {
				f.action = 'm_boardwriteimpl.do';
				f.method = 'POST';
				f.submit();
			};
		}
	}
	window.onload = function(){
		var sort = "${sort}";
		$("select[name='sort']").val(sort).attr("selected", "selected");
	}
</script>

<form class="form-inline" enctype="multipart/form-data" >
	<input type="hidden" name="u_id" value="${user.id}">
	<input type="hidden" name="reg_number" value="0">
	<select class="form-control input-sm" id="sort" name="sort">
		<option value="">����</option>
		<option value="notice">��������</option>
		<option value="free">�����Խ���</option>
	</select>
	<input type="text" class="form-control input-sm" name="title" placeholder="������ �Է��ϼ���.">
	<textarea class="form-control" rows="50" cols="90" name="content"></textarea>
	<input type="file" name="file_name">
	<br>
	<input type="button" class="btn btn-default" value="���" onclick="register(this.form)">
</form>
    