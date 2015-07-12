<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	User user = (User)session.getAttribute("user");
	ArrayList<Object> booklist = (ArrayList<Object>) session.getAttribute("booklist");
	String bookcount = (String) session.getAttribute("bookcount");
	String search = (String) session.getAttribute("search");
%> 
<%!public Integer toInt(String x) {
		int a = 0;
		try {
			a = Integer.parseInt(x);
		} catch (Exception e) {
		}
		return a;
	}%>
<c:set var="list_length" value="${bookcount}" />

<%
	int list_length = toInt((String) pageContext.getAttribute("list_length"));

	int pageno = toInt(request.getParameter("pageno"));

   if(pageno<1){//���� ������
      pageno = 1;
   }
   int total_record = list_length;      //�� ���ڵ� ��
   
   int page_per_record_cnt = 10;  //������ �� ���ڵ� ��
   int group_per_page_cnt =5;     //������ �� ������ ��ȣ ��[1],[2],[3],[4],[5]
//                                              [6],[7],[8],[9],[10]                                 

   int record_end_no = pageno*page_per_record_cnt;            
   int record_start_no = record_end_no-(page_per_record_cnt-1);
   if(record_end_no>total_record){
      record_end_no = total_record;
   }
                                 
                                 
   int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt>0 ? 1 : 0);
   if(pageno>total_page){
      pageno = total_page;
   }

   

//    ���� ������(����) / �������� �� ������ ���� ��ȣ ��(����) + (�׷� ��ȣ�� ���� ������(����) % �������� �� ������ ���� ��ȣ ��(����)>0 ? 1 : 0)
   int group_no = pageno/group_per_page_cnt+( pageno%group_per_page_cnt>0 ? 1:0);
//      ���� �׷��ȣ = ���������� / �������� ������ ��ȣ�� (���� ������ % �������� ������ ��ȣ �� >0 ? 1:0)   
//   ex)    14      =   13(��)      =    (66 / 5)      1   (1(������) =66 % 5)           
   
   int page_eno = group_no*group_per_page_cnt;      
//      ���� �׷� �� ��ȣ = ���� �׷��ȣ * �������� ������ ��ȣ 
//   ex)    70      =   14   *   5
   int page_sno = page_eno-(group_per_page_cnt-1);   
//       ���� �׷� ���� ��ȣ = ���� �׷� �� ��ȣ - (�������� ������ ��ȣ �� -1)
//   ex)    66   =   70 -    4 (5 -1)
   
   if(page_eno>total_page){
//      ���� �׷� �� ��ȣ�� ��ü������ �� ���� Ŭ ���      
      page_eno=total_page;
//      ���� �׷� �� ��ȣ�� = ��ü������ ���� ����
   }
   
   int prev_pageno = page_sno - group_per_page_cnt;  // <<  *[����]* [21],[22],[23]... [30] [����]  >>
//      ���� ������ ��ȣ   = ���� �׷� ���� ��ȣ - �������� ������ ��ȣ��   
//   ex)      46      =   51 - 5            
   int next_pageno = page_sno +group_per_page_cnt;   // <<  [����] [21],[22],[23]... [30] *[����]*  >>
//      ���� ������ ��ȣ = ���� �׷� ���� ��ȣ + �������� ������ ��ȣ��
//   ex)      56      =   51 - 5
   if(prev_pageno<1){
//      ���� ������ ��ȣ�� 1���� ���� ���      
      prev_pageno=1;
//      ���� �������� 1��
   }
   if(next_pageno>total_page){
//      ���� ���������� ��ü������ ������ Ŭ���      
      next_pageno=total_page/group_per_page_cnt*group_per_page_cnt+1;
//      next_pageno=total_page
//      ���� ������ = ��ü�������� / �������� ������ ��ȣ�� * �������� ������ ��ȣ�� + 1 
//   ex)            =    76 / 5 * 5 + 1   ????????       
   }
   
   // [1][2][3].[10]
   // [11][12]
%>



<script>
function makeHeight() {
   var section = document.querySelector("#main-content");
   var center = document.querySelector("#center");
   var center_area = document.querySelector('#book_center');
   
   var mHeight = center_area.clientHeight+120;
   /* ClientHeight�� �Ἥ ǥ ���̸�ŭ �ø��� ��. */
   if (mHeight < 850) {
      mHeight = 850;
   }
   center.style.height = mHeight + 'px';
   section.style.height = mHeight + 'px';
};

function getBook(f) {
   var search = $('#search').val();  
   var category = $('#category').val();
   var issearch = $('#issearch').val();
   
   f.action = 'booksearch.do';
   f.method = 'POST';
   f.submit();

};

