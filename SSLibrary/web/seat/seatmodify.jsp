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
<style>
.seat-dialog{
	height:200px;
	width:300px;
	
}
</style>
<div class="modal fade"  id="modifyY" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- �ݱ�(x) ��ư -->
        <button type="button" class="close" data-dismiss="modal">��</button>
        <!-- header title -->
        <h4 class="modal-title">�¼� ����</h4>
      </div>
      <!-- body -->
      <form>
      <div class="modal-body">
				<form>
					<input type="hidden" class="seatstate" name="seatstate">
					 <input type="hidden" class="seatid" name="seatid">
					 <input type="radio" class="stateclass" name="seatY" id="ableseatY" value="y" checked>���� ����<br>
					 <input type="radio" class="stateclass" name="seatY" id="fixseatY" value="f">���� ��<br> 
<!-- 					 <input type="button" name="Ybtn" id="Ybtn" value="Ȯ��"	onclick="modifystate(this.form, 'seatY');"> -->
			</div>
      <!-- Footer -->
      <div class="modal-footer">
        Footer
        <button type="button" class="btn btn-default" data-dismiss="modal" name="Ybtn" id="Ybtn" value="Ȯ��"	onclick="modifystate(this.form, 'seatY');">Ȯ��</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
        </div>
    		</form>
		
    </div>
  </div>
</div>


<div class="modal fade"  id="modifyG" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- �ݱ�(x) ��ư -->
        <button type="button" class="close" data-dismiss="modal">��</button>
        <!-- header title -->
        <h4 class="modal-title">�¼� ����</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
			<form>
				<input type="hidden" class="seatstate" name="seatstate">
				<input type="hidden" class="seatid" name="seatid">
				<input type="radio" class="stateclass" name="seatG" id="ableseatG" value="y">���� ����<br>
				<input type="radio" class="stateclass" name="seatG" id="fixseatG" value="f" checked>���� ��<br>
				<input type="button" name="Gbtn" id="Gbtn" value="Ȯ��" onclick="modifystate(this.form, 'seatG');">
			</form>
			</div>
      <!-- Footer -->
      <div class="modal-footer">
        Footer
        <button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="modifyR">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- header -->
			<div class="modal-header">
				<!-- �ݱ�(x) ��ư -->
				<button type="button" class="close" data-dismiss="modal">��</button>
				<!-- header title -->
				<h4 class="modal-title">�¼� r����</h4>
			</div>
			<!-- body -->
			<div class="modal-body">
				<ul class="nav nav-tabs" role="tablist" id="adminTab">
					<li role="presentation" class="active">
						<a href="#modifyradio"	aria-controls="home" role="tab" data-toggle="tab">�¼� ����</a></li>
					<li role="presentation">
						<a href="#sendMsgByAdmin"	aria-controls="profile" role="tab" data-toggle="tab">�޼��� ����</a></li>
				</ul>
					
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane fade in active" id="modifyradio">
						<form>
							<input type="hidden" class="seatstate" name="seatstate">
							<input type="hidden" class="seatid" name="seatid">
							<input type="radio" class="stateclass" name="seatR" id="ableseatR" value="y">���� ����<br>
							<input type="radio" class="stateclass" name="seatR" id="unableseatR" value="n" checked>���� �Ұ�<br>
							<input type="radio" class="stateclass" name="seatR" id="fixseatR" value="f">���� ��<br>
							<input type="button" name="Rbtn" id="Rbtn" value="Ȯ��" onclick="modifystate(this.form, 'seatR');">
						</form>
					</div>
					<div role="tabpanel" class="tab-pane fade" id="sendMsgByAdmin">
						<jsp:include page="${registermsg}" />
					</div>
				</div>
			</div>
			<!-- Footer -->
			<div class="modal-footer">
				Footer
				<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade"  id="sendMsg" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- �ݱ�(x) ��ư -->
        <button type="button" class="close" data-dismiss="modal">��</button>
        <!-- header title -->
        <h4 class="modal-title">�¼� ����</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
			<jsp:include page="${registermsg}" />
			</div>
      <!-- Footer -->
      <div class="modal-footer">
        Footer
        <button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
      </div>
    </div>
  </div>
</div>
