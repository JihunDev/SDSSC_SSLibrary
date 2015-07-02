<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%User user = (User)session.getAttribute("user");%>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
$(document).ready(function(){
	makeHeight();
	var borrowbook = $('#borrowbook').val();
	if(borrowbook==1){
		alert("�̹� ���� å�Դϴ�.")	
	}else if(borrowbook==2){
		alert("���� ������ 0���Դϴ�. �뿩�� �Ұ��� �մϴ�.")	
	}else if(borrowbook==3){
		alert("�뿩�� �Ϸ�Ǿ����ϴ�.");
	}		
});

function rentbook(){
	var  bookid = $('#bookid').val();
	var c = confirm('�뿩�Ͻðڽ��ϱ�?');
	if (c == true) {
		location.href ='userbookregister.do?id='+bookid;
	};			
}
function deletebook(){
	var  bookid = $('#bookid').val();
	var c = confirm('���� �����Ͻðڽ��ϱ�?');
	if (c == true) {
		location.href = "bookremoveimpl.do?id="+bookid;
	};		
}
</script>
<style></style>

<h1 align="center">Book Detail Page</h1>
<fieldset>
<legend>Book Detail</legend>
<table width="700" class="table"> 
<tr><td rowspan="7"><img width="200px" src="img/book/${bookdetail.img}"></td><th>ID</th><td>${bookdetail.id}</td></tr>
<tr><th>å����</th><td>${bookdetail.name}</td></tr>
<tr><th>����</th><td>${bookdetail.writer}</td></tr>
<tr><th>�ڷ��</th><td>${bookdetail.floor}</td></tr>
<tr><th>��������</th><td>${bookdetail.total_qt}</td></tr>
<tr><th>�뿩���ɰ���</th><td>${bookdetail.current_qt}</td></tr>
<tr><th>�����</th><td>${bookdetail.reg_date}</td></tr>
</tbody>
</table>
<input type="hidden" id="borrowbook" value="${borrowbook}">
<input type="hidden" id="bookid" value="${bookdetail.id}">
<%if(user!=null && user.getIsadmin().equals("y")){ %>
<div class="btn-group">
<a class="btn btn-default" href="bookmodify.do?id=${bookdetail.id}">����</a>
<button type="button" class="btn btn-default" onclick="deletebook();">����</button>
<button type="button" class="btn btn-default" onclick="rentbook();">�뿩</button>
</div>
<%}else if(user!=null && user.getIsadmin().equals("n")){ %>
<button type="button" class="btn btn-default" onclick="rentbook();">�뿩</button>
<%}else{ %>
<%} %>
</fieldset>
