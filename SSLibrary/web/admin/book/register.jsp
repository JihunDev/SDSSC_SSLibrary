<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function register(f){
   var id = f.id.value;
   var name = f.name.value;
    var writer = f.writer.value;
    var img = f.img.value;
    var total_qt = f.total_qt.value;
    var floor = f.floor.value;
   if(id==""){
      alert('å ������ �������ּ���');
      return;
   };
   if(name == null || name == ''){
      alert('NAME�� �Է��ϼ���');
      f.name.focus();
      return;
   };
   if(writer == null || writer == ''){
      alert('WRITER�� �Է��ϼ���');
      f.writer.focus();
      return;
   };
   if(img == null || img == ''){
      alert('IMG�� �־��ּ���');
      return;
   };
   if(floor == '����'){
      alert('������ �������ּ���');
      return;
   };
    if(total_qt== null || total_qt == ''){
      alert('������ �Է��ϼ���');
      f.total_qt.focus();
      return;
   };
   
   var c = confirm('����Ͻðڽ��ϱ�?');
   if(c==true){
      f.action='bookregisterimpl.do';
      f.method = 'POST';
      f.submit();
   } 
};
</script>
<div class="givemargin">
<div class="centered-form">
 <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">Book Register</h3>
                    </div>
                        <div class="panel-body">
                     <form role="form" enctype="multipart/form-data">
                     <div class="col-md-12">
                            <div class="form-group">
                            <label class="control-label" for="id">CATEGORY</label>
                            <select class="form-control " name="id"><option value="">����</option><option value="i">IT</option><option value="n">�Ҽ�</option><option value="m">��ȭå</option></select>
                            </div>
                            <div class="form-group">
                                <input type="text" name="name" id="name" class="form-control" placeholder="NAME">
                            </div>
                            <div class="form-group">
                                <input type="text" name="writer" id="writer" class="form-control" placeholder="WRITER">
                            </div> 
                            <div class="form-group">
                             <label class="control-label" for="img">IMG</label><input type="file" id="img" name="img"  class="file">
                            </div>
                            <div class="form-group">
                           <label class="control-label" for="floor">FLOOR</label><select class="form-control" name="floor"><option>����</option><option>1��</option><option>2��</option><option>3��</option><option>4��</option></select>
                            </div>
                             <div class="form-group">
                                <input type="text" name="total_qt" class="form-control" placeholder="TOTAL_QT">
                            </div>
                            <input type="button" class="btn btn-primary btn-block" value="register" onclick="register(this.form);">
                           </div>
                           </form>
                          </div>
                            </div>
                </div>
            </div>       
            </div>         