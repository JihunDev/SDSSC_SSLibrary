<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
function update(f) {
	var id = f.id.value;
	var pwd = f.pwd.value;
	var pwdcheck = f.pwdcheck.value;
	var name = f.name.value;
	
	if(pwd == null || pwd == ''){
		$('#pwdpopup').popup('open');
	}else if(pwd != pwdcheck){
		$('#pwdchepopup').popup('open');
	}else if((pwd.length < 8 || pwd.length > 16) || (pwdcheck.length < 8 || pwdcheck.length > 16)){
		$('#pwdnumberpopup').popup('open');	
	}else{
		$('#userupdateuser').popup('open');
		$("#updatebutton").click(function() {
			f.action = 'm_modifyimpl.do';/* ���� ���� */
			f.method = 'POST';
			f.submit();
		});
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

<div data-role="popup" id="userupdateuser">
	<div data-role="header">
		<h1>ȸ������</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>��� �Ͻðڽ��ϱ�?</h2>
		<button type="button" id="updatebutton">���</button>
	</div>
</div>

