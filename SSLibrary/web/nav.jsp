<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%User user = (User)session.getAttribute("user");%> 
<div id="bottom">
<ul>
<%if(user!=null && user.getIsadmin().equals("y")){ %>
<li class="active"><a href="seatmain.do"><b>�����ǰ���</b></a></li>
<li class="active"><a href="bookmain.do?search=false"><b>�ڷ�ǰ���</b></a></li>
<li class="active"><a href="usersearch.do?search=false"><b>ȸ������</b></a></li>
<!-- <li class="active"><a href="boardmain.do?sort=notice"><b>��������</b></a></li> -->
<!-- <li class="active"><a href="boardmain.do?sort=free"><b>�����Խ���</b></a></li> -->
<%}else{%>
<li class="active"><a href="seatmain.do"><b>������</b></a></li>
<li class="active"><a href="bookmain.do?search=false"><b>�ڷ��</b></a></li>	
<!-- <li class="active"><a href="boardmain.do?sort=notice"><b>��������</b></a></li> -->
<!-- <li class="active"><a href="boardmain.do?sort=free"><b>�����Խ���</b></a></li> -->
<%} %>
</ul>
</div>