<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

	function register(f) {
		if (f.sort.value == null || f.sort.value == "") {
			alert("ī�װ��� �����ϼ���");
			f.sort.focus();
		}
		else if (f.reg_number==0 && f.title.value == null || f.title.value == "") {
			alert("������ �Է��ϼ���");
			f.title.focus();

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
		//�Խ��ǿ� ������ ���� SelectBox �ɼ� ����		
}
</script>
<div class="fieldsetform">
<div class="logtabletitle">	
	<table class="table" style="width:100%;min-width:300px;">
		<tr>
			<th><h1> Board Register</h1></th>
		</tr>
	</table>	
</div>
<form class="form-inline" enctype="multipart/form-data" >

<input type="hidden" name="u_id" value="${id}">
<input type="hidden" name="reg_number" value="0">
<table style="width:100%;">
	<tbody style="vertical-align: middle;">
		<tr>
			<th width="100px"><h4>Category</h4></th>
			<td>
			<select class="form-control input-sm" id="sort" name="sort" style="width:150px;">
				<option value="">����</option>
				<option value="notice">��������</option>
				<option value="free">�����Խ���</option>
			</select>
			</td>
		</tr>
		<tr>
			<th><h4>Title</h4></th>
			<td>
				<input type="text" class="form-control" name="title" style="width:98%;" placeholder="������ �Է��ϼ���."><br>
			 </td>
		</tr>
		<tr>
			<th><h4>File</h4></th>
			<td>
				<input type="file" class="btn btn-default" style="margin:0;" name="file_name">
	  		</td>
		</tr>
	</tbody>
</table>
	
	
	
	<br>
	<h4>Content</h4>
	
	<textarea id="textarea_" class="form-control" rows="10" cols="126" name="content" style="resize:none"></textarea><br><br>
	<div style="text-align: center;" >
		<input type="button" class="btn btn-default btncolor" value="���" onclick="register(this.form)">
	</div>
</form>
</div>