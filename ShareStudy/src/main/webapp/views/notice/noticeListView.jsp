<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
	#noticeList{
		padding-top: 80px;
	}
	
	hr{
		color: #e9ecef;
	}
	
	#createNoticeBtn{
		float: right;
		margin-right: 16%;
		display: none;
	}
	
	body{
		display: flex;
		flex-direction: column;
		min-height: 100vh;
	}
	.container {
		flex: 1;
	}
	
	.text-center{
		margin-top: auto;
	}
</style>
</head>
<body>
	<%@include file="/views/common/menubar.jsp" %>
	<div class="container">
		<div id="noticeList">
			<table class="table table-hover table-striped text-center" style="border: 1px solid;">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1번</td>
						<td>안녕하세요. 쉐어스터디입니다.</td>
						<td>0</td>
					</tr>
					<tr>
						<td>2번</td>
						<td>공지사항 안내드립니다.</td>
						<td>0</td>
					</tr>
				</tbody>
				</table>
				<br>
				<hr>
		</div>
	</div>
	
	<ul class="pagination justify-content-center" style="text-align: center; position=relative;" >
		<li><a href="javascript:void(0);" style="margin-right: 5px; class="text-secondary"></a>◀</li>
		<li><a href="javascript:void(0);" style="margin-right: 5px; class="text-secondary"></a>1</li>
		<li><a href="javascript:void(0);" style="margin-right: 5px; class="text-secondary"></a>2</li>
		<li><a href="javascript:void(0);" style="margin-right: 5px; class="text-secondary"></a>3</li>
		<li><a href="javascript:void(0);" style="margin-right: 5px; class="text-secondary"></a>4</li>
		<li><a href="javascript:void(0);" style="margin-right: 5px; class="text-secondary"></a>5</li>
		<li><a href="javascript:void(0);" style="margin-right: 5px; class="text-secondary"></a>▶</li>
	</ul>
	<%if(userInfo != null && userInfo.getUserId().equals("Manager")){%>
		<div class="text-center mb-3">
			<button class="button-secondary" id="createNoticeBtn" style="display: block; position: absolute; top: 76%; right: 15px" onclick="createNotice();">작성하기</button>
		</div>
	<%}%>
	
	<script>
		function createNotice(){
			location.href="<%=contextPath%>/views/notice/createNotice.jsp"
		}
	</script>
	
	
	
	
	
	<%@include file="/views/common/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>