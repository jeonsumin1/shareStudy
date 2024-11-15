<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.notice.model.vo.Notice"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%ArrayList<Notice> n = (ArrayList<Notice>)request.getAttribute("n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
#noticeList {
	padding-top: 80px;
}

hr {
	color: #e9ecef;
}

#createNoticeBtn {
	float: right;
	left: 0.03% !important; 
	display: none;
}

body {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

.container {
	flex: 1;
}

.text-center {
	margin-top: auto;
}
</style>
</head>
<body>
	<%@include file="/views/common/menubar.jsp"%>
	<% 
	if (alertMsg != null) { 
	%>
		<div class="alert alert-info text-center" role="alert">
			<%= alertMsg %>
		</div>
	<% 
		session.removeAttribute("alertMsg");
	}
	%>
	<div class="container">
		<div id="noticeList">
		<%--
			<table id="category">
				<tr>공지사항
				</tr>
				&nbsp;&nbsp;&nbsp;
				<tr>이용안내
				</tr>
				&nbsp;&nbsp;&nbsp;
				<tr>이벤트
				</tr>
			</table>
		--%>
			<br> <br>
			<table class="table table-hover table-striped text-center"
				style="border: 1px solid;" id="noticeListTable">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty n}">
							<tr>
								<td colspan="4">등록된 공지사항이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${n}" var="nList">
								<tr class="trNoticeList">
									<td>${nList.key}</td>
									<td>${nList.nTitle}</td>
									<td>${nList.createDate}</td>
									<td>${nList.count}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<hr>
			<%if (userInfo != null && userInfo.getUserName().equals("관리자")) {%>
			<div class="text-center mb-3">
				<button class="button-secondary" id="createNoticeBtn"
					style="display: block; position: relative; top: 43%; right: 15px"
					onclick="createNotice();">작성하기</button>
			</div>
			<%}%>
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script>
			$(document).ready(function() {
				increaseCount();
			});
			
			function createNotice(){
				location.href="<%=contextPath%>/views/notice/noticeCreate.jsp";
			}
			
			function increaseCount() {
				$(".trNoticeList").click(function() {
					var noticeNo = $(this).children().first().text().trim();
					location.href="<%=contextPath%>/detail.shs?noticeNo="+noticeNo;
				});
			}
			</script>
		</div>
	</div>
	
	<%-- 
	<ul class="pagination justify-content-center"
		style="text-align: center;">
		<li><a href="javascript:void(0);" style="margin-right: 5px;"text-secondary"></a>◀</li>
		<li><a href="javascript:void(0);" style="margin-right: 5px;"text-secondary"></a>1</li>
		<li><a href="javascript:void(0);" style="margin-right: 5px;"text-secondary"></a>2</li>
		<li><a href="javascript:void(0);" style="margin-right: 5px;"text-secondary"></a>3</li>
		<li><a href="javascript:void(0);" style="margin-right: 5px;"text-secondary"></a>4</li>
		<li><a href="javascript:void(0);" style="margin-right: 5px;"text-secondary"></a>5</li>
		<li><a href="javascript:void(0);" style="margin-right: 5px;"text-secondary"></a>▶</li>
	</ul>
	--%>







	<%@include file="/views/common/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
		integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>