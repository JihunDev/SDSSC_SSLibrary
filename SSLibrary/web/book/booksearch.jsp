<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%User user = (User)session.getAttribute("user");%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
function makeHeight() {
   var section = document.querySelector("#section");
   var left = document.querySelector("#left");
   var center = document.querySelector("#center");
   var center_area = document.querySelector('#book_center');
   
   var mHeight = center_area.clientHeight+50;
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
   output+='<table class="table table-hover">'
   output+='<thead><tr><th >ID</th><th >NAME</th><th>WRITER</th><th>IMG</th><th>FLOOR</th><th>TOTAL_QT</th><th>CURRENT_QT</th><th>REGDATE</th></tr></thead>';
   $(data).each(function(index, item) {
      with (item) {
         output += '<tr><td><a href="bookdetail.do?id='+bid+'">'+bid+'</a></td>';
         output += '<td>'+name+'</td>';
         output += '<td>'+writer+'</td>';
         output += '<td><img width="50px" src="img/book/'+img+'"></td>';
         output += '<td>'+floor+'</td>';
         output += '<td>'+ total_qt+'</td>';
         output += '<td>'+current_qt+'</td>';
         output += '<td>'+reg_date+'</td></tr>';
      }
   });
   output+="</table>"
   $('#book_result').html(output);
   makeHeight();

}


function getBook() {
   var search = $('#search').val();  
   var category = $('#category').val();
   var issearch = $('#issearch').val();
   
   $.ajax({
      dataType : 'JSON',
      async:'false',
      data:{
         'issearch' : issearch,
         'category' : category,
         'search': search},            
      url : 'booksearch.do',
      success:function(data){
         displaybook(data);
         makeHeight();
      }
   });
};
function deletebook(isdelete){
   if(isdelete=="1"){
      alert("������ �뿩 ���̾ ������ �� �����ϴ�.");
   }else{
   }
}

$(document).ready(function(){
   makeHeight();
   var isdelete = $('#isdelete').val();
      deletebook(isdelete);
});


/* function display(data){
   $('#book_result').empty(); //remove�� style���� �� ����
   var output='';
   output +='<table width="700" border="1">';
   output+='<thead><tr><th >ID</th><th >NAME</th><th>WRITER</th><th>IMG</th><th>FLOOR</th><th>TOTAL_QT</th><th>CURRENT_QT</th><th>REGDATE</th></tr></thead>';
   $(data).each(function(index, item){
      output+='<tr>';
      with(item){
         output+='<th>'+id+'</th>';
         output+='<td>'+name+'</td>';
         output+='<td>'+writer+'</td>';
         output+="<td><img width='100px' src='img/book/"+img+"'></td>";
         output+='<td>'+floor+'</td>';
         output+='<td>'+total_qt+'</td>';
         output+='<td>'+current_qt+'</td>';
         output+='<td>'+reg_date+'</td>';
      }
      output+='</tr>';
   });
   output+='</table>';
   $('#book_result').html(output);   
   makeHeight();
   
      
};

function firstBook(){
   $.ajax({
      url : 'booklist.do',
      dataType : 'JSON',
      async : false,
      success : function(data){
         display(data);
         makeHeight();
      }      
   });
};

$(document).ready(function(){
   firstBook();
   makeHeight();
}); */
</script>
<style></style>
</head>
<body>
<input type="hidden" id="isdelete" value="${isdelete}">
<div id="book_center">
   <select id="issearch"><option value="">����</option><option value="name">å�̸�</option><option value="writer">����</option></select>
   <select id="category"><option value="">����</option><option value="i">IT</option><option value="n">�Ҽ�</option><option value="m">��ȭå</option></select>
   <input type="text" id="search"><input type="button" value="�˻�" onclick="getBook();">
   <%if(user!=null && user.getIsadmin().equals("y")){ %>
   <div class="btn-group">
   <a class="btn btn-default btn-sm" href="bookregister.do" role="button">���</a>
   <a class="btn btn-default btn-sm" href="userbookremoveconfirm.do" role="button">ȸ�� ���� �ݳ� ����</a>
   </div>
   <%} %>
   <div id="book_result">
      <table width="700" class="table table-hover">
      <thead><tr><th >ID</th><th >NAME</th><th>WRITER</th><th>IMG</th>
      <th>FLOOR</th><th>TOTAL_QT</th><th>CURRENT_QT</th><th>REGDATE</th></tr></thead>
      <tbody>
      <c:forEach items="${booklist}" var="b"> <!-- ���ļ��� -->
      <tr>
      <td><a href="bookdetail.do?id=${b.id}">${b.id}</a></td>
      <td>${b.name}</td>
      <td>${b.writer}</td>
      <td><img width="30px" src="img/book/${b.img}"></td>
      <td>${b.floor}</td>
      <td>${b.total_qt}</td>
      <td>${b.current_qt}</td>
      <td>${b.reg_date}</td>
      </tr>
      </c:forEach>
      </tbody>
      </table>
   </div>
</div>
</body>
</html>