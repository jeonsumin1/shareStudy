<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int noticeNo = (Integer)request.getAttribute("noticeNo");
String nTitle = (String)request.getAttribute("nTitle");
String nContent = (String)request.getAttribute("nContent");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<meta charset="utf-8">
<link th:href="@{/css/bootstrap.min.css}"
	href="../css/bootstrap.min.css" rel="stylesheet">
<style>

html, body {
    height: 100%;
    margin: 0;
    display: flex;
    flex-direction: column;
}
.container {
    max-width: 700px;
    padding-bottom: 20px;
    flex: 1;
}

.field-error {
	border-color: #dc3545;
	color: #dc3545;
}

#nTitle, #nContent, #createDate {
	background-color: white;
}

#footer {
    width: 100%;
    background-color: #f8f9fa;
    padding-top: 20px;
    margin-top: 20px;
    text-align: center;
}
</style>
</head>
<body>
	<%@include file="/views/common/menubar.jsp"%>
	<div class="container">
		<div class="py-5 text-center">
			<h2>공지사항 수정</h2>
		</div>
		<form action="<%=contextPath%>/noticeUpdate.shs" method="post">
			<input type="hidden" name="nDetailKey" value="<%=noticeNo%>">
			<div>
				<label for="postTitle">제목</label>
				<input type="text" id="nUpdateTitle" name="nUpdateTitle" class="form-control" value="<%=nTitle%>">
			</div>
			<br>
			<div>
				<label for="postContent">내용</label>
				<textarea class="form-control" rows="4" id="nUpdateContent" name="nUpdateContent" th:value="<%=nContent%>" th:text="<%=nContent%>"><%=nContent%></textarea>
			</div>
			<br>
			<hr class="my-4">
			<div class="d-flex justify-content-end">
				<button class="btn btn-dark pull-right" onclick="location.href='<%=contextPath%>/noticeBoard.shs'" type="button">목록으로</button>
				<%if (userInfo != null && userInfo.getUserName().equals("관리자")) { %>
				<button class="btn btn-primary" type="submit" id="noticeUpdate" name="noticeNo">수정하기</button>
			<%} %>
		</div>
	</form>
</div>
	<div id="footer">
		<%@include file="/views/common/footer.jsp"%>
	</div>
</body>
</html>