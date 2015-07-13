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
<div class="givemargin">
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
				<input type="hidden" name="id" value="${userupdate.id}">
                <div class="form-group">
			         	<c:choose>
					<c:when test="${userupdate.isadmin=='y'}"> 
						<select class="form-control" name="isadmin">
							<option value="y" selected>������</option>
							<option value="n">ȸ��</option>
							<option value="s">���� ȸ��</option>
						</select>
					</c:when>
					<c:when test="${userupdate.isadmin=='n'}"> 
						<select class="form-control" name="isadmin">
							<option value="y">������</option>
							<option value="n" selected>ȸ��</option>
							<option value="s">���� ȸ��</option>
						</select>
					</c:when>
					<c:when test="${userupdate.isadmin=='s'}"> 
						<select class="form-control" name="isadmin">
							<option value="y">������</option>
							<option value="n">ȸ��</option>
							<option value="s" selected>���� ȸ��</option>
						</select>
					</c:when>
					<c:when test="${userupdate.isadmin=='d'}"> 
   					<select class="form-control" name="isadmin">
					      <option value="y">������</option>
					      <option value="n">ȸ��</option>
					      <option value="s">���� ȸ��</option>
					      <option value="d" selected>Ż�� ȸ��</option>
				   </select>
					</c:when>
				</c:choose>  
				</div>
				<div class="form-group">
                <input type="text" name="id" id="id" class="form-control" placeholder="ID"  value="${userupdate.id}" disabled="disabled">
                </div>
                <div class="form-group">
                <input type="text" name="pwd" id="pwd" class="form-control" placeholder="PWD" value="${userupdate.pwd}">
                </div>
                <div class="form-group">
                <input type="text" name="pwdcheck" id="pwdcheck" class="form-control" placeholder="PWD CHECK" value="${userupdate.pwd}">
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
</div>