<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.booktablecolor>thead>tr>th {
	 background-color : #84b683; 
	 color: white;
}
</style>
<script>
	function makeHeight() {
		var section = document.querySelector("#main-conten");
		var center = document.querySelector("#center");
		var center_area = document.querySelector('#home_center');

		var mHeight = center_area.clientHeight + 80;
		/* ClientHeight�� �Ἥ ǥ ���̸�ŭ �ø��� ��. */
		if (mHeight < 850) {
			mHeight = 850;
		}
		center.style.height = mHeight + 'px';
		section.style.height = mHeight + 'px';
	};

	function displaybook(data) {
		var cont = Object.keys(data).length;
		var element = document.getElementById("lastbooklist");

		$('#book_result').empty();
		var output = '';
		output += '<fieldset><table id="lastbooklist" class="table table-striped booktablecolor">'
		output += '<thead><th>��� ��ȣ</th><th>���� ID</th><th>�뿩�� ID</th><th>�뿩 �ð�</th><th class="hidden-xs">�ݳ� ���� �ð�</th><th>�ݳ� �Ϸ� �ð�</th><th class="hidden-xs">����</th></thead>';
		output += '<tbody id="bookloglist">';
		if (cont == 0) {
			output += '<tr><td colspan=7>�˻� ����� �������� �ʽ��ϴ�.</td><tr>';
		} else {
			$(data).each(function(index, item) {

				with (item) {
					output += '<tr><td>' + id + '</td>';
					output += '<td>' + b_id + '</td>';
					output += '<td>' + u_id + '</td>';
					output += '<td>' + start_date + '</td>';
					output += '<td class="hidden-xs">' + end_date + '</td>';
					output += '<td>' + real_date + '</td>';
					output += '<td class="hidden-xs">' + renew_qt + '</td></tr>';

				}
			});
		}
		output += "</table></fieldset>"
		$('#book_result').html(output);
		var element2 = $("#bookloglist");
		if (element2.height() >= 500) {
			$('#lastbooklist').addClass("scroll");
		}

	}

	function getLogBook() {
		var whatsearch = $('#whatsearch').val();
		var searchname = $('#searchname').val();
		$.ajax({
			dataType : 'JSON',
			async : 'false', /* ȭ�鿡 �����Ѵ����� �������� ���� �Ѹ� ���̸� false  */
			data : {
				'whatsearch' : whatsearch,
				'name' : searchname
			}, /* �����ϱ� ���� �Ѹ� ���̸� true*/
			url : 'adminbooklogsearch.do',
			success : function(data) {
				displaybook(data);
			}
		});
	};	
	window.onload = function(){
	  	var backgroundColor_ = "#84b683";
	  	var color_ = "white";
	  	
	  	$('.theadcolor>thead>tr>th').css({backgroundColor:backgroundColor_, color:color_});
		$('.btncolor').css({backgroundColor:backgroundColor_, color:color_});
		
	}
</script>
<div id="home_center" class="fieldsetform">
	<div class="listtabletitle">	
		<table class="table" style="width:100%;min-width:300px;">
			<tr>
				<th><h1>Books Rental History</h1></th>
			</tr>
		</table>	
	</div>
	<form class="form-inline" style="float:right;">
	<div class="input-group">
<!-- 		<button class="btn btn-default btn-sm" type="submit" onclick='location.href="adminbookloglist.do"'>��ü ���</button> -->
	
		<select class="form-control input-sm" style="width:auto;" id="whatsearch">
			<option value="user">ȸ��</option>
			<option value="book">����</option>
		</select>
		<input type="text" id="searchname" name="searchname" class="form-control input-sm" style="width:150px;margin:0 2px 0 0;" placeholder="Search for...">
		<button class="btn btn-default btn-sm btncolor" style="width:auto;"  type="button" onclick="getLogBook();">�˻�</button>
	</span>
	</div>
	</form>
	<br><br>
	<div id="book_result">
		<fieldset>
			<table width="700" class="table table-striped scroll theadcolor">
				<thead>
					<tr>
						<th>��� ��ȣ</th>
						<th>���� ID</th>
						<th>�뿩�� ID</th>
						<th>�뿩 �ð�</th>
						<th class="hidden-xs">�ݳ� ���� �ð�</th>
						<th>�ݳ� �Ϸ� �ð�</th>
						<th class="hidden-xs">����</th>
				</thead>
				<tbody>
					<c:forEach items="${loglist}" var="b">
						<!-- ���ļ��� -->
						<tr>
							<td>${b.id}</td>
							<td>${b.b_id}</td>
							<td>${b.u_id}</td>
							<td>${b.start_date}</td>
							<td class="hidden-xs">${b.end_date}</td>
							<td>${b.real_date}</td>
							<td class="hidden-xs">${b.renew_qt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</fieldset>
	</div>
</div>
