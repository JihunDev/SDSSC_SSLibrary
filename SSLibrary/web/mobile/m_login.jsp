<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script>
$.mobile.pageLoadErrorMessage = "�α��� ����"
</script>

<form action="m_login.do" method="POST">
	<input type="text" name="id" placeholder="ID" data-clear-btn="true">
	<input type="text" name="pwd" placeholder="PASSWORD" data-clear-btn="true">    
  	<fieldset class="ui-grid-a">
		<div class="ui-block-a">
			<a href="m_register.do" data-inline="true" data-role="button">ȸ������</a>
		</div>
	  	<div class="ui-block-b">
	  		<input type="submit" data-inline="true" value="�α���">
	 	 </div>
	</fieldset>
</form>