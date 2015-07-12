<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
$(document).ready(function(){
	if("${adminseatloglist}" == "[]")
		$('#seatloglist_div').html("<tr><td colspan=6>��ϵ� ������ �����ϴ�.</td><tr>");
	
});
function searchseatlog(f){
	var issearch = f.issearch.value;
	var search = f.search.value;
	//alert(typeof(search));
	//alert(Number(search));
	if(search==null || search == ""){
		//alert("�˻�� �Է��ϼ���.");
		//f.search.focus();
		f.action = "adminseatloglist.do";
		f.method="POST";
		f.submit();
	}else{	
		if(issearch == "s_id" && isNaN(Number(search))==true){
			// �¼� �˻��Ҷ� ���ڰ� �ƴ� ���ڸ� �Է��ߴٸ�
			alert("�ùٸ� �¼� ID�� �Է��ϼ���.");
		}else{	
			// �ùٸ� �˻����� �Է��ߴٸ�
			f.action = "adminseatlogsearch.do";
			f.method="POST";
			f.submit();
		}
	}
}

</script>
<style>
#seatlogtable>thead>tr>th{
	background: #66c1bd;
	color:white;
	vertical-align: middle;
}
.seattableform {
	background: rgba(255, 255, 194, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
	margin-top: 40px;
	padding: 20px;
	border-radius: 10px 10px 10px 10px;
	
}
</style>

<div class="fieldsetform"> 
<div style="height:100px">	
	<table class="table" style="width:100%;min-width:300px;">
		<tr>
			<th><h1>Seated Log List</h1></th>
		</tr>
	</table>	
</div>

<form class="form-inline" style="float:right;dislplay:block;" >
    <div class="input-group">
    <span class="input-group-btn">
       <button class="btn btn-default btn-sm btncolor" style="width:50px;float:right;margin:0 2px;"  type="button" onclick="searchseatlog(this.form);">�˻�</button>
     	<input type="text" id="search" name="search" class="form-control input-sm"  style="width:35%;margin:0 2px;float:right;" placeholder="Search for ID">
       <select id="issearch" name="issearch" style="width:100px;float:right;margin:0 2px;"  class="form-control input-sm" >
			<option value="s_id">�¼���ȣ</option>
			<option value="u_id">�����ID</option>
		</select>
<!--     	<button class="btn btn-default btn-sm" style="width:70px;float:right;margin:0 2px;" type="button" onclick='location.href="seatmain.do"'>�¼� ��Ȳ</button> -->
     </span>
   </div>
</form>

<br><br>
<fieldset>
	<table width="700" class="table table-hover scroll table-striped" id="seatlogtable">
		<thead>
			<tr>
				<th>�̿��� ID</th>
				<th>�¼� ID</th>
				<th>���� ���� �ð�</th>
				<th class="hidden-xs">�ݳ� ���� �ð�</th>
				<th>�� �ݳ� �ð�</th>
				<th class="hidden-xs">����</th>
			</tr>
		</thead>
		<tbody id='seatloglist_div'>
			<c:forEach items="${adminseatloglist}" var='sl'>
					<td>${sl.u_id}</td>
					<td>${sl.s_id}</td>
					<td>${sl.start_date}</td>
					<td class="hidden-xs">${sl.end_date}</td>
					<td>${sl.real_date}</td>
					<td class="hidden-xs">${sl.renew_qt}</td>
				</tr>
			</c:forEach>
		</tbody>
		
	</table>
</fieldset>

     </form>  
    </div><!-- /input-group -->
     