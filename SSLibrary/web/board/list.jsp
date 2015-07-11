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
	String search = request.getParameter("search");
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

<style>
a {
	text-decoration: none;
}
</style>
<script>
	function getBoard(f) {
		f.action = "boardsearch.do";
		f.method = "post";
		f.submit();
	}
	window.onload = function() {
		if (
<%=page_eno%>
	== 0) {
			$('#boardlist_div').html(
					"<tr><td colspan=5>��ϵ� �Խù��� �����ϴ�.</td><tr>");
		}

		makeHeight();
	}
</script>
<div class="fieldsetform">
	<form class="form-inline">
		<input type="hidden" name="sort" value="<%=sort%>"> <select
			id="issearch" name="issearch" class="form-control input-sm">
			<option value="id">ID</option>
			<option value="ct">����+����</option>
			<option value="title">����</option>
			<option value="content">����</option>
		</select>

		<div class="input-group">
			<input type="text" id="search" name="search"
				class="form-control input-sm" placeholder="Search for..."> <span
				class="input-group-btn">
				<button class="btn btn-default btn-sm" type="button"
					onclick="getBoard(this.form);">�˻�</button>
			</span>
		</div>
		<!-- /input-group -->

		<fieldset>
			<legend align="center">board list</legend>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>�۹�ȣ</th>
						<th>����</th>
						<th>�۾���</th>
						<th>�ۼ���</th>
						<th>��ȸ��</th>
					</tr>
				</thead>
				<tbody id="boardlist_div">
					<c:forEach items="${boardlist}" var="b" varStatus="board_status">
						<c:set var="foreach_count" value="${board_status.count}" />
						<%
							int count = (int) pageContext.getAttribute("foreach_count");
								if (count >= record_start_no && count <= record_end_no) {
						%>
						<tr>
							<td>${b.id}</td>
							<td><a href="boarddetail.do?id=${b.id}">${b.title}(${b.reply_num})</a></td>
							<td>${b.u_id}</td>
							<td>${b.reg_date}</td>
							<td>${b.counter}</td>
						</tr>
						<%
							}
						%>
					</c:forEach>
				</tbody>
				<!-- test�� ������ �Ѿ�� �� ���� -->
			</table>

			<hr>
			<a href="boardmain.do?${search}sort=<%=sort%>&pageno=1">[�Ǿ�����]</a> <a
				href="boardmain.do?${search}sort=<%=sort%>&pageno=<%=prev_pageno%>">[����]</a>
			<%
				if (page_eno == 0) {
			%><b><a href="boardmain.do?${search}sort=<%=sort%>&pageno=1">[1]</a></b>
			<%
				} else {
					for (int i = page_sno; i <= page_eno; i++) {
			%>
			<a href="boardmain.do?${search}sort=<%=sort%>&pageno=<%=i%>"> <%
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

			<a
				href="boardmain.do?${search}sort=<%=sort%>&pageno=<%=next_pageno%>">[����]</a>
			<a href="boardmain.do?${search}sort=<%=sort%>&pageno=<%=total_page%>">[�ǵڷ�]</a>

			<c:set var="loginuser_isadmin" value="${user.isadmin}" />
			<%
				String loginuser_isadmin = (String) pageContext
						.getAttribute("loginuser_isadmin");
				if (sort.equals("notice") && loginuser_isadmin != null) {
					if (loginuser_isadmin.equals("y")) {
			%><a href="boardwrite.do?sort=<%=sort%>">[���]</a>
			<%
				}
				} else if (loginuser_isadmin != null) {
					if (loginuser_isadmin.equals("y")
							|| loginuser_isadmin.equals("n")) {
			%><a href="boardwrite.do?sort=<%=sort%>">[���]</a>
			<%
				}
				}
			%>
		</fieldset>
	</form>
</div>
