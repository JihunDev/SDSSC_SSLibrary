<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<div id="top">
<h1 id="mainname"><a href="main.do"><img width="80%"src="img/css/mainname.gif"></a></h1>
</div>
<div id="sub">
<font id="text">���� �˻� :</font>
<select id="issearch">
<option value="">����</option>
<option value="name">å�̸�</option>
<option value="writer">����</option>
</select>
	<select id="category">
	<option value="">����</option>
	<option value="i">IT</option>
	<option value="n">�Ҽ�</option>
	<option value="m">��ȭå</option></select>
	<input type="text" id="search">
	<input type="button" value="�˻�" onclick="getBook();">
</div>
<div id="bottom">
<ul>
<li><a href="seatmain.do"><b>������</b></b></a></li>
<li><a href="bookmain.do"><b>�ڷ��</b></a></li>
</ul>
</div>