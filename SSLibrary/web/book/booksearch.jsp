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
	makeHeight();
  	if(<%=page_eno%>==0){
		$('#booklist_div').html("<tr><td colspan=8>�˻� ����� �������� �ʽ��ϴ�.</td><tr>");
	}  
  	
}

</script>
<div class="fieldsetform">
<div id="book_center">
<form class="form-inline">
 <select id="issearch" name="issearch" class="form-control input-sm"><option value="">����</option><option value="name">å�̸�</option><option value="writer">����</option></select>
 <select id="category" name="category" class="form-control input-sm"><option value="">����</option><option value="i">IT</option><option value="n">�Ҽ�</option><option value="m">��ȭå</option></select>
    <div class="input-group">
     <input type="text" id="search" name="search" class="form-control input-sm" placeholder="Search for...">
      <span class="input-group-btn">
        <button class="btn btn-default btn-sm" type="button" onclick="getBook(this.form);" >�˻�</button>
      </span>
    </div><!-- /input-group -->

   <%if(user!=null && user.getIsadmin().equals("y")){ %>
   <div class="btn-group">
   <a class="btn btn-default btn-sm" href="bookregister.do" role="button">���</a>
   <a class="btn btn-default btn-sm" href="adminbookloglist.do" role="button">���� �뿩 ���</a>
   <a class="btn btn-default btn-sm" href="userbookremoveconfirm.do" role="button">ȸ�� ���� �ݳ� ����</a>
   </div>
   <%} %>
   <fieldset>
   <legend align="center">Book list (count: ${bookcount})</legend>
				<div id="book_result">
					<table width="700" class="table table-hover">
						<thead>
							<tr>
								<th class="hidden-xs hidden-sm">��Ϲ�ȣ</th>
								<th>����</th>
								<th>����</th>
								<th class="hidden-xs hidden-sm">ǥ��</th>
								<th>��ġ</th>
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
									<td><a href="bookdetail.do?id=${b.id}">${b.name}</a></td>
									<td>${b.writer}</td>
									<td class="hidden-xs hidden-sm"><img width="30px" src="img/book/${b.img}"></td>
									<td>${b.floor}</td>
									<td>${b.total_qt}</td>
									<td>${b.current_qt}</td>
									<td class="hidden-xs hidden-sm">${b.reg_date}</td>
								</tr>
								<%}%>
							</c:forEach>
						</tbody>
					</table>
					<hr>
<a href="bookmain.do?${search}pageno=1">[�Ǿ�����]</a>
<a href="bookmain.do?${search}pageno=<%=prev_pageno%>">[����]</a>
<%
	if(page_eno == 0){
		%><b><a href="bookmain.do?${search}pageno=1">[1]</a></b><%
	}else{
	for(int i =page_sno;i<=page_eno;i++){
%>
<a href="bookmain.do?${search}pageno=<%=i%>">
	<%if(pageno == i){ %>
		<b>[<%=i%>]</b>
	<%}else{%>
		 [<%=i%>]
	<%} %>
</a>
<%--   �޸�    --%>
	<%if(i<page_eno){%>
	,
	<%}%>
<%}}%>

<a href="bookmain.do?${search}pageno=<%=next_pageno%>">[����]</a>
<a href="bookmain.do?${search}pageno=<%=total_page%>">[�ǵڷ�]</a>
				</div>
			</fieldset>
     </form>
</div>
</div>