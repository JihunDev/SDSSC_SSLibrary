<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script>
function register(f) {
	var id = f.id.value;
	var pwd = f.pwd.value;
	var pwdcheck = f.pwdcheck.value;
	var name = f.name.value;
	if(id == null || id == ''){
		alert("ID�� �Է��ϼ���.");
	}else if(pwd == null || pwd == ''){
		alert("PWD�� �Է��ϼ���.");
	}else if(pwdcheck == null || pwdcheck ==''){
		alert("��й�ȣ Ȯ���� �Է¹ٶ��ϴ�");
	}else if(pwd != pwdcheck){
		alert("��й�ȣ�� ���� �ʽ��ϴ�.");
	}else if((pwd.length < 8) || (pwd.length > 16) || 
			(pwdcheck.length < 8) || (pwdcheck.length > 16)){
		alert("��й�ȣ�� 8�ڸ� �̻� 16�ڸ� ���Ϸ� ����Ͻñ� �ٶ��ϴ�.");	
	}else if(name == null || name == ''){
		alert("NAME�� �Է��ϼ���.");
	}else{
		var c = confirm('��� �Ͻðڽ��ϱ�?');
		if (c == true) {http://localhost/SSLibrary/m_register.do
			f.action = 'm_registerimpl.do';
			f.method = 'POST';
			f.submit();
		};
	}			
}

function display(data) {
	if(data=="1"){
		alert("��밡��");
	}else{
		alert("���Ұ���");
	}
}

function idcheck(g) {
	var id = g.id.value;
	$.ajax({
		type : 'POST',
		async : 'false',
		url : 'idcheck.do',
		data : {'id' : id},
		success : function(data){
			display(data);
		},
		error : function(data) {
	        alert("�����߻�"+data);
      }
	});
}
</script>
<div data-role="content">
	<form enctype="multipart/form-data">
		<input type="hidden" name="isadmin" value="n"><br> 
		<input type="text" name="id" placeholder="ID">
		<input type="button" class="ui-btn ui-mini" value="�ߺ�Ȯ��" onclick="idcheck(this.form)"><br>
		<input type="text" name="pwd" placeholder="PWD">
		<input type="text" name="pwdcheck" placeholder="PWD CHECK">
		<input type="text" name="name" placeholder="NAME">
		<input type="text" name="phone" placeholder="PHONE">
		<input type="text" name="email" placeholder="EMAIL">
		<input type="file" name="img" >           
		<input type="button" class="btn btn-primary btn-block" value="register" onclick="register(this.form)">
	</form>
</div>
