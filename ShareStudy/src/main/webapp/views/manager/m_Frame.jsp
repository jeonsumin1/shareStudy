<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<link rel="stylesheet" href="${contextPath}/share/views/manager/css/manager.css">
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
			<li><a href="" target="display-frame">관리1</a></li>
			<li><a href="" target="display-frame">관리2</a></li>
			<li><a href="" target="display-frame">관리3</a></li>
			<li><a href="" target="display-frame">관리4</a></li>
			<li><a href="" target="display-frame">판매 통계</a></li>
		</ul>
		<div class="logout">
			<span><a href="">관리자 로그인</a></span>
		</div>
	</div>
	
	<!-- 콘텐츠 -->
	<div class="main">
		<div class="title">
			<h1>관리자 님, 환영합니다!</h1>
		</div>
		
	<!-- 아이프레임 -->
		<iframe name="display-frame" src="${contextPath}/share/views/manager/m_main.jsp"></iframe>
	
	</div>
		
	</div>
</body>
</html>