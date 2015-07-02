<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function update(f) {
	var id = f.id.value;
	var pwd = f.pwd.value;
	var pwdcheck = f.pwdcheck.value;
	var name = f.name.value;
	
	if(pwd == null || pwd == ''){
		alert("PWD�� �Է��ϼ���.");
	}else if(pwd != pwdcheck){
		alert("��й�ȣ�� ���� �ʽ��ϴ�.");
	}else if((pwd.length < 8 || pwd.length > 16) || (pwdcheck.length < 8 || pwdcheck.length > 16)){
		alert("��й�ȣ�� 8�ڸ� �̻� 16�ڸ� ���Ϸ� ����Ͻñ� �ٶ��ϴ�.");	
	}else{
		var c = confirm('���� �Ͻðڽ��ϱ�?');
		if (c == true) {
			f.action = 'usermodifyimpl.do';/* ���� ���� */
			f.method = 'POST';
			f.submit();
		};
	}			
}
</script>
<h1>ȸ������</h1>
<form enctype="multipart/form-data">
	<c:choose>
		<c:when test="${userupdate.isadmin=='y'}"> 
			<select name="isadmin">
				<option value="y" selected>������</option>
				<option value="n">ȸ��</option>
				<option value="s">���� ȸ��</option>
			</select>
		</c:when>
		<c:when test="${userupdate.isadmin=='n'}"> 
			<select name="isadmin">
				<option value="y">������</option>
				<option value="n" selected>ȸ��</option>
				<option value="s">���� ȸ��</option>
			</select>
		</c:when>
		<c:when test="${userupdate.isadmin=='s'}"> 
			<select name="isadmin">
				<option value="y">������</option>
				<option value="n">ȸ��</option>
				<option value="s" selected>���� ȸ��</option>
			</select>
		</c:when>
	</c:choose>
	<input type="hidden" name="oldimg" value="${userupdate.img}"><br><!-- ���� ����̹��� -->
	<input type="hidden" name="id" value="${userupdate.id}"><br>
	<input type="text" name="id" id="id" value="${userupdate.id}" disabled="disabled"><br>
	<input type="text" name="pwd" id="pwd" value="${userupdate.pwd}"><br>
	<input type="text" name="pwdcheck" id="pwdcheck" value="${userupdate.pwd}"><br>
	<input type="text" name="name" value="${userupdate.name}"><br>
	<input type="text" name="phone" value="${userupdate.phone}"><br>
	<input type="text" name="email" value="${userupdate.email}"><br>
	<h5>���� ���� ${userupdate.img}</h5>
	<input type="file" name="img"><br><!-- ���ο� ����̹��� -->
	<input type="button" value="update" onclick="update(this.form);">
</form>