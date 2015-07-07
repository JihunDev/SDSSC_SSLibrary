<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="fieldsetform"> 
<div>
	<div style="float:right;" >
     <button class="btn btn-default btn-sm" style="float:right;" type="submit" onclick='location.href="seatmain.do"'>�¼� ��Ȳ</button>
       </div> 
    <div class="input-group" style="float:left;" >
    <form action ="adminseatlogsearch.do" method="POST">
     <span class="input-group-btn">
      	 <input type="text" id="search" name="search" class="form-control input-sm"placeholder="Search for user ID">
         <button class="btn btn-default btn-sm" type="submit">�˻�</button>
      </span>
     </form>  
    </div><!-- /input-group -->
</div>
<br><br>
<fieldset>
<legend align="center">Seat Log List Page</legend>
	<table width="700" class="table table-hover">		
		<thead>
			<tr>
				<th>������ ID</th>
				<th>�¼� ID</th>
				<th>���� ���� �ð�</th>
				<th>�ݳ� ���� �ð�</th>
				<th>�� �ݳ� �ð�</th>
				<th>����</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${adminseatloglist}" var='sl'>
				<tr>
					<td>${sl.u_id}</td>
					<td>${sl.s_id}</td>
					<td>${sl.start_date}</td>
					<td>${sl.end_date}</td>
					<td>${sl.real_date}</td>
					<td>${sl.renew_qt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</fieldset>
<div>

    </div><!-- /input-group -->
</div>