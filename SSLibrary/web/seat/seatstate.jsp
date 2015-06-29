<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	User user = (User) session.getAttribute("user");
%>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>

	// �¼� ��� �Լ�	
	function register(f) {
		var s_id = f.s_id.value;
		var c = confirm(s_id + "�� �ڸ��� ����Ͻðڽ��ϱ�?");

		if (c == true) {
			f.action = "userseatregister.do?s_id=" + s_id;
			f.method = "POST";
			f.submit();
		}
	}
	// �޼��� ���� �Լ�
	function sendMsg(f) {
		var text = prompt("�޼��� ������ �Է��ϼ���.");

		/* if(name_value == true) else false */
		if (text) {
			var c = confirm("�޼����� �����ðڽ��ϱ�?");
			if (c == true) {

			}
		} else
			alert("����â ��ҹ�ư Ŭ�� �߽��ϴ�.");
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
	// �����ڰ� Ŭ������ ���� Dialogâ ȣ�� ����
	function showDialog(s_id, data) {
		var state = data;
		$(".seatstate").val(data);
		$(".seatid").val(s_id);
		//alert("���� : " + data);

		if (state == 'y') {
			$("#modifyY").dialog({
				'modal' : true,
				'width' : 300,
				'height' : 200
			});
		}
		if (state == 'n') {
			$("#modifytabs").tabs();
			$("#modifyR").dialog({
				'modal' : true,
				'width' : 500,
				'height' : 400
			});

		}
		if (state == 'f') {
			$("#modifyG").dialog({
				'modal' : true,
				'width' : 300,
				'height' : 200
			});
		}
	}
	
	// �����ڰ� �¼��� Ŭ���� ���
	function changeState(f) {
		var s_id = f.s_id.value;
		$.ajax({
			type : 'post',
			data : {
				's_id' : s_id
			},
			async : 'false',
			url : 'seatmodify.do',
			success : function(data) {
				showDialog(s_id, data);
			},
			error : function() {
				alert("���� �Ӵ�Ф�");
			}

		});
	};
	

</script>
<style>
.y_btn {
	background: yellow;
	width: 100px;
	height: 100px;
}

.n_btn {
	background: red;
	width: 100px;
	height: 100px;
}

.f_btn {
	background: green;
	width: 100px;
	height: 100px;
}

.modify {
	display: none;
}
</style>

<h1>Seat State(���� �¼� ����) (login: ${user.id}, Admin: ${user.isadmin}</h1>
<table>
	<tr>
		<c:forEach items="${seatlist}" var="s" varStatus="i">
			<c:if test="${i.index %10 == 0}">
	</tr>
	<tr>
		</c:if>
		<c:choose>
			<c:when test="${user.isadmin == 'n' }">
				<c:choose>
					<c:when test="${myseat == null}">
						<c:choose>
							<c:when test="${s.state == 'y'}">
								<form>
									<td><input type="button" class="${s.state}_btn"
										name="s_id" onclick="register(this.form);" value="${s.id}"></td>
								</form>
							</c:when>
							<c:when test="${s.state == 'n'}">
								<form>
									<td><input type="button" class="${s.state}_btn"
										name="s_id" onclick="registeredSeat();" value="${s.id}"></td>
								</form>
							</c:when>
							<c:when test="${s.state == 'f'}">
								<form>
									<td><input type="button" class="${s.state}_btn"
										name="s_id" onclick="repairState();" value="${s.id}"></td>
								</form>
							</c:when>
						</c:choose>
					</c:when>

					<c:otherwise>
						<c:choose>
							<c:when test="${s.state == 'y'}">
								<form>
									<td><input type="button" class="${s.state}_btn"
										name="s_id" onclick="registeredUser();" value="${s.id}"></td>
								</form>
							</c:when>
							<c:when test="${s.state == 'n'}">
								<form>
									<td><input type="button" class="${s.state}_btn"
										name="s_id" onclick="sendMsg();" value="${s.id}"></td>
								</form>
							</c:when>
							<c:when test="${s.state == 'f'}">
								<form>
									<td><input type="button" class="${s.state}_btn"
										name="s_id" onclick="repairState();" value="${s.id}"></td>
								</form>
							</c:when>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:when test="${user.isadmin == 'y'}">
				<c:choose>
					<c:when test="${s.state == 'y'}">
						<form>
							<td><input type="button" class="${s.state}_btn" name="s_id"
								onclick="changeState(this.form);" value="${s.id}"></td>
						</form>
					</c:when>
					<c:when test="${s.state == 'n'}">
						<form>
							<td><input type="button" class="${s.state}_btn" name="s_id"
								onclick="changeState(this.form);" value="${s.id}"></td>
						</form>
					</c:when>
					<c:when test="${s.state == 'f'}">
						<form>
							<td><input type="button" class="${s.state}_btn" name="s_id"
								onclick="changeState(this.form);" value="${s.id}"></td>
						</form>
					</c:when>
				</c:choose>
			</c:when>

			<c:when test="${user == null}">
				<c:choose>
					<c:when test="${s.state == 'y'}">
						<form>
							<td><input type="button" class="${s.state}_btn" name="s_id"
								disabled value="${s.id}"></td>
						</form>
					</c:when>
					<c:when test="${s.state == 'n'}">
						<form>
							<td><input type="button" class="${s.state}_btn" name="s_id"
								disabled value="${s.id}"></td>
						</form>
					</c:when>
					<c:when test="${s.state == 'f'}">
						<form>
							<td><input type="button" class="${s.state}_btn" name="s_id"
								disabled value="${s.id}"></td>
						</form>
					</c:when>
				</c:choose>
			</c:when>
		</c:choose>
		</c:forEach>
	</tr>
</table>

<jsp:include page="${modifypage}" />
