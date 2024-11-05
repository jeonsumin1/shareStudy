<%@page import="com.kh.manager.model.vo.Manager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="${contextPath}/share/views/manager/css/manager.css">
<% String alertMsg = (String)request.getAttribute("alertMsg"); 
    Manager mInfo = (Manager)session.getAttribute("loginManager");
    String contextPath = request.getContextPath();
%>
<style>

</style>
</head>
<body>
	<div class="container">
	<div class="sidebar">
		<div class="logo">
		
		<a href="${contextPath}/share">
			<img src="./image/logo.png">
		</a>
		</div>
		<ul>
		    <li><a href="./m_main.jsp#room" target="display-frame">룸(상품) 관리</a></li>
			<li><a href="./m_main.jsp#reservation" target="display-frame">예약 관리</a></li>
			<li><a href="./m_main.jsp#member" target="display-frame">회원 관리</a></li>
			<li><a href="./m_main.jsp#review" target="display-frame">리뷰 관리</a></li>
			<li><a href="./m_main.jsp#question" target="display-frame">1:1 상담</a></li>
			<li><a href="./m_main.jsp#chart_wrap" target="display-frame">판매 통계</a></li>
		</ul>
		<% if(mInfo == null){ %>
		<div class="logout">
			<span><a href="./m_manager.jsp">관리자 로그인</a></span>
		</div>
		<%}else{ %>
		<div class="logout">
			<span><a href="${contextPath}/share/logout.ma">관리자 로그아웃</a></span>
		</div>
		<%} %>
	</div>
	
	<!-- 콘텐츠 -->
	<div class="main">
		<div class="title">
			<h1><%=mInfo.getManagerId()%>관리자 님, 환영합니다!</h1>
		</div>
		
	<!-- 아이프레임 -->
		<iframe name="display-frame" src="${contextPath}/share/views/manager/m_main.jsp"></iframe>
	
	</div>
	
	</div>
</body>
</html>