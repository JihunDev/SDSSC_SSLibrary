<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function update(f) {
	var c = confirm('�����Ͻðڽ��ϱ�?');
		if (c == true) {
			f.action = 'boardmodifyimpl.do';
			f.method = 'POST';
			f.submit();
		};
	}
</script>

<h1>board update</h1>
<form enctype="multipart/form-data" >

	<select name="sort">
		<option value="">����</option>
		<option value="notice">��������</option>
		<option value="free">�����Խ���</option>
	</select>
	
	<input type="text" name="title" value="${boardupdate.title}"><br>
	<textarea rows="20" cols="40" name="content">${boardupdate.content}</textarea><br>
	<input type="file" name="file_name"><br> 
	<input type="text" name="u_id" value="${id}">
	<input type="hidden" name="id" value="${boardupdate.id}">
	
	<input type="button" value="����" onclick="update(this.form)"><!-- ���� ���� -->
</form>	
