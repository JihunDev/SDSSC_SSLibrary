<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
			f.action = 'm_modifyimpl.do';/* ���� ���� */
			f.method = 'POST';
			f.submit();
		};
	}			
}
</script>   
    
<div data-role="content">
	<form enctype="multipart/form-data">
		 <input type="hidden" name="oldimg" value="${userupdate.img}"><!-- ���� ����̹��� -->
		<input type="hidden" name="isadmin" value="${userupdate.isadmin}">
		<input type="hidden" name="id" value="${userupdate.id}">
		<input type="text" name="id" value="${userupdate.id}" placeholder="ID" disabled>
		<input type="text" name="pwd" value="${userupdate.pwd}" placeholder="PWD">
		<input type="text" name="pwdcheck" value="${userupdate.pwd}" placeholder="PWD CHECK">
		<input type="text" name="name" value="${userupdate.name}" placeholder="NAME">
		<input type="text" name="phone" value="${userupdate.phone}" placeholder="PHONE">
		<input type="text" name="email" value="${userupdate.email}" placeholder="EMAIL">
		<label>Old IMG</label><img style="border-radius: 120px;" width="80" src="img/user/${userupdate.img}">
	    <label>New IMG</label><input type="file" id="img" name="img">          
		<input type="button" value="update" onclick="update(this.form);">
	</form>
</div>
