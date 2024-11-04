<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="display: none;">
<%@ include file="/views/common/menubar.jsp" %>
</div>
<h1>관리자 로그인 테스트</h1>
<form action="<%=contextPath%>/login.ma" id="login-form" method="post">
<label for="m_id">관리자 아이디: </label>
<input type="text" name="mid" value=""><br>
<label for="m_pwd">관리자 비밀번호: </label>
<input type="text" name="mpwd" value=""><br>
<button type="submit">로그인</button>
</form>
</body>
</html>