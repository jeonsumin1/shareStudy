<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>로그인</title>
<style>
@import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
html {
	height: 100%;
}
body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding-top: 200px;
	padding-bottom: 40px;
	font-family: "Nanum Gothic", arial, helvetica, sans-serif;
	background-repeat: no-repeat;
}
.card {
	margin: 0 auto; /* Added */
	float: none; /* Added */
	margin-bottom: 10px; /* Added */
}
#btn-Yes {
	background-color: #E4932B;
	border: none;
}
.login .form-control {
	position: relative;
	height: auto;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	padding: 10px;
	font-size: 16px;
}
.checkbox {
	margin-right: 20px;
	text-align: right;
}
.card-title {
	left: 30px;
}
.card-title > img{
	width: 70%;
	margin-left: 60px;
}
.links {
	text-align: center;
	margin-bottom: 10px;
}
.links > a {
	color: #F58B34;
	text-decoration: none;
}
.check {
	color: red;
}

#header {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1000;
}
</style>
</head>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
	width="100%" height="100%" align="center">
	<div id="header">
		<%@ include file="/views/common/menubar.jsp" %>
	</div>
		<% 
		   if (alertMsg != null) {
		   session.removeAttribute("alertMsg");
		%>
		    <script>
		        alert("<%= alertMsg %>");
		    </script>
		<%
		}
		%>
	<div class="card align-middle" style="width: 25rem;">
		<div class="card-title" style="margin-top: 30px; display: flex; justify-content: center;">
			<h2 class="card-title" style="color: #F58B34;">
				<a href="<%=contextPath%>/index.jsp"><img src="<%=contextPath%>/views/common/images/IDPWFIND.png"/></a>
			</h2>
		</div>
		<div class="card-body">
			<form action="login.shs" class="login" method="POST">
				<input type="text" name="userId" id="userId" class="form-control"
					placeholder="아이디" autofocus required><BR> <input
					type="password" name="userPw" id="userPw" class="form-control"
					placeholder="비밀번호" required><br>
				<p id="check" class="check">${login_msg}</p>
				<br /> <input id="btn-Yes" class="btn btn-lg btn-primary btn-block"
					type="submit" value="로 그 인">
			</form>
		</div>
	</div>
	<div class="links">
		<a href="<%=contextPath%>/views/member/findId.jsp">아이디 찾기</a> | <a href="<%=contextPath%>/views/member/findPw.jsp">비밀번호 찾기</a> | <a href="<%=contextPath%>/views/member/enrollForm.jsp">회원가입</a>
	</div>
	
</body>
</html>