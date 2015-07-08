<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function update(f) {
	$('#updates').popup('open');
	$("#updatebutton").click(function() {
			f.action = 'm_boardmodifyimpl.do';
			f.method = 'POST';
			f.submit();
		});
	}
</script>

<form enctype="multipart/form-data">
	<c:if test="${boardupdate.sort == 'notice'}">
		<select name="sort">
			<option value="">����</option>
			<option value="notice" selected>��������</option>
			<option value="free">�����Խ���</option>
		</select>
	</c:if>
	<c:if test="${boardupdate.sort == 'free'}">
		<select name="sort">
			<option value="">����</option>
			<option value="notice">��������</option>
			<option value="free" selected>�����Խ���</option>
		</select>
	</c:if>
	<input type="text" name="title" value="${boardupdate.title}">
	<textarea rows="10" cols="90" name="content">${boardupdate.content}</textarea>
	<input type="file" name="file_name"><br>
	<input type="hidden" name="id" value="${boardupdate.id}">
	<input type="hidden" name="u_id" value="${id}">
	<input type="button" value="����" onclick="update(this.form)">
</form>	

<!-- popup -->
<div data-role="popup" id="updates">
	<div data-role="header">
		<h1>����</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>���� �Ͻðڽ��ϱ�?</h2>
		<button type="button" id="updatebutton">����</button>
	</div>
</div>
    