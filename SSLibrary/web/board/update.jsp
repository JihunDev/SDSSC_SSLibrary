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
window.onload = function(){
	var sort = "${boardupdate.sort}";
	$("select[name='sort']").val(sort).attr("selected", "selected");
	//�Խ��ǿ� ������ ���� SelectBox �ɼ� ����		
}
</script>
<div class="fieldsetform">
<fieldset>
<legend align="center">board update</legend>
<form class="form-inline" enctype="multipart/form-data" >
	<div class="form-group">    
	<select class="form-control input-sm" name="sort">
		<option value="">����</option>
		<option value="notice">��������</option>
		<option value="free">�����Խ���</option>
	</select>
	<input type="text" class="form-control input-sm" name="title" value="${boardupdate.title}"><br><br>
	</div>
	<br>
	<div class="form-group">
	<textarea class="form-control" rows="10" cols="130" name="content" style="resize:none">${boardupdate.content}</textarea><br><br>
	</div>
	<br>
	<div class="form-group">
	<input type="file" class="btn btn-default" style="margin:0;" name="file_name"><br>
	<input type="hidden" name="id" value="${boardupdate.id}">
	</div>
	<div class="form-group">
	<input type="hidden" class="form-control" name="u_id" value="${id}"><span class="input-group-btn">
	<input type="button" class="btn btn-default" value="����" onclick="update(this.form)"></span>
	</div>
</form>	
</fieldset>
</div>