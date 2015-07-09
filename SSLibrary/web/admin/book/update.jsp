<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function update(f){
	var total_qt =  f.total_qt.value; //���Ӱ� �޾ƿ� ������ å ��ü ��
	var originaltotal_qt = ${bookinfo.total_qt}; //���� å ��ü ��
	var current_qt =f.current_qt.value; //���� å ���� �뿩 ���� ��
	
	var result = 0;
	
	if(total_qt>originaltotal_qt){//�������� �� Ŭ ��
		result = (total_qt-originaltotal_qt) + Number(current_qt);

			$('input[name=current_qt]').val(result);		
		
	}else if(total_qt<originaltotal_qt){//���� ���� �� ���� ��
		if(current_qt!=0 && (originaltotal_qt-total_qt)<=current_qt){
		result =current_qt-(originaltotal_qt-total_qt);
			$('input[name=current_qt]').val(result);		
		}else if(current_qt!=0 && (originaltotal_qt-total_qt)>current_qt){
			alert('���� å���� �� ���� ������ ���� �� �����ϴ�.');
			 f.total_qt.focus();
		      return;
			
		}else{
		
			alert('���� ��� å�� �뿩 ���̾ ������ ���� �� �����ϴ�.');
			 f.total_qt.focus();
		      return;
		}
	}

	if((total_qt>99999)){
		alert('�ִ� ���� �� �ִ� ������ 99999�� �Դϴ�.');
		 f.total_qt.focus();
	      return;	
	}
	var c = confirm('�����Ͻðڽ��ϱ�?'); 
	if(c==true){
		f.action='bookmodifyimpl.do';
		f.method = 'POST';
		f.submit();
	} 
};
</script>
<div class="row centered-form">
 <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">Book Update</h3>
                    </div>
                        <div class="panel-body">
                     <form name="updatebook" role="form" enctype="multipart/form-data">
                     <div class="col-md-12">
                            <div class="form-group">
                            <input type ="hidden" name="id" value="${bookinfo.id}">
							<input type ="hidden" name="oldimg" value="${bookinfo.img}">
							<input type ="hidden" name="current_qt" value="${bookinfo.current_qt}">
                           
                            <label class="control-label" for="id">ID</label>
                            <input type="text" name="id" class="form-control" placeholder="ID" value="${bookinfo.id}" disabled>
                            </div>
                            <div class="form-group">
                             <label class="control-label" for="name">NAME</label>
                                <input type="text" name="name" id="name" class="form-control" placeholder="NAME" value="${bookinfo.name}">
                            </div>
                            <div class="form-group">
                            <label class="control-label" for="writer">WRITER</label>
                                <input type="text" name="writer" id="writer" class="form-control" placeholder="WRITER" value="${bookinfo.writer}">
                            </div> 
                            <div class="form-group">
                             <label class="control-label" for="oldimg">�������� : <img height="30" src="img/book/${bookinfo.img}"></label>
                            </div>
                            <div class="form-group">
                             <label class="control-label" for="img">IMG</label><input type="file" id="img" name="img"  class="file">
                            </div>
                            <div class="form-group">
                           <label class="control-label" for="floor">FLOOR</label>
                           <c:choose>
								<c:when test="${bookinfo.floor=='1��'}"> 
								<select name="floor" class="form-control">
								<option>����</option>
								<option value="1��" selected>1��</option>
								<option value="2��">2��</option>
								<option value="3��">3��</option>
								<option value="4��">4��</option>
								</select> 
								</c:when> 
								<c:when test="${bookinfo.floor=='2��'}">
								<select name="floor" class="form-control">
								<option>����</option>
								<option value="1��" >1��</option>
								<option value="2��" selected>2��</option>
								<option value="3��">3��</option>
								<option value="4��">4��</option>
								</select> 
								</c:when>
								<c:when test="${bookinfo.floor=='3��'}">
								<select name="floor" class="form-control">
								<option>����</option>
								<option value="1��" >1��</option>
								<option value="2��">2��</option>
								<option value="3��" selected>3��</option>
								<option value="4��">4��</option>
								</select> 
								</c:when>
								<c:otherwise>
								<select name="floor" class="form-control">
								<option>����</option>
								<option value="1��" >1��</option>
								<option value="2��">2��</option>
								<option value="3��" >3��</option>
								<option value="4��" selected>4��</option>
								</select> 
								</c:otherwise>
								</c:choose>  
                            </div>
                             <div class="form-group">
                                <input type="text" name="total_qt" id="total_qt" class="form-control" placeholder="TOTAL_QT" value="${bookinfo.total_qt}">
                            </div>
                            <input type="button" class="btn btn-primary btn-block" value="����" onclick="update(this.form);">
                        	</div>
                        	</form>
                    		</div>
                    		  </div>
                </div>
            </div>                