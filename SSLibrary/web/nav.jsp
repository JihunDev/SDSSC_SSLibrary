<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%User user = (User)session.getAttribute("user");%> 
<div id="bottom">
<ul>
<%if(user!=null && user.getIsadmin().equals("y")){ %>
<li><a href="seatmain.do"><b>�����ǰ���</b></a></li>
<li><a href="bookmain.do"><b>�ڷ�ǰ���</b></a></li>
<li><a href="#"><b>ȸ������</b></a></li>
<%}else{%>
<li><a href="seatmain.do"><b>������</b></a></li>
<li><a href="bookmain.do"><b>�ڷ��</b></a></li>	
<%} %>
</ul>
</div>