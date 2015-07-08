<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(document).ready(function(){
	var borrowbook = "${borrowbook}";
	alert(borrowbook);
	if(borrowbook==1){
		$('#borrowbook1').popup('open');
	}else if(borrowbook==2){
		$('#borrowbook2').popup('open');	
	}else if(borrowbook==3){
		$('#borrowbook3').popup('open');
	}		
});

function rentbook(){
	var  bookid = "${bookdetail.id}";
	$('#rentbook').popup('open');
	$("#rentbookbutton").click(function() {
		location.href ='m_userbookregister.do?id='+bookid;
	});			
}
</script>
<button type="button" class="btn btn-default" onclick="rentbook();">�뿩</button>
<!-- ������ ������ -->
<table width="100%">
	<tbody>
		<tr>
			<th>ID</th>
			<td>${bookdetail.id}</td>
		</tr>
		<tr>
			<th>å����</th>
			<td>${bookdetail.name}</td>
		</tr>
		<tr>
			<th>����</th>
			<td>${bookdetail.writer}</td>
		</tr>
		<tr>
			<th>�ڷ��</th>
			<td>${bookdetail.floor}</td>
		</tr>
		<tr>
			<th>��������</th>
			<td>${bookdetail.total_qt}</td>
		</tr>
		<tr>
			<th>�뿩���ɰ���</th>
			<td>${bookdetail.current_qt}</td>
		</tr>
		<tr>
			<th>�����</th>
			<td>${bookdetail.reg_date}</td>
		</tr>
	</tbody>
</table>


<!-- popup -->
<div data-role="popup" id="borrowbook1">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>�̹� ���� å�Դϴ�.</h2>
	</div>
</div>

<div data-role="popup" id="borrowbook2">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>���� ������ 0���Դϴ�. �뿩�� �Ұ��� �մϴ�.</h2>
	</div>
</div>

<div data-role="popup" id="borrowbook3">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>�뿩�� �Ϸ�Ǿ����ϴ�.</h2>
	</div>
</div>

<div data-role="popup" id="rentbook">
	<div data-role="header">
		<h1>�뿩 Ȯ��</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>�뿩 �Ͻðڽ��ϱ�?</h2>
		<button type="button" id="rentbookbutton">Ȯ��</button>
	</div>
</div>