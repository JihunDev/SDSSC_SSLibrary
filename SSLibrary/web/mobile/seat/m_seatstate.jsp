<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	User user = (User) session.getAttribute("user");
%>

<script>
	// �¼� ��� �Լ�	
	function register(f) {
		var s_id = f.s_id.value;
		var c = confirm(s_id + "�� �ڸ��� ����Ͻðڽ��ϱ�?");

		if (c == true) {
			f.action = "m_userseatregister.do?s_id=" + s_id;
			f.method = "POST";
			f.submit();
		}
	}
	//ȸ���� �޼��� ���� �Լ�
	function sendMsg(f) {
		var s_id = f.s_id.value;
		// �¼��� id �� ����
		$(".seatid").val(s_id);
		//�޼��� ���� ���̾�α� ���
		$('#sendMsg').dialog({
			modal : true,
			height: 300,  
            width: 250 
		});
		//$('#sendMsg' ).popup('open');

	}
	// ���� �� �� ȸ���� ����� �¼��� Ŭ���� ���
	function registeredSeat() {
		alert("�̹� ����� �¼��Դϴ�. ");
	}
	// ����ڰ� ���� ���� �¼��� Ŭ���� ���
	function repairState() {
		alert("���� ���Դϴ�");
	}
	// ������ ����� �ٸ� �� �¼��� Ŭ���� ���
	function registeredUser() {
		alert("�̹� �¼��� �����ϼ̽��ϴ�.");
	}
</script>

<h3>������ �¼� ��Ȳ</h3>
<c:forEach items="${seatlist}" var="s" varStatus="i">
	<c:choose>

		<c:when test="${user.isadmin == 'n' }">
			<c:choose>
				<c:when test="${myseat == null}">
					<c:choose>
						<c:when test="${s.state == 'y'}">
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn"
									name="s_id" onclick="register(this.form);" value="${s.id}"
									data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
							</form>
						</c:when>
						<c:when test="${s.state == 'n'}">
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn"
									name="s_id" onclick="registeredSeat();" value="${s.id}"
									data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
							</form>
						</c:when>
						<c:when test="${s.state == 'f'}">
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn"
									name="s_id" onclick="repairState();" value="${s.id}"
									data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
							</form>
						</c:when>
					</c:choose>
				</c:when>

				<c:otherwise>
					<c:choose>
						<c:when test="${s.state == 'y'}">
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn"
									value="${s.id}" name="s_id" onclick="registeredUser();"
									data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
							</form>
						</c:when>
						<c:when test="${s.state == 'n'}">
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn"
									value="${s.id}" name="s_id" onclick="sendMsg(this.form);"
									value="${s.id}" data-toggle="button" aria-pressed="false"
									autocomplete="off">${s.id}</button>
							</form>
						</c:when>
						<c:when test="${s.state == 'f'}">
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn"
									value="${s.id}" name="s_id" onclick="repairState();"
									value="${s.id}" data-toggle="button" aria-pressed="false"
									autocomplete="off">${s.id}</button>
							</form>
						</c:when>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</c:when>

		<c:when test="${user == null || user.isadmin == 's'}">
			<form>
				<input type="hidden" name="s_state" value="${s.state}">
				<button type="button" class="btn btn-primary ${s.state}_btn">${s.id}</button>
			</form>
		</c:when>

	</c:choose>
</c:forEach>


<%
	String receiver_uid = (String) request.getAttribute("receiver_uid");
	String receiver_sid = (String) request.getAttribute("receiver_sid");
%>
<script>
	function sendMsgImpl(f) {
		// ������ �¼� ����
		var s_id = f.receiver_sid.value;
		// �߽���
		var sender_id = f.sender_uid.value;
		// ����
		var text = f.textarea.value;

		alert("s_id: " + s_id + ", sender_id: " + sender_id + ", text: " + text);

		var c = confirm(s_id + "�� �ڸ��� ����ڿ��� �޼����� �����ðڽ��ϱ�?");
		if (c == true) {
			$.ajax({
				type : 'post',
				data : {
					's_id_str' : s_id,
					'sender_id' : sender_id,
					'text' : text
				},
				async : 'false',
				url : 'm_msgsendimpl.do',
				success : function(data) {
					alert(s_id + "�� �¼����� �޼����� �����Ͽ����ϴ�.");
					showSeatList(f);
				},
				error : function() {
					alert("������ ���� �޼����� ���۵��� �ʾҽ��ϴ�.");
				}
			});
		}

	}
</script>

<!--   Sending Message Part (User) -->
<div id="sendMsg" title="�޼��� ����">
	<h4>�߽���: ${user.id}(${user.name})</h4>
	<form>
		<input type="hidden" name="sender_uid" value="${user.id}"> <input
			type="hidden" name="receiver_sid" class="seatid">
		<textarea rows="2" cols="70" name="textarea"></textarea>
		<button type="button" name="Nbtn" id="Nbtn" value="������"
			onclick="sendMsgImpl(this.form);">������</button>
	</form>
</div>
