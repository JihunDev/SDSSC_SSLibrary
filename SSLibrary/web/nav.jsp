<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%User user = (User)session.getAttribute("user");%> 
 <ul class="sidebar-menu" id="nav-accordion">   
              
 	<%if(user!=null && user.getIsadmin().equals("y")){ %> 
 		 <p class="centered"><a href="detail.do?id=${user.id}"><img src="img/user/${user.img}" class="img-circle" width="150"></a></p>
              	  <h5 class="centered">${user.name}</h5>
              	  
                  <li class="sub-menu">
                   <a href="javascript:;" >
                          <i class="fa fa-desktop"></i>
                          <span>ȸ�� ����</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="usinginfo.do?id=${user.id}">�����̿�����</a></li>
                          <li><a  href="modify.do?id=${user.id}">������������</a></li>
                          <li><a  href="msgloglist.do?id=${user.id}">�޼��� ����</a></li>
                      </ul>
                  </li>
                  <li class="sub-menu">
                      <a href="seatmain.do">
                          <i class="fa fa-desktop"></i>
                          <span>�����ǰ���</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                       <a  href="bookmain.do?search=false">
                          <i class="fa fa-desktop"></i>
                          <span>�ڷ�ǰ���</span>
                      </a>
                  </li>
                  <li class="sub-menu">
                      <a href="usersearch.do?search=false">
                          <i class="fa fa-desktop"></i>
                          <span>ȸ������</span>
                      </a>
                  </li>
    <%}else if((user!=null && user.getIsadmin().equals("n")) || (user!=null && user.getIsadmin().equals("s"))){ %>              
               <p class="centered"><a href="detail.do?id=${user.id}"><img src="img/user/${user.img}" class="img-circle" width="150"></a></p>
              	  <h5 class="centered">${user.name}</h5>
              	  
                  <li class="sub-menu">
                   <a href="javascript:;" >
                          <i class="fa fa-desktop"></i>
                          <span>ȸ�� ����</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="usinginfo.do?id=${user.id}">�����̿�����</a></li>
                          <li><a  href="modify.do?id=${user.id}">������������</a></li>
                          <li><a  href="msgloglist.do?id=${user.id}">�޼��� ����</a></li>
                      </ul>
                  </li>
                 <li class="sub-menu">
                      <a href="seatmain.do">
                          <i class="fa fa-dashboard"></i>
                          <span>������</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                       <a href="bookmain.do?search=false">
                          <i class="fa fa-dashboard"></i>
                          <span>�ڷ��</span>
                      </a>
                  </li>        
    <%}else{%>
       <li class="sub-menu">
                      <a href="seatmain.do">
                          <i class="fa fa-dashboard"></i>
                          <span>������</span>
                      </a>
                  </li>

                  <li class="sub-menu">
                       <a href="bookmain.do?search=false">
                          <i class="fa fa-dashboard"></i>
                          <span>�ڷ��</span>
                      </a>
                  </li>
    <%} %>
                  <li class="sub-menu">
                      <a href="boardmain.do?search=false&sort=notice">
                          <i class="fa fa-dashboard"></i>
                          <span>��������</span>
                      </a>
                  </li>
                  <li class="sub-menu">
                     <a href="boardmain.do?search=false&sort=free">
                          <i class="fa fa-dashboard"></i>
                          <span>�����Խ���</span>
                      </a>
                  </li>
              </ul>
