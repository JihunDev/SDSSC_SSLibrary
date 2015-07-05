<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
tbody td {
	border-bottom: 1px solid #d6d6d6;
}

tbody th {
	border-bottom: 1px solid #d6d6d6;
}
</style>

<script>
function del(f) {/* delete�� ������ del�� */
	var c = confirm('���� �Ͻðڽ��ϱ�?');
		if (c == true) {
			f.action = 'm_boardremoveimpl.do';/* ���� ���� */
			f.method = 'POST';
			f.submit();
		};
	}

function register(f) {
	var c = confirm('����� ��� �Ͻðڽ��ϱ�?');
	if (c == true) {
		f.action = 'm_boardwriteimpl.do';
		f.method = 'POST';
		f.submit();
	}
	;
}

function update(f) {
	var reg_number = f.reg_number.value;
	var id = f.id.value;
	if(reg_number != 0 && $('#btn_'+id+'').val() == "����"){// ����� �����Ϸ��Ҷ�
		var content = f.old_content.value;
		$('#content_'+id+'').html("<textarea id='content_id' value='"+${reply.content}+"'></textarea>");
		$('#btn_'+id+'').val("�Ϸ�");	
		alert("Before : " + f.old_content.value);
	}else if(reg_number != 0 && $('#btn_'+id+'').val() == "�Ϸ�"){// ��ۼ����� �Ϸ��Ҷ�
		var c = confirm('����� ���� �Ͻðڽ��ϱ�?');
			if (c == true) {
				var content = $('#content_id').val();
				$('input[name="content"]').val(content);
				alert("After : " + f.content.value);
				
				f.action = 'm_boardmodifyimpl.do';
				f.method = 'POST';
				f.submit();
			};
	} else {
		var c = confirm('���� �Ͻðڽ��ϱ�?');
		if (c == true) {
			f.action = 'm_boardmodify.do';
			f.method = 'POST';
			f.submit();
		};
	}
}
</script>

<table>
	<tbody>
		<tr>
			<th>����</th>
			<td colspan="5">${boarddetail.title}</td>
		<tr>
			<th>�з�</th>
			<td>${boarddetail.sort}</td>
			<th>�۾���</th>
			<td>${boarddetail.u_id}</td>
			<th>��ȸ</th>
			<td>${boarddetail.counter}</td>
		</tr>
		<tr>
			<th>�ۼ���</th>
			<td colspan="5">${boarddetail.reg_date}</td>
		</tr>
		<tr>
			<th colspan="6">����</th>
		</tr>
		<tr>
			<td colspan="6">${boarddetail.content}</td>
		</tr>
	</tbody>
</table>
<form>
	<input type="hidden" name="sort" value="${boarddetail.sort}"> 
	<input type="hidden" name="id" value="${boarddetail.id}"> 
	<input type="hidden" name="reg_number" value="${boarddetail.reg_number}">
	<div class="ui-grid-b">
		<div class="ui-block-a">
			<input type="submit" onClick="update(this.form);" value="����">
		</div>
		<div class="ui-block-b">
			<input type="submit" onClick="del(this.form);" value="����">
		</div>
		<div class="ui-block-c">
			<a href="m_boardmain.do?sort=${boarddetail.sort}" data-role="button">���</a>
		</div>
	</div>
</form>

<div data-role="content">
	<ul data-role="listview">
		<c:forEach items="${boardreply}" var="reply">
				<li>
					<a href="#">						
						<h3>${reply.content}</h3>
						<p>${reply.u_id} | ${reply.reg_date}</p>
						<p class="ui-li-aside">
							<strong>��� ��ȣ : ${reply.id}</strong>
						</p>						
					</a>
				</li>
			<form>
				<input type="hidden" name="sort" value="${reply.sort}">
				<input type="hidden" name="id" value="${reply.id}">	
				<input type="hidden" name="reg_number" value="${reply.reg_number}">	
				<input type="hidden" name="old_content" value="${reply.content}">	
				<input type="hidden" name="u_id" value="${id}">
				<input type="hidden" name="content" >	
				<div id = "content_${reply.id}"></div>
				<div class="ui-grid-a">
					<div class="ui-block-a">
						<input type="button" value="����" onclick="del(this.form)">
					</div>
					<div class="ui-block-b">
						<input type="button" id="btn_${reply.id}" value="����" onclick="update(this.form)">
					</div>
				</div>
			</form>
		</c:forEach>
	</ul>
</div>

<!-- reply â -->	
<form>
	<input type="hidden" name="reg_number" id="reg_number" value="${boarddetail.id}">
	<input type="hidden" name="sort" value="${boarddetail.sort}">
	<input type="hidden" name="u_id" value="${user.id}">
	<label for="content">Comment:</label>
	<textarea rows="5" cols="40" name="content"></textarea>
	<input type="button" value="���" onclick="register(this.form)">
</form>	
