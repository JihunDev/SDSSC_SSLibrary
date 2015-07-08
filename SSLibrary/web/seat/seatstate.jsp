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
	function sendMsg(f) {
		var s_id = f.s_id.value;
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
	function showDialog(s_id, s_state) {
		var state = s_state;
		$(".seatstate").val(s_state);
		$(".seatid").val(s_id);

		if (state == 'y') {
			$('#modifyY').modal();
		}
		if (state == 'n') {
			$("#adminTab a:first").tab('show');
			$("#modifyN").modal();

		}
		if (state == 'f') {
			$('#modifyF').modal();
		}
	}

	// �����ڰ� �¼��� Ŭ���� ���
	function changeState(f) {
		var s_id = f.s_id.value;
		var s_state = f.s_state.value;
		if (s_state == 'n') {
			$.ajax({
				type : 'post',
				data : {
					's_id' : s_id
				},
				async : 'false',
				url : 'seatmodify.do',
				dataType : 'JSON',
				success : function(data) {
					displayuserinfo(data);
					showDialog(s_id, s_state);
				},
				error : function() {
					alert("���� �Ӵ�Ф�");
				}
			});
		} else {
			showDialog(s_id, s_state);
		}
	};
</script>
<style>
#seattable>form>button {
	width: 9%;
	height: 50px;
	float: left;
	border-color: white;
}

#seattable>form>button[name="s_id"]:hover {
	/* 	background: #FFC19E; */
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
}

#seattable>form:nth-child(10n-2)>button {
	margin: 0 7% 0 0;
}

#seattable>form:nth-child(20n)>button {
	margin: 0 0 30px 0;
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
	background: #35B62C;
}

.modify {
	display: none;
}

.example_btn {
	width: auto;
	height: 30px;
	float: right;
	color: white;
	font-size: 15px;
	border-radius: 5px 5px 5px 5px;
}

.text_center {
	text-align: center;
}

.seattableform {
	background: rgba(255, 255, 194, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
	margin-top: 40px;
	padding: 20px;
	border-radius: 10px 10px 10px 10px;
	
}

#seat_article {
	border: 5px double Gray;
}

#managerSeat {
	
}

.door {
	background: #D4F4FA;
	width:40px;
	height: 40px;
	border:0
}
</style>
<div class="seattableform">
	<div class="text_center">
		<h3>������ �¼� ��Ȳ</h3>
	</div>
	<div class="btn-group">
	 </div>
	<br>
	
	<div>
		<c:if test="${user.isadmin == 'y' && user != null}"> 
			<input type="button" class="example_btn" style="float:left;color:gray;width:auto;" onclick='location.href="adminseatloglist.do"' value="�¼� �뿩 ���� ���"></a>
 		</c:if>
 		<input type="button" class="f_btn example_btn" value="���� ��: ${f_count}" disabled>
		<input type="button" class="n_btn example_btn" value="��� ��: ${n_count}" disabled>
		<input type="button" class="y_btn example_btn" value="���� ����: ${y_count}" disabled>
		<input type="button" class="example_btn"
		style="background: gray; width: 200px;" value="��  �¼� �� : ${seatqt}" disabled>
	</div>
	<br>
	<br>
<div id="seat_article">
	<div id=managerSeat><br>
	<input type="button" class="door" style="border-radius:0 0 40px 0; border-top: 3px solid black;" disabled><br>
	<input type="button"  class="door" style="border-radius:0 40px  0 0; border-bottom: 3px solid black;" disabled></div><br><br>
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

				<c:when test="${user.isadmin == 'y'}">
					<form>
						<input type="hidden" name="s_state" value="${s.state}">
						<button type="button" class="btn btn-primary ${s.state}_btn"
							name="s_id" onclick="changeState(this.form);" value="${s.id}"
							data-toggle="button" aria-pressed="false" autocomplete="off"
							data-target=".bs-example-modal-sm">${s.id}</button>
					</form>
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
	</div>
</div>
<jsp:include page="${dialogpage}" />
