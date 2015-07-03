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
			f.action = "userseatregister.do?s_id=" + s_id;
			f.method = "POST";
			f.submit();
		}
	}
	
	//ȸ���� �޼��� ���� �Լ�
	function sendMsg(s_id) {
		// �¼��� id �� ����
		$(".seatid").val(s_id);
		//�޼��� ���� ���̾�α� ���
		$("#sendMsg").modal({
			'width' : 500,
			'height' : 400
		});		
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
		if (state == 'y') {
	        $('#modifyY').modal();
		}
		if (state == 'n') {
			$("#adminTab").tab('show');
			$("#modifyR").modal();

		}
		if (state == 'f') {
	        $('#modifyG').modal();
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
#seattable>tbody>tr>td>form>input{
	width: 50px;
	height: 50px;

}
.y_btn {
	background: #CC723D;
}

.n_btn {
	background: #300000;
}

.f_btn {
	background: #002266;
}

.modify {
	display: none;
}
#seattable{

}
</style>

<h1>Seat State(���� �¼� ����) (login: ${user.id}, Admin: ${user.isadmin}</h1>
<table id = "seattable"">
	<tr>
		<c:forEach items="${seatlist}" var="s" varStatus="i">
		<c:if test="${i.index % 8 == 0}">
				</tr><tr>
		</c:if>
		<c:if test="${i.index % 16 == 0}">
				</tr><tr><td>ddddd</td></tr><tr>
		</c:if>
		<c:choose>
			<c:when test="${user.isadmin == 'n' }">
				<c:choose>
					<c:when test="${myseat == null}">
						<c:choose>
							<c:when test="${s.state == 'y'}">
									<td>
								<form><input type="button" class="${s.state}_btn"
										name="s_id" onclick="register(this.form);" value="${s.id}">
								</form></td>
							</c:when>
							<c:when test="${s.state == 'n'}">
									<td>
								<form><input type="button" class="${s.state}_btn"
										name="s_id" onclick="registeredSeat();" value="${s.id}">
								</form></td>
							</c:when>
							<c:when test="${s.state == 'f'}">
									<td>
								<form><input type="button" class="${s.state}_btn"
										name="s_id" onclick="repairState();" value="${s.id}">
								</form></td>
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
										name="s_id" onclick="sendMsg(${s.id});" value="${s.id}"></td>
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
						<td><form>
							<input type="button" class="${s.state}_btn" name="s_id"
								onclick="changeState(this.form);" value="${s.id}">
						</form></td>
					</c:when>
					<c:when test="${s.state == 'n'}"><td>
						<form>
							<input type="button" class="${s.state}_btn" name="s_id"
								onclick="changeState(this.form);" value="${s.id}">
						</form></td>
					</c:when>
					<c:when test="${s.state == 'f'}"><td>
						<form>
							<input type="button" class="${s.state}_btn" name="s_id"
								onclick="changeState(this.form);" value="${s.id}">
						</form></td>
					</c:when>
				</c:choose>
			</c:when>

			<c:when test="${user == null || user.isadmin == 's'}">
				<c:choose>
					<c:when test="${s.state == 'y'}">
							<td>
						<form><input type="button" class="${s.state}_btn" name="s_id"
								disabled value="${s.id}">
						</form></td>
					</c:when>
					<c:when test="${s.state == 'n'}">
							<td>
						<form><input type="button" class="${s.state}_btn" name="s_id"
								disabled value="${s.id}">
						</form></td>
					</c:when>
					<c:when test="${s.state == 'f'}">
							<td>
						<form><input type="button" class="${s.state}_btn" name="s_id"
								disabled value="${s.id}">
						</form></td>
					</c:when>
				</c:choose>
			</c:when>
		</c:choose>
		</c:forEach>
	</tr>
</table>

<jsp:include page="${modifypage}" />
