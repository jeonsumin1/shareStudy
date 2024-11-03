<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#details{
		border : 1px solid black;
		width: 50%;
		margin:5%;
		padding:3%;
		
	}
</style>

</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<h1>상세페이지 - 정보 전달을 위한.</h1>
	
	<div align="center" id="details">
		<img src="../../resources/스터디룸.jpg">
	
		<p>당산역 스터디룸<p>		
	</div>
	
	<script>
		$("img").click(function(){
			console.log($(this).text());
		});
	</script>
	
	
</body>
</html>