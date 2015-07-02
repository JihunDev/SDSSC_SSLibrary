<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function del(f) {/* delete�� ������ del�� */
	var c = confirm('���� �Ͻðڽ��ϱ�?');
		if (c == true) {
			f.action = 'boardremoveimpl.do';/* ���� ���� */
			f.method = 'POST';
			f.submit();
		};
	}
function update(f) {
	var reg_number = f.reg_number.value;
	var id = f.id.value;
	//alert(reg_number);
	if(reg_number != 0 && $('#btn_'+id+'').val() == "����"){// ����� �����Ϸ��Ҷ�
		var content = f.old_content.value;
		$('#content_'+id+'').html("<input type='text' id='content_id' value='"+content+"'>");
		$('#btn_'+id+'').val("�Ϸ�");	
		alert("Before : " + f.old_content.value);
		
	}else if(reg_number != 0 && $('#btn_'+id+'').val() == "�Ϸ�"){// ��ۼ����� �Ϸ��Ҷ�

		var c = confirm('����� ���� �Ͻðڽ��ϱ�?');
		if (c == true) {
			var content = $('#content_id').val();
			$('input[name="content"]').val(content);
			alert("After : " + f.content.value);
			
			f.action = 'boardmodifyimpl.do';
			f.method = 'POST';
			f.submit();
//			$('#content_'+id+'').html(content);
//			$('#btn_'+id+'').val("����");	

			
		};
	

	} else {
			var c = confirm('���� �Ͻðڽ��ϱ�?');
			if (c == true) {
				f.action = 'boardmodify.do';/* ���� ���� */
				f.method = 'POST';
				f.submit();
			};
	}
}

	function register(f) {
		var c = confirm('����� ��� �Ͻðڽ��ϱ�?');
		if (c == true) {
			f.action = 'boardwriteimpl.do';/* ���� ���� */
			f.method = 'POST';
			f.submit();
		}
		;
	}
</script>
<h1>board detail</h1>

	<table border="1">
	<tbody>
		<tr>
			<th>����</th>
			<td colspan="3">${boarddetail.title}</td>
			<th>�۾���</th>
			<td>${boarddetail.u_id}</td>
		</tr>
		<tr>
			<th>�з�</th>
			<td>${boarddetail.sort}</td>
			<th>�۾���¥</th>
			<td>${boarddetail.reg_date}</td>
			<th>��ȸ</th>
			<td>${boarddetail.counter}</td>
		</tr>
		<tr>	
			<td colspan="6">
				${boarddetail.content}
			</td>
		</tr>
	</tbody>
	
	</table>
<form>
	<input type="hidden" name="sort" value="${boarddetail.sort}">
	<input type="hidden" name="id" value="${boarddetail.id}">
	<input type="hidden" name="reg_number" value="${boarddetail.reg_number}">	
	<c:if test="${id == boarddetail.u_id}">
		<input type="button" value="����" onclick="del(this.form)">
		<input type="button" value="����" onclick="update(this.form)">
	</c:if>
</form>
	<table border=1>
		<c:forEach items="${boardreply}" var="reply">
		<form>
			<input type="hidden" name="sort" value="${reply.sort}">
			<input type="hidden" name="id" value="${reply.id}">	
			<input type="hidden" name="reg_number" value="${reply.reg_number}">	
			<input type="hidden" name="old_content" value="${reply.content}">	
			<input type="hidden" name="u_id" value="${id}"><br>
			<input type="hidden" name="content" >	
			<tr>
				<th>��Ϲ�ȣ</th><td>${reply.id}</td>
				<th>�ð�</th><td>${reply.reg_date}</td>
				<td><c:if test="${id == reply.u_id}">
	
				<input type="button" value="����" onclick="del(this.form)">
				</c:if></td>
			</tr>
			<tr>			
				<th>�۾���</th><td>${reply.u_id}</td>
				<th>����</th>
				<td id = "content_${reply.id}">${reply.content}</td>
				<td><c:if test="${id == reply.u_id}"><input type="button" id="btn_${reply.id}" value="����" onclick="update(this.form)"></c:if></td>
			</tr>
		</form>
		</c:forEach>
	</table>
	<form>
	<div>
		<input type="hidden" name="reg_number" id="reg_number" value="${boarddetail.id}"><br>
		<input type="hidden" name="sort" value="${boarddetail.sort}"><br>
		<input type="hidden" name="u_id" value="${id}"><br>
		<textarea rows="5" cols="40" name="content"></textarea>
		<input type="button" value="���" onclick="register(this.form)">
	</div>
</form>	
