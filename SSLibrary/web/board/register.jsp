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
</script>
<h1>board register</h1>
<form enctype="multipart/form-data" >
<input type="hidden" name="u_id" value="${id}">
<input type="hidden" name="reg_number" value="0">
	<select name="sort">
		<option value="">����</option>
		<option value="notice">��������</option>
		<option value="free">�����Խ���</option>
	</select>
	<input type="text" name="title" placeholder="������ �Է��ϼ���."><br>
	<textarea rows="20" cols="40" name="content"></textarea><br>
	<input type="file" name="file_name"><br> 
	<input type="button" value="���" onclick="register(this.form)">
</form>
