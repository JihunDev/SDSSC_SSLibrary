<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function del(f) {/* delete가 예약어라 del씀 */
	var c = confirm('삭제 하시겠습니까?');
		if (c == true) {
			f.action = 'm_boardremoveimpl.do';/* 추후 수정 */
			f.method = 'POST';
			f.submit();
		};
	}
function update(f) {
	var reg_number = f.reg_number.value;
	var id = f.id.value;
	//alert(reg_number);
	if(reg_number != 0 && $('#btn_'+id+'').val() == "수정"){// 댓글을 수정하려할때
		var content = f.old_content.value;
		$('#content_'+id+'').html("<input type='text' id='content_id' value='"+content+"'>");
		$('#btn_'+id+'').val("완료");	
		alert("Before : " + f.old_content.value);
		
	}else if(reg_number != 0 && $('#btn_'+id+'').val() == "완료"){// 댓글수정을 완료할때

		var c = confirm('댓글을 수정 하시겠습니까?');
		if (c == true) {
			var content = $('#content_id').val();
			$('input[name="content"]').val(content);
			alert("After : " + f.content.value);
			
			f.action = 'm_boardmodifyimpl.do';
			f.method = 'POST';
			f.submit();
		};
	} else {
			var c = confirm('수정 하시겠습니까?');
			if (c == true) {
				f.action = 'm_boardmodify.do';/* 추후 수정 */
				f.method = 'POST';
				f.submit();
			};
	}
}
	function register(f) {
		var c = confirm('댓글을 등록 하시겠습니까?');
		if (c == true) {
			f.action = 'm_boardwriteimpl.do';/* 추후 수정 */
			f.method = 'POST';
			f.submit();
		}
		;
	}
</script>

<style>
tbody td{
    border-bottom: 1px solid #d6d6d6;
}

tbody th{
    border-bottom: 1px solid #d6d6d6;
}

tr:nth-child(even) {
    background: #e9e9e9;
}
</style>

<table>
	<tbody>
		<tr>
			<th>제목</th>
			<td colspan="5">${boarddetail.title}</td>
		<tr>
			<th>분류</th>
			<td>${boarddetail.sort}</td>
			<th>글쓴이</th>
			<td>${boarddetail.u_id}</td>
			<th>조회</th>
			<td>${boarddetail.counter}</td>
		</tr>
		<tr>
		<th>작성일</th>
			<td colspan="5">${boarddetail.reg_date}</td>
		</tr>
		<tr>
			<th colspan="6">내용</th>
		</tr>
		<tr>	
			<td colspan="6">${boarddetail.content}</td>
		</tr>
	</tbody>
</table>
<div class="ui-grid-b">
	<div class="ui-block-a">
		<a href="javascript:;" onClick="extendMySeat();" data-role="button">수정</a>
	</div>
	<div class="ui-block-b">
		<a href="javascript:;" onClick="returnMySeat();" data-role="button">삭제</a>
	</div>
	<div class="ui-block-c">
		<a href="m_boardmain.do?sort=${boarddetail.sort}" data-role="button">목록</a>
	</div>
</div>
