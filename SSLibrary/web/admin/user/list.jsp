<%@page import="com.entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	User user = (User) session.getAttribute("user");
	ArrayList<Object> userlist = (ArrayList<Object>) session.getAttribute("userlist");
	String usercount = (String) session.getAttribute("usercount");
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
<c:set var="list_length" value="${usercount}" />

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
$(document).ready(function(){
	  	if(<%=page_eno%>==0){
			alert("�˻������ �����ϴ�.");
		}   
	});
	
function searchByName(f){
	 f.action="usersearchname.do";
	 f.method="POST";
	 f.submit();
	
};
</script>
<div class="fieldsetform">
<form class="form-inline">
	<select class="form-control input-sm" name="isadmin">
		<option value="">��ü</option>
		<option value="n">ȸ��</option>
		<option value="s">����</option>
		<option value="d">Ż��</option>
	</select>
	 <div class="input-group">
	<input type="text" id="name" name="name" class="form-control input-sm" placeholder="Search for...">
     <span class="input-group-btn">
     <button class="btn btn-default btn-sm" type="button" onclick="searchByName(this.form)">�˻�</button></span></div>
	<!-- <input type="text" name="name" >
	<input type="submit" value="�˻�"> -->
</form>
	<legend align="center">User list (${user.id})</legend>
	<div>
	
	</div>
	<div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>ID</th>
					<th>�̸�</th>
					<th class="hidden-xs">TEL</th>
					<th class="hidden-xs">E-MAIL</th>
					<th>ȸ������</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${userlist}" var="u" varStatus="user_status">
				<c:set var="foreach_count" value="${user_status.count}" />
			<%
				int count = (int) pageContext.getAttribute("foreach_count");
				if(count >= record_start_no &&  count <= record_end_no){
			%>
					<tr>
						<td><a href="userdetail.do?id=${u.id}">${u.id}</a></td>
						<td>${u.name}</td>
						<td class="hidden-xs">${u.phone}</td>
						<td class="hidden-xs">${u.email}</td>
						<td>${u.isadmin}</td>
					</tr>
			<%}%>
				</c:forEach>
			</tbody>
		</table>
		<a href="usersearch.do?${search}pageno=1">[�Ǿ�����]</a>
<a href="usersearch.do?${search}pageno=<%=prev_pageno%>">[����]</a>
<%
if(page_eno == 0){
	%><b><a href="usersearch.do?${search}pageno=1">[1]</a></b><%
}else{
	for(int i =page_sno;i<=page_eno;i++){
%>
<a href="usersearch.do?${search}pageno=<%=i%>"> <%
 	if(pageno == i){
 %>
	<b>[<%=i%>]
</b> <%
 	}else{
 %> <%=i%> <%
 	}
 %>
</a>
<%--   �޸�    --%>
<%
	if(i<page_eno){
%>
,
<%
	}
%>
<%
	}}
%>

<a href="usersearch.do?${search}pageno=<%=next_pageno%>">[����]</a>
<a href="usersearch.do?${search}pageno=<%=total_page%>">[�ǵڷ�]</a>
	</div></div>