<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

	function register(f) {
		if (f.sort.value == null || f.sort.value == "") {
			alert("ī�װ��� �����ϼ���");
			f.sort.focus();

		} else {
			var c = confirm('��� �Ͻðڽ��ϱ�?');
			if (c == true) {
				f.action = 'boardwriteimpl.do';
				f.method = 'POST';
				f.submit();
			};
		}
	}
	window.onload = function(){
		var sort = "${sort}";
		$("select[name='sort']").val(sort).attr("selected", "selected");
		makeHeight();
		//�Խ��ǿ� ������ ���� SelectBox �ɼ� ����		
	}
</script>
<div class="fieldsetform">
<fieldset>
<legend align="center">Board Register</legend>
<form class="form-inline" enctype="multipart/form-data" >

<input type="hidden" name="u_id" value="${id}">
<input type="hidden" name="reg_number" value="0">
	<select class="form-control input-sm" id="sort" name="sort">
		<option value="">����</option>
		<option value="notice">��������</option>
		<option value="free">�����Խ���</option>
	</select>
	<input type="text" class="form-control input-sm" name="title" placeholder="������ �Է��ϼ���."><br>
	<br>
	<textarea class="form-control" rows="10" cols="90" name="content" style="resize:none"></textarea><br><br>
	<input type="file" name="file_name"><br>
	<input type="button" class="btn btn-default" value="���" onclick="register(this.form)">
</form>
</fieldset>
</div>