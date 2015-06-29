<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
// �¼� ���� ���� �Լ�
	// �¼� ��Ȳ ������ ȣ��
	function showSeatList(f){
		f.action = "seatmain.do";
		f.method = "POST";
		f.submit();		
	}

function modifystate(f, i) {
	var s_id = f.seatid.value;
	var old_state = f.seatstate.value;
	var new_state = $('input[name=' + i + ']:radio:checked').val();
	//	alert("New State: "+ new_state + "s_id: " + s_id + "Old State: "+ old_state);
	
	if(old_state != new_state){
		var c = confirm(s_id + "�� �ڸ��� ���¸� �����Ͻðڽ��ϱ�?");
		if (c == true) {
			$.ajax({
				type : 'post',
				data : {
					's_id' : s_id,
					'state' : new_state
				},
				async : 'false',
				url : 'seatmodifyimpl.do',
				success : function(data) {
					alert(s_id + "�� �¼��� ���°� ����Ǿ����ϴ�.");
					showSeatList(f);
				},
				error : function() {
					alert("������ ���� �¼��� ���°� ������� �ʾҽ��ϴ�.");
				}
			});
		}	
	}else{
		var c = confirm(s_id + "�� �ڸ��� ���¸� �����Ͻðڽ��ϱ�?");
		if(c == true){
			alert(s_id + "�� �¼��� ���¸� �����մϴ�.");
			showSeatList(f);
		}
	}
	
}
</script>

<div class="modify" id="modifyR" title="������ ������">
	<div id="modifytabs">
		<ul id="tabs">
			<li><a href="#modifyradio">�¼� ����</a></li>
			<li><a href="#sendMsg">�޼��� ����</a></li>
		</ul>
		<div id="modifycontent">
			<div class="modify" id="modifyradio" title="�¼� ����">
				<form>
					<input type="hidden" class="seatstate" name="seatstate">
					 <input type="hidden" class="seatid" name="seatid">
					 <input type="radio" class="stateclass" name="seatR" id="ableseatR" value="y">���� ����<br>
					 <input type="radio" class="stateclass" name="seatR" id="unableseatR" value="n" checked>���� �Ұ�<br>
					 <input type="radio" class="stateclass" name="seatR" id="fixseatR" value="f">���� ��<br>
					 <input type="button" name="Rbtn" id="Rbtn" value="Ȯ��" onclick="modifystate(this.form, 'seatR');">
				</form>
			</div>
			<div class="modify" id="sendMsg">
				<jsp:include page="${registermsg}" />
			</div>
		</div>
	</div>
</div>

<div class="modify" id="modifyY" title="�¼� ����">
	<form>
		<input type="hidden" class="seatstate" name="seatstate">
		<input type="hidden" class="seatid" name="seatid">
		<input type="radio" class="stateclass" name="seatY" id="ableseatY" value="y" checked>���� ����<br>
		<input type="radio" class="stateclass" name="seatY" id="fixseatY" value="f">���� ��<br>
		<input type="button" name="Ybtn" id="Ybtn" value="Ȯ��" onclick="modifystate(this.form, 'seatY');">
	</form>
</div>

<div class="modify" id="modifyG" title="�¼� ����">
	<form>
		<input type="hidden" class="seatstate" name="seatstate">
		<input type="hidden" class="seatid" name="seatid">
		<input type="radio" class="stateclass" name="seatG" id="ableseatG" value="y">���� ����<br>
		<input type="radio" class="stateclass" name="seatG" id="fixseatG" value="f" checked>���� ��<br>
		<input type="button" name="Gbtn" id="Gbtn" value="Ȯ��" onclick="modifystate(this.form, 'seatG');">
	</form>
</div>
