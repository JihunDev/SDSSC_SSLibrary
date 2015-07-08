<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	User user = (User) session.getAttribute("user");
	String receiver_uid = (String) request.getAttribute("receiver_uid");
	String receiver_sid = (String) request.getAttribute("receiver_sid");
%>

<script>
	// �¼� ��� �Լ�	
	function register(f) {
		var s_id = f.s_id.value;
		$('#registerMsg').popup('open');
		$("#regstermsgbutton").click(function() {
			f.action = "m_userseatregister.do?s_id=" + s_id;
			f.method = "POST";
			f.submit();
		});

	}
	//ȸ���� �޼��� ���� �Լ�
	function sendMsg(f) {
		var s_id = f.s_id.value;
		// �¼��� id �� ����
		$(".seatid").val(s_id);
		//�޼��� ���� ���̾�α� ���
		$('#sendMsg').popup('open');

	}
	// ���� �� �� ȸ���� ����� �¼��� Ŭ���� ���
	function registeredSeat() {
		$('#registeredSeat').popup('open');
	}
	// ����ڰ� ���� ���� �¼��� Ŭ���� ���
	function repairState() {
		$('#repairState').popup('open');
	}
	// ������ ����� �ٸ� �� �¼��� Ŭ���� ���
	function registeredUser() {
		$('#registeredUser').popup('open');
	}
	// �޼��� ����
	function sendMsgImpl(f) {
		$('#sendMsg').popup('close');
		// ������ �¼� ����
		var s_id = f.receiver_sid.value;
		// �߽���
		var sender_id = f.sender_uid.value;
		// ����
		var text = f.textarea.value;
		//$('#sendMsgImpls').popup('open');
		//$("#sendMsgImplbutton").click(function() {
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
				$('#sendMsgImplok').popup('open');
			},
			error : function() {
				$('#sendMsgImplfail').popup('open');
			}
		});
		//});
	}
</script>

<style>
#seattable>form>button {
	width: 27px;
	height: 37px;
	float: left;
	border-color: white;
	margin-top: 0px;
	margin-bottom: 0px;
	padding: 7px 1px 7px 1px;
	line-height: 20px;
	valign: middle;
}

#seattable>form {
	margin-bottom: 0px;
}

#seattable>form>button[name="s_id"]:hover {
	opacity: 0.6;
	border-color: white;
}

#seattable>form>button[name="s_id"]:active {
	opacity: 0.3;
	border-color: white;
	color: white;
}

#seattable>form:nth-child(10n)>button {
	float: none;
	margin: 0 20 0 0;
}

#seattable>form:nth-child(10n-2)>button {
	margin: 0 10 0 0;
}

#seattable>form:nth-child(20n)>button {
	margin: 0 0 50px 0;
}

.y_btn, #seattable>form>.y_btn, #seattable>form>.y_btn:hover, #seattable>form>.y_btn:active,
	#seattable>form>.y_btn:focus {
	background: #CC723D;
}

.n_btn, #seattable>form>.n_btn, #seattable>form>.n_btn:hover, #seattable>form>.n_btn:active,
	#seattable>form>.n_btn:focus {
	background: #300000;
}

.f_btn, #seattable>form>.f_btn, #seattable>form>.f_btn:hover, #seattable>form>.f_btn:active,
	#seattable>form>.f_btn:focus {
	background: #337AB7;
}

.door {
	background: #D4F4FA;
	width: 10px;
	height: 20px;
	border: 0
}
</style>

<h3>������ �¼� ��Ȳ</h3>
<button class="door"
	style="border-radius: 0 0 20px 0; width: 1px; border-top: 3px solid black;"></button>
<br>
<div id="seattable">
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
</div>

<!--  popup -->
<div data-role="popup" id="sendMsg">
	<div data-role="header">
		<h1>�޼�������</h1>
		<p>�߽���: ${user.id}(${user.name})</p>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<form>
			<input type="hidden" name="sender_uid" value="${user.id}"> <input
				type="hidden" name="receiver_sid" class="seatid">
			<textarea rows="2" cols="70" name="textarea"></textarea>
			<button type="button" name="Nbtn" id="Nbtn"
				onclick="sendMsgImpl(this.form);">������</button>
		</form>
	</div>
</div>

<div data-role="popup" id="registerMsg">
	<div data-role="header">
		<h1>�¼� ���</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>��� �Ͻðڽ��ϱ�?</h2>
		<button type="button" id="regstermsgbutton">���</button>
	</div>
</div>

<div data-role="popup" id="registeredSeat">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>�̹� ����� �¼��Դϴ�.</h2>
	</div>
</div>

<div data-role="popup" id="repairState">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>���� ���Դϴ�.</h2>
	</div>
</div>

<div data-role="popup" id="registeredUser">
	<div data-role="header">
		<h1>�˶�</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>�̹� �¼��� �����ϼ̽��ϴ�.</h2>
	</div>
</div>

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

<div data-role="popup" id="sendMsgImplok">
	<div data-role="header">
		<h1>�޼��� ���� Ȯ��</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>�޼����� �����Ͽ����ϴ�.</h2>
	</div>
</div>

<div data-role="popup" id="sendMsgImplfail">
	<div data-role="header">
		<h1>�޼��� ���� Ȯ��</h1>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<h2>������ ���� �޼����� ���۵��� �ʾҽ��ϴ�.</h2>
	</div>
</div>
    
