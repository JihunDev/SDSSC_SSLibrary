<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<script>
function makeHeight() {
	var section = document.querySelector("#section");
	var left = document.querySelector("#left");
	var center = document.querySelector("#center");
	var center_area = document.querySelector('#home_center');
	 
	var mHeight = center_area.clientHeight+80;
	/* ClientHeight�� �Ἥ ǥ ���̸�ŭ �ø��� ��. */
	if (mHeight < 400) {
		mHeight = 400;
	}
	center.style.height = mHeight + 'px';
	section.style.height = mHeight + 'px';
	left.style.height = mHeight + 'px';
};

function displaybook(data) {
	$('#book_result').empty();
	var output = '';
	output+='<table  class="table table-hover">'
	output+='<thead><tr><th >ID</th><th >B_ID</th><th>U_ID</th><th>START_DATE</th><th>END_DATE</th><th>REAL_DATE</th><th>RENEW_QT</th></thead>';
	$(data).each(function(index, item) {
		with (item) {
			output += '<tr><td>'+id+'</td>';
			output += '<td>'+b_id+'</td>';
			output += '<td>'+u_id+'</td>';
			output += '<td>'+start_date+'"></td>';
			output += '<td>'+end_date+'</td>';
			output += '<td>'+real_date+'</td>';
			output += '<td>'+renew_qt+'</td></tr>';
		}
	});
	output+="</table>"
	$('#book_result').html(output);
	makeHeight();

}


function getLogBook() {
	var whatsearch = $('#whatsearch').val();
	  var searchname = $('#searchname').val();
	$.ajax({
		dataType : 'JSON',
		async:'false', /* ȭ�鿡 �����Ѵ����� �������� ���� �Ѹ� ���̸� false  */
		data:{'whatsearch': whatsearch,
			  'name' : searchname},				/* �����ϱ� ���� �Ѹ� ���̸� true*/
		url : 'adminbooklogsearch.do',
		success:function(data){
			displaybook(data);
			makeHeight();
		}
	});
};
</script>
<div id="home_center" class="fieldsetform">
<form class="form-inline">
	<select class="form-control input-sm" id="whatsearch">
		<option value="user">ȸ��</option>
		<option value="book">����</option>
	</select>
	 <div class="input-group">
	<input type="text" id="searchname" name="searchname" class="form-control input-sm" placeholder="Search for...">
     <span class="input-group-btn">
     <button class="btn btn-default btn-sm" type="button" onclick="getLogBook();">�˻�</button></span></div>
</form>
<div id="book_result">
<fieldset>
<legend align="center">���� ���� �뿩 ����</legend>
<table width="700" class="table table-hover">
<thead><tr><th >ID</th><th >B_ID</th><th>U_ID</th><th>START_DATE</th><th>END_DATE</th><th>REAL_DATE</th><th>RENEW_QT</th></thead>
<tbody>
<c:forEach items="${loglist}" var="b"> <!-- ���ļ��� -->
<tr>
<td>${b.id}</td>
<td>${b.b_id}</td>
<td>${b.u_id}</td>
<td>${b.start_date}</td>
<td>${b.end_date}</td>
<td>${b.real_date}</td>
<td>${b.renew_qt}</td>
</tr>
</c:forEach>
</tbody>
</table>
</fieldset>
</div>
</div>
