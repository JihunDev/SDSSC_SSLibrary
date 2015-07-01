<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<script>
</script>
	<!-- �����̴� ����-->
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="img/css/Library01.jpg">
      </div>
      <div class="item">
        <img src="img/css/Library02.jpg">
      </div>
    
      <div class="item">
        <img src="img/css/Library03.jpg">
      </div>

      <div class="item">
        <img src="img/css/Library04.jpg">
      </div>
    </div>
    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  <div id="notice">
	<font size="5px">��������&nbsp;&nbsp;&nbsp;&nbsp;</font><b>
	<a class="btn btn-default btn-xs" role="button" href="boardmain.do?sort=notice">������</a></b>
		<table border="1">
		<thead>
		<tr>
			<th>��ȣ</th>
			<th>�۾���</th>
			<th>����</th>
			<th>��ȸ��</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${notice}" var="n">
			<tr>
				<td>${n.id}</td>
				<td>${n.u_id}</td>
				<td><a href="boarddetail.do?id=${n.id}">${n.title}</a></td>
				<td>${n.counter}</td>
				
			</tr>
		</c:forEach>
		</tbody>
		</table>
	</div>  
	<div id="free">
	<font size="5px">�����Խ���&nbsp;&nbsp;&nbsp;&nbsp;</font><b><a class="btn btn-default btn-xs" role="button" href="boardmain.do?sort=free">������</a></b>
	<table border="1">
		<thead>
		<tr>
			<th>��ȣ</th>
			<th>�۾���</th>
			<th>����</th>
			<th>��ȸ��</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${free}" var="f">
			<tr>
				<td>${f.id}</td>
				<td>${f.u_id}</td>
				<td><a href="boarddetail.do?id=${f.id}">${f.title}</a></td>
				<td>${f.counter}</td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
	</div>
<div id="lastbook">
<font size="5px">�ֽ� ���� TOP10</font>
<table border="1">
	<c:forEach items="${book}" var="b">
				<td>${b.img}</td>
	</c:forEach>
</table>
</div>

