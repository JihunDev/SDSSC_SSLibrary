<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
function displayuserinfo(data) {	
	if(data != null){
	   var output = '';	  
	   output += '<table class="table table-hover" width="700">';
	   output += '<tr><td rowspan="9"><img width="300px" src="img/user/'+ data.img+'"></td>';
	   output += '<tr><th>�¼� ID</th><td>' + data.s_id + '</td></tr>';
	   output += '<tr><th>����� ID</th><td>' + data.u_id + '</td></tr>';
	   output += '<tr><th>�̸�</th><td>' + data.name + '</td></tr>';
	   output += '<tr><th>TEL</th><td>' + data.phone+ '</td></tr>';
	   output += '<tr><th>e-mail</th><td>' + data.email + '</td></tr>';
	   output += '<tr><th>��� �ð�</th><td>' + data.start_time + '</td></tr>';
	   output += '<tr><th>���� ���� �ð�</th><td>' + data.end_time + '</td></tr>';
	   output += '<tr><th>���� Ƚ ��</th><td>' + data.renew_qt + '</td></tr>';	   
	   output += '</table>';	   
	   $('#userinfo').html(output);
	}
}
</script>
<div id="userinfo">
</div>