window.onload = function(){
	//makeHeight();
  	if(<%=page_eno%>==0){
		$('#booklist_div').html("<tr><td colspan=8>�˻� ����� �������� �ʽ��ϴ�.</td><tr>");
	} 
  	var backgroundColor_ = "#84b683";
  	var color_ = "white";
  	
  	$('.theadcolor>thead>tr>th').css({backgroundColor:backgroundColor_, color:color_});
	$('.btncolor').css({backgroundColor:backgroundColor_, color:color_});
	
}

</script>
<div class="fieldsetform">

<div class="listtabletitle">	
	<table class="table" style="width:100%;">
		<tr>
			<th><h1>Library Book List</h1></th>
		</tr>
	</table>	
</div>
	<div id="book_center">
			<%if (user != null && user.getIsadmin().equals("y")) {%>
			<div class="btn-group" style="width:auto;float:right;">
				<a class="btn btn-default btn-sm" style="width:100px;margin:0 2px;"href="bookregister.do" role="button">�ű� ���� ���</a>
				<a class="btn btn-default btn-sm" style="width:108px;margin:0 2px;" href="adminbookloglist.do" role="button">���� �뿩 ���</a>
				<a class="btn btn-default btn-sm" style="width:108px;margin:0 2px;" href="userbookremoveconfirm.do" role="button">���� �ݳ� ����</a>
			</div>
			<%} %>
			<br><br>
			<form class="form-inline">
				<button class="btn btn-default btn-sm btncolor" style="width:58px;float:right;margin:0 2px;" type="button" onclick="getBook(this.form);">�˻�</button>
				<input type="text" id="search" name="search"	style="width:20%;float:right;;margin:0 2px;" class="form-control input-sm" placeholder="Search for...">
				<select id="issearch" name="issearch" style="width:78px;float:right;;margin:0 2px;"  class="form-control input-sm">
					<option value="">����2</option>
					<option value="name">å �̸�</option>
					<option value="writer">����</option>
				</select>
				<select id="category" name="category" style="width:78px;float:right;;margin:0 2px;" class="form-control input-sm">
					<option value="">����1</option>
					<option value="i">IT</option>
					<option value="n">�Ҽ�</option>
					<option value="m">��ȭå</option>
				</select>
			</form>		
			

<br><br>
<fieldset>
	<div id="book_result">
		<table width="700" class="table table-hover theadcolor">
			<thead>
				<tr>
					<th class="hidden-xs hidden-sm">��Ϲ�ȣ</th>
					<th class="hidden-xs hidden-sm">ǥ��</th>
					<th>����</th>
					<th>����</th>
					<th>�ڷ��</th>
					<th>�� ����</th>
					<th>���� ����</th>
					<th class="hidden-xs hidden-sm">�������</th>
				</tr>
			</thead>
			<tbody id="booklist_div">
				<c:forEach items="${booklist}" var="b" varStatus="book_status">
					<c:set var="foreach_count" value="${book_status.count}" />
					<%
							int count = (int) pageContext.getAttribute("foreach_count");
							if(count >= record_start_no &&  count <= record_end_no){
					%>
					<tr>
						<td class="hidden-xs hidden-sm">${b.id}</td>
						<td class="hidden-xs hidden-sm"><img height="30px" src="img/book/${b.img}"></td>
						<td><a href="bookdetail.do?id=${b.id}">${b.name}</a></td>
						<td>${b.writer}</td>
						<td>${b.floor}</td>
						<td>${b.total_qt}</td>
						<td>${b.current_qt}</td>
						<td class="hidden-xs hidden-sm">${b.reg_date}</td>
					</tr>
					<%}%>
				</c:forEach>
			</tbody>
		</table>
		

		
		<div class="listpagingnum" style="font-size: large;">
				<a class="btn btn-default btn-sm btncolor" href="bookmain.do?${search}pageno=1"><span class="glyphicon glyphicon-backward"></span></a>
				<a class="btn btn-default btn-sm btncolor" href="bookmain.do?${search}pageno=<%=prev_pageno%>"> <span class="glyphicon glyphicon-triangle-left"></span></a>
					<%if(page_eno == 0){%>
							<b><a href="bookmain.do?${search}pageno=1">[1]</a></b>
					<%}else{
							for(int i =page_sno;i<=page_eno;i++){%>
						<a href="bookmain.do?${search}pageno=<%=i%>">
							<%if(pageno == i){ %>
								<b>[<%=i%>]</b>
							<%}else{%>
								 [<%=i%>]
							<%} %>
						</a>
						<%--   �޸�    --%>
							<%if(i<page_eno){%>
							&nbsp;
							<%}%>
						<%}				
						}%>
					
					<a class="btn btn-default btn-sm btncolor" href="bookmain.do?${search}pageno=<%=next_pageno%>"><span class="glyphicon glyphicon-triangle-right"></span></a>
					<a class="btn btn-default btn-sm btncolor" href="bookmain.do?${search}pageno=<%=total_page%>"><span class="glyphicon glyphicon-forward"></span></a>
				<br><br>
			
			</div>	
		
		</div>
	</fieldset>
	</div>
</div>