<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

</script>
 <div class="modify" id="modifyR" title="������ ������">
	<div id="modifytabs">
		<ul id="tabs">
			<li><a href="#modifyradio">�¼� ����</a></li>
			<li><a href="#sendMsg">�޼��� ����</a></li>
		</ul>
		<div id="modifycontent">
			<div class="modify" id="modifyradio" title="�¼� ����">
				<input type="text" class="seatstate">	<br>
				<input type="radio" class="stateclass" name="seatRed" id="ableseatR" value="y" >���� ����<br>
				<input type="radio" class="stateclass" name="seatRed" id="unableseatR" value="n"checked>���� �Ұ�<br>
				<input type="radio" class="stateclass" name="seatRed" id="fixseatR" value="f">���� ��<br>
				<input type="button" name="Rbtn" id="Rbtn" value="Ȯ��" onclick="modifystate(this.form);">
			</div>
			<div id="sendMsg">
				<jsp:include page="${registermsg}" />
			</div>
		</div>
	</div>
</div>

<div class="modify" id="modifyY" title="�¼� ����">
<input type="text" class="seatstate">	<br>
	<input type="radio" class="stateclass" name="seatY" id="ableseatY" value="y" checked>���� ����<br>
	<input type="radio" class="stateclass" name="seatY" id="fixseatY" value="f">���� ��<br>
	<input type="button" name="YGbtn" id="YGbtn" value="Ȯ��" onclick="modifystate(this.form);">
</div>

<div class="modify" id="modifyG" title="�¼� ����">
	<input type="text" class="seatstate">	<br>
	<input type="radio" class="stateclass" name="seatG" id="ableseatG" value="y">���� ����<br>
	<input type="radio" class="stateclass" name="seatG" id="fixseatG" value="f" checked>���� ��<br>
	<input type="button" name="YGbtn" id="YGbtn" value="Ȯ��" onclick="modifystate(this.form);">
</div>
	