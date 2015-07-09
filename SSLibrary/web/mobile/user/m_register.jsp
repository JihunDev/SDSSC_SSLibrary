<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script>
function register(f) {
	var id = f.id.value;
	var pwd = f.pwd.value;
	var pwdcheck = f.pwdcheck.value;
	var name = f.name.value;
	if(id == null || id == ''){
		$('#idpopup').popup('open');
	}else if(pwd == null || pwd == ''){
		$('#pwdpopup').popup('open');
	}else if(pwdcheck == null || pwdcheck ==''){
		$('#pwdcheckpopup').popup('open');
	}else if(pwd != pwdcheck){
		$('#pwdchepopup').popup('open');
	}else if((pwd.length < 8) || (pwd.length > 16) || 
			(pwdcheck.length < 8) || (pwdcheck.length > 16)){
		$('#pwdnumberpopup').popup('open');	
	}else if(name == null || name == ''){
		$('#pwdnamepopup').popup('open');	
	}else{
		$('#registeruser').popup('open');
		$("#regsterbutton").click(function() {
			f.action = 'm_registerimpl.do';
			f.method = 'POST';
			f.submit();
		});
	}			
}

function display(data) {
	if(data=="1"){
		$('#idcheckokpopup').popup('open');	
	}else{
		$('#idcheckfailpopup').popup('open');	
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

<!-- popup -->

<div data-role="popup" id="idpopup">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>ID�� �Է��ϼ���.</h2>
	</div>
</div>

<div data-role="popup" id="pwdpopup">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>PWD�� �Է��ϼ���.</h2>
	</div>
</div>

<div data-role="popup" id="pwdcheckpopup">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>��й�ȣ Ȯ���� �Է¹ٶ��ϴ�</h2>
	</div>
</div>

<div data-role="popup" id="pwdchepopup">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>��й�ȣ�� ���� �ʽ��ϴ�.</h2>
	</div>
</div>

<div data-role="popup" id="pwdnumberpopup">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>��й�ȣ�� 8�ڸ� �̻� 16�ڸ� ���Ϸ� ����Ͻñ� �ٶ��ϴ�.</h2>
	</div>
</div>

<div data-role="popup" id="pwdnamepopup">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>NAME�� �Է��ϼ���.</h2>
	</div>
</div>

<div data-role="popup" id="idcheckokpopup">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>��밡��</h2>
	</div>
</div>

<div data-role="popup" id="idcheckfailpopup">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>���Ұ���</h2>
	</div>
</div>


<div data-role="popup" id="registeruser">
	<div data-role="header">
		<h1>ȸ������</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>��� �Ͻðڽ��ϱ�?</h2>
		<button type="button" id="regsterbutton">���</button>
	</div>
</div>








