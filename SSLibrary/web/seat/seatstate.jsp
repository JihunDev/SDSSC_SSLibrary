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
		$.ajax({
			type : 'post',
			data : {
				's_id' : s_id
			},
			async : 'false',
			url : 'seatmodify.do',
			dataType:'JSON',
			success : function(data) {
				showDialog(s_id, s_state);
				if(s_state == 'n'){
					displayuserinfo(data);	
				}				
			},
			error : function() {
				alert("���� �Ӵ�Ф�");
			}
		});
	};

</script>
<style>
#seattable>form>button{
	width: 9%;
	height: 50px;
	float:left;
}
#seattable>form:nth-child(10n)>button{
	float:none;
}

#seattable>form:nth-child(10n-2)>button{
	background:red;
	margin:0 7% 0 0;
}

#seattable>form:nth-child(20n)>button{
	background:blue;
	margin:0 0 30px 0;
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
.seattableform{
	background: rgba(255, 255, 255, 0.8);
    box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
    margin-top : 40px;
    padding : 20px;
	border-radius: 10px 10px 10px 10px;
}
</style>
<div class="seattableform">
<div><h3>Seat State(���� �¼� ����) (Admin: ${user.isadmin})</h3></div>

<div id = "seattable">	
	<c:forEach items="${seatlist}" var="s" varStatus="i">
	<c:if test="${i.index % 11 == 0}">
			
	</c:if>
	<c:choose>
		
		<c:when test="${user.isadmin == 'n' }">
			<c:choose>
				<c:when test="${myseat == null}">
					<c:choose>
						<c:when test="${s.state == 'y'}">									
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn" name="s_id"	onclick="register(this.form);" value="${s.id}" data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
							</form>
						</c:when>
						<c:when test="${s.state == 'n'}">									
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn" name="s_id"	onclick="registeredSeat();" value="${s.id}" data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
							</form>
						</c:when>
						<c:when test="${s.state == 'f'}">
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn" name="s_id"	onclick="repairState();" value="${s.id}" data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
							</form>
						</c:when>
					</c:choose>
				</c:when>
					<c:otherwise>
					<c:choose>
						<c:when test="${s.state == 'y'}">
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn" name="s_id"	onclick="registeredUser();" value="${s.id}" data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
							</form>
						</c:when>
						<c:when test="${s.state == 'n'}">
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn" name="s_id"	onclick="sendMsg(this.form);" value="${s.id}" data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
							</form>
						</c:when>
						<c:when test="${s.state == 'f'}">
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn" name="s_id"	onclick="repairState();" value="${s.id}" data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
							</form>
						</c:when>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</c:when>
		
		<c:when test="${user.isadmin == 'y'}">
			<form>
				<input type="hidden" name="s_state" value="${s.state}">
				<button type="button" class="btn btn-primary ${s.state}_btn" name="s_id"	onclick="changeState(this.form);" 
				value="${s.id}" data-toggle="button" aria-pressed="false" autocomplete="off" data-target=".bs-example-modal-sm">${s.id}</button>
			</form>
		</c:when>
		
		<c:when test="${user == null || user.isadmin == 's'}">
			<form>
				<input type="hidden" name="s_state" value="${s.state}">
				<button type="button" class="btn btn-primary ${s.state}_btn" name="s_id">${s.id}</button>
			</form>
		</c:when>
		
	</c:choose>
	</c:forEach>
</div>
<div id = managerSeat>

</div>
</div>
<jsp:include page="${dialogpage}" />
