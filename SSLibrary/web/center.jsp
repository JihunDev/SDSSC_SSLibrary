<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
	<!-- �����̴� ����-->
	<div class="maincenter1">
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
  </div>
	<div class="col-sm-6">
  <div id="notice" class="board">
	<font size="3px"><b>��������&nbsp;&nbsp;&nbsp;&nbsp;</b></font><b>
	<a class="btn btn-default btn-sm" role="button" href="boardmain.do?sort=notice">������</a></b>
		<table class="table table-condensed">
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
	</div>
	<div class="col-sm-6">
	<div id="free" class="board">
	<font size="3px"><b>�����Խ���&nbsp;&nbsp;&nbsp;&nbsp;</b></font><b><a class="btn btn-default btn-sm" role="button" href="boardmain.do?sort=free">������</a></b>
	<table class="table table-condensed">
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
</div>
<div class="col-sm-12">
<legend>�ֽ� ���� TOP10</legend>
	<c:forEach items="${book}" var="b">
				<img width="50px" src="img/book/${b.img}">
	</c:forEach>
</div> 

