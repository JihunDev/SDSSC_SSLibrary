<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.messagetextarea {
	width: 100%;
}
</style>
<form action="m_msgsendimpl.do" method="get">
	<h4 style="float: left;">������ ��� : ${user.id}(${user.name})</h4>
	<h4 style='float: right;'>�޴� ��� : ${s_id}</h4>
	
	<input type="hidden" name="sender_id" value="${user.id}"> 
	<input type="hidden" name="s_id_str" value="${s_id}">
	<div>
		<textarea rows="2" name="text" style="resize: none;"></textarea>
	</div>
	<br>
	<div>
		<button type="submit" value="������">������</button>
		<a href="#" data-rel="back" data-role="button">�ݱ�</a>
	</div>
</form>

<!-- popup -->
<div data-role="popup" id="sendMsgImpls">
	<div data-role="header">
		<h1>�޼��� ���� Ȯ��</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>���� �Ͻðڽ��ϱ�?</h2>
		<button type="button" id="sendMsgImplbutton">Ȯ��</button>
	</div>
</div>