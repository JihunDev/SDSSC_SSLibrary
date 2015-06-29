<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String receiver_uid = (String) request.getAttribute("receiver_uid");
	String receiver_sid = (String) request.getAttribute("receiver_sid");
%>
<h1>�޼��� ����</h1>
<h2>�߽���: ${user.id}(${user.name}) </h2>

<script>
function	 sendMsgImpl(f){
	// ������ �¼� ����
	var u_id = f.receiver_uid.value;
	var s_id = f.receiver_sid.value;
	// �߽���
	var sender_id = f.sender_uid.value;
	// ����
	var text = f.textarea.value;
	
	alert("u_id: " +u_id+ " s_id: " +s_id  + " sender_id: " + sender_id + " text: "+ text);
	
	var c = confirm(s_id + "�� �ڸ��� ����ڿ��� �޼����� �����ðڽ��ϱ�?");
	if (c == true) {
		$.ajax({
			type : 'post',
			data : {
				'u_id' : u_id,
				's_id_str' : s_id,
				'sender_id' : sender_id,
				'text': text
			},
			async : 'false',
			url : 'msgsendimpl.do',
			success : function(data) {
				alert(s_id + " �¼����� �޼����� �����Ͽ����ϴ�.");
				showSeatList(f);
			},
			error : function() {
				alert("������ ���� �޼����� ���۵��� �ʾҽ��ϴ�.");
			}
		});
	}	

}

</script>
<!-- ���� ���� -->
<form>
	<input type="hidden" name="sender_uid" value="${user.id}">
	<input type="hidden" name="receiver_uid" value="${receiver_uid}">
	<input type="hidden" name="receiver_sid" value="${receiver_sid}">
	<textarea rows="10" cols="20" name="textarea" value=""></textarea>
	<br> <input type="button" value="����" onclick="sendMsgImpl(this.form);">	
</form>