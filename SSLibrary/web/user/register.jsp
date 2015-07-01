<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
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
		if (c == true) {
			f.action = 'registerimpl.do';
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
<style></style>
</head>
<body>
<div class="row centered-form">
 <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title text-center">ȸ������</h3>
        </div>
            <div class="panel-body">
         <form class="form-horiziontal" role="form" enctype="multipart/form-data">
        <div class="col-md-12">
                <div class="form-group">
                <input type="hidden" name="isadmin" value="n"><br> 
                  <div class="input-group">
                  <input type="text" name="id" id="id" class="form-control" placeholder="ID"><span class="input-group-btn"><input type="button" class="btn btn-primary" value="�ߺ�üũ" onclick="idcheck(this.form);"></span>
                  </div>
                </div>
                <div class="form-group">
                <input type="text" name="pwd" id="pwd" class="form-control" placeholder="PWD">
                </div>
                <div class="form-group">
                <input type="text" name="pwdcheck" id="pwdcheck" class="form-control" placeholder="PWD CHECK">
                </div> 
                <div class="form-group">
                <input type="text" name="name" class="form-control" placeholder="NAME">
                </div>
                <div class="form-group">
                <input type="text" name="phone" class="form-control" placeholder="PHONE">
                </div>
                 <div class="form-group">
                 <input type="text" name="email" class="form-control" placeholder="EMAIL">           
                </div>
                <div class="form-group">
                 <label class="control-label" for="img">IMG</label><input type="file" id="img" name="img"  class="file">
                </div>
               	<input type="button" class="btn btn-primary btn-block" value="register" onclick="register(this.form);">
            	</div>
            	</form>
        		</div>
   		  </div>
    </div>
</div>                

</body>
</html>