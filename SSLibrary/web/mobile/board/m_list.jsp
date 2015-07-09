<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%!public Integer toInt(String x) {
		int a = 0;
		try {
			a = Integer.parseInt(x);
		} catch (Exception e) {
		}
		return a;
	}%>
<c:set var="list_length" value="${boardlist_length}" />
<%
	int list_length = toInt((String) pageContext
			.getAttribute("list_length"));
	String sort = request.getParameter("sort");
	int pageno = toInt(request.getParameter("pageno"));

	if (pageno < 1) {//���� ������
		pageno = 1;
	}
	int total_record = list_length; //�� ���ڵ� ��

	int page_per_record_cnt = 10; //������ �� ���ڵ� ��
	int group_per_page_cnt = 5; //������ �� ������ ��ȣ ��[1],[2],[3],[4],[5]
	//                                              [6],[7],[8],[9],[10]                                 

	int record_end_no = pageno * page_per_record_cnt;
	int record_start_no = record_end_no - (page_per_record_cnt - 1);
	if (record_end_no > total_record) {
		record_end_no = total_record;
	}

	int total_page = total_record / page_per_record_cnt
			+ (total_record % page_per_record_cnt > 0 ? 1 : 0);
	if (pageno > total_page) {
		pageno = total_page;
	}

	//    ���� ������(����) / �������� �� ������ ���� ��ȣ ��(����) + (�׷� ��ȣ�� ���� ������(����) % �������� �� ������ ���� ��ȣ ��(����)>0 ? 1 : 0)
	int group_no = pageno / group_per_page_cnt
			+ (pageno % group_per_page_cnt > 0 ? 1 : 0);
	//      ���� �׷��ȣ = ���������� / �������� ������ ��ȣ�� (���� ������ % �������� ������ ��ȣ �� >0 ? 1:0)   
	//   ex)    14      =   13(��)      =    (66 / 5)      1   (1(������) =66 % 5)           

	int page_eno = group_no * group_per_page_cnt;
	//      ���� �׷� �� ��ȣ = ���� �׷��ȣ * �������� ������ ��ȣ 
	//   ex)    70      =   14   *   5
	int page_sno = page_eno - (group_per_page_cnt - 1);
	//       ���� �׷� ���� ��ȣ = ���� �׷� �� ��ȣ - (�������� ������ ��ȣ �� -1)
	//   ex)    66   =   70 -    4 (5 -1)

	if (page_eno > total_page) {
		//      ���� �׷� �� ��ȣ�� ��ü������ �� ���� Ŭ ���      
		page_eno = total_page;
		//      ���� �׷� �� ��ȣ�� = ��ü������ ���� ����
	}

	int prev_pageno = page_sno - group_per_page_cnt; // <<  *[����]* [21],[22],[23]... [30] [����]  >>
	//      ���� ������ ��ȣ   = ���� �׷� ���� ��ȣ - �������� ������ ��ȣ��   
	//   ex)      46      =   51 - 5            
	int next_pageno = page_sno + group_per_page_cnt; // <<  [����] [21],[22],[23]... [30] *[����]*  >>
	//      ���� ������ ��ȣ = ���� �׷� ���� ��ȣ + �������� ������ ��ȣ��
	//   ex)      56      =   51 - 5
	if (prev_pageno < 1) {
		//      ���� ������ ��ȣ�� 1���� ���� ���      
		prev_pageno = 1;
		//      ���� �������� 1��
	}
	if (next_pageno > total_page) {
		//      ���� ���������� ��ü������ ������ Ŭ���      
		next_pageno = total_page / group_per_page_cnt
				* group_per_page_cnt + 1;
		//      next_pageno=total_page
		//      ���� ������ = ��ü�������� / �������� ������ ��ȣ�� * �������� ������ ��ȣ�� + 1 
		//   ex)            =    76 / 5 * 5 + 1   ????????       
	}

	// [1][2][3].[10]
	// [11][12]
%>

<script>
	function getBoard(f) {
		f.action = "m_boardsearch.do";
		f.method = "post";
		f.submit();
	}
	$(document).ready(function() {
		if (
<%=page_eno%>
	== 0) {
			alert("�˻������ �����ϴ�.");
		}
	});
</script>

<c:if test="${sortname !='notice'}">
	<a href="m_boardwrite.do" class="ui-btn">���</a>
</c:if>
<div>
	<ul id="list" data-role="listview" data-filter="true"
		data-filter-placeholder="Search..." data-inset="true">
		<c:forEach items="${boardlist}" var="b" varStatus="board_status">
			<c:set var="foreach_count" value="${board_status.count}" />
			<%
				int count = (int) pageContext.getAttribute("foreach_count");
					if (count >= record_start_no && count <= record_end_no) {
			%>
			<li><a href="m_boarddetail.do?id=${b.id}"> <c:if
						test="${b.reply_num == 0}">
						<h3>${b.title}</h3>
					</c:if> <c:if test="${b.reply_num != 0}">
						<h3>${b.title} (${b.reply_num})</h3>
					</c:if>
					<p>�۾��� : ${b.u_id}</p>
					<p>�ۼ��� : ${b.reg_date}</p>
					<p class="ui-li-aside">
						<strong>�۹�ȣ : ${b.id}</strong>
					</p> <span class="ui-li-count">��ȸ�� : ${b.counter}</span>
			</a></li>
			<%
				}
			%>
		</c:forEach>
	</ul>
</div>
<br>
<%
	if (page_eno == 0) {
%><b><a href="m_boardmain.do?${search}sort=<%=sort%>&pageno=1">[1]</a></b>
<%
	} else {
		for (int i = page_sno; i <= page_eno; i++) {
%>
<a href="m_boardmain.do?${search}sort=<%=sort%>&pageno=<%=i%>"> <%
 	if (pageno == i) {
 %> <b>[<%=i%>]
</b> <%
 	} else {
 %> <%=i%> <%
 	}
 %>
</a>

<%--   �޸�    --%>
<%
	if (i < page_eno) {
%>
,
<%
	}
%>
<%
	}
	}
%>
