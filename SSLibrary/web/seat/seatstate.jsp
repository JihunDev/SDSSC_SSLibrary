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
		if(s_state == 'n'){
		$.ajax({
			type : 'post',
			data : {
				's_id' : s_id
			},
			async : 'false',
			url : 'seatmodify.do',
			dataType:'JSON',
			success : function(data) {
				displayuserinfo(data);	
				showDialog(s_id, s_state);			
			},
			error : function() {
				alert("���� �Ӵ�Ф�");
			}
		});
		}else{
			showDialog(s_id, s_state);
		}
	};

</script>
<style>
#seattable>form>button{
	width: 9%;
	height: 50px;
	float:left;
	border-color: white;
}
#seattable>form>button[name="s_id"]:hover{
/* 	background: #FFC19E; */
	opacity: 0.5;
	border-color: white;
}
#seattable>form:nth-child(10n)>button{
	float:none;
}

#seattable>form:nth-child(10n-2)>button{
/* 	background:red; */
	margin:0 7% 0 0;
}

#seattable>form:nth-child(20n)>button{
/* 	background:blue; */
	margin:0 0 30px 0;
}


.y_btn {
	background: #CC723D;
}

.n_btn {
	background: #300000;
}

.f_btn {
	background: #337AB7;
}
.y_btn:hover {
	background: #CC723D;
}

.n_btn:hover {
	background: #300000;
}

.f_btn:hover {
	background: #337AB7;
}

.modify {
	display: none;
}
.example_btn{
	width:90px;
 	height:30px; 
	float:right;
	color:white;
	font-size: 15px;
	border-radius: 5px 5px 5px 5px;
}


.text_center{
	text-align:center;
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
<div class="text_center"> <h3>������ �¼� ��Ȳ</h3></div> <br>
<div><input type="button" class = "f_btn example_btn" value="���� ��" disabled>
<input type="button" class = "n_btn example_btn" value="��� ��" disabled> 
<input type="button" class = "y_btn example_btn" value="���� ����"disabled></div><br><br>
<div id = "seattable">	
	<c:forEach items="${seatlist}" var="s" varStatus="i">
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
								<button type="button" class="btn btn-primary ${s.state}_btn" value="${s.id}" data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
							</form>
						</c:when>
						<c:when test="${s.state == 'n'}">
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn" value="${s.id}" name="s_id" onclick="sendMsg(this.form);" value="${s.id}" data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
							</form>
						</c:when>
						<c:when test="${s.state == 'f'}">
							<form>
								<input type="hidden" name="s_state" value="${s.state}">
								<button type="button" class="btn btn-primary ${s.state}_btn" value="${s.id}" onclick="repairState();" value="${s.id}" data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
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
				<button type="button" class="btn btn-primary ${s.state}_btn">${s.id}</button>
			</form>
		</c:when>
		
	</c:choose>
	</c:forEach>
</div>
<div id = managerSeat>

</div>
</div>
<jsp:include page="${dialogpage}" />
