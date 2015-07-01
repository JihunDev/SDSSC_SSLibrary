<%@page import="com.entity.User"%>
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
			f.action = 'modifyimpl.do';/* ���� ���� */
			f.method = 'POST';
			f.submit();
		};
	}			
}

function del(f) {
	var c = confirm('���� �Ͻðڽ��ϱ�?');
	var id = f.id.value;
	if (c == true) {
		f.action = 'del.do';/* ���� ���� */
		f.method = 'POST';
		f.submit();
		alert(id+"���� Ż��Ǽ̽��ϴ�.")
	};		
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
        <input type="hidden" name="oldimg" value="${userupdate.img}"><!-- ���� ����̹��� -->
		<input type="hidden" name="isadmin" value="${userupdate.isadmin}">
		<input type="hidden" name="id" value="${userupdate.id}">
                <div class="form-group">
                <input type="hidden" name="isadmin" value="n"><br> 
                  <input type="text" name="id" id="id" class="form-control" placeholder="ID"  value="${userupdate.id}" disabled="disabled">
                </div>
                <div class="form-group">
                <input type="text" name="pwd" id="pwd" class="form-control" placeholder="PWD">
                </div>
                <div class="form-group">
                <input type="text" name="pwdcheck" id="pwdcheck" class="form-control" placeholder="PWD CHECK">
                </div> 
                <div class="form-group">
                <input type="text" name="name" class="form-control" placeholder="NAME" value="${userupdate.name}">
                </div>
                <div class="form-group">
                <input type="text" name="phone" class="form-control" placeholder="PHONE"  value="${userupdate.phone}">
                </div>
                 <div class="form-group">
                 <input type="text" name="email" class="form-control" placeholder="EMAIL" value="${userupdate.email}">           
                </div>
                <div class="form-group">
                <label class="control-label" for="oldimg">���� ���� : <img class="img-circle" alt="Cinque Terre" width="30" height="30" src="img/user/${userupdate.img}"></label>
                </div>
                <div class="form-group">
                 <label class="control-label" for="img">IMG</label><input type="file" id="img" name="img"  class="file">
                </div>
                <div class="btn-group btn-group-justified">
				  <div class="btn-group">
				   <input type="button"  class="btn btn-primary" value="update" onclick="update(this.form);">
				  </div>
				  <div class="btn-group">
				  <input type="button"  class="btn btn-primary" value="delete" onclick="del(this.form);">
				  </div>
				</div>
				</div>
            	</form>
        		</div>
   		  </div>
    </div>
</div>                
</body>
</html>