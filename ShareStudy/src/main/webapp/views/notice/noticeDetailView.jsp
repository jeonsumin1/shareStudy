<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Notice n = (Notice) request.getAttribute("noticeDetail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<head>
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
			<h2>공지사항</h2>
		</div>
		<form action="<%=contextPath%>/noticeUpdate.shs" id="noticeForm">
			<input type="hidden" name="noticeNo" value=<%=n.getKey()%>>
			<div>
				<label for="postTitle">제목</label> <input type="text"
					id="nDetailTitle" name="nTitle" class="form-control"
					value="<%=n.getnTitle()%>" readonly>
			</div>
			<br>
			<div>
				<label for="postContent">내용</label>
				<textarea class="form-control" rows="4" id="nDetailContent"
					name="nContent" th:value="<%=n.getnContent()%>"
					th:text="<%=n.getnContent()%>" readonly><%=n.getnContent()%></textarea>
			</div>
			<br>
			<div>
				<label for="registerDate">작성일</label>
				<input type="text" id="createDate" name="createDate" class="form-control"
					   value="<%=n.getCreateDate()%>" th:value="${n.getCreateDate()}"
					   readonly>
			</div>
			<hr class="my-4">
			<div class="d-flex justify-content-end">
				<button class="btn btn-dark pull-right" onclick="location.href='<%=contextPath%>/noticeBoard.shs'"
						type="button">목록으로</button>
				<%if (userInfo != null && userInfo.getUserName().equals("관리자")) { %>
				<button class="btn btn-primary" type="button" id="noticeUpdate" name="noticeNo" onclick="submitForm('update')">수정</button>
				<button class="btn btn-danger" type="button" class="d-inline" onclick="submitForm('delete')">삭제</button>
				<%} %>
			<script>
			function submitForm(action) {
			    var form = document.getElementById('noticeForm');
			    if (action === 'update') {
			        form.action = "<%=contextPath%>/noticeUpdate.shs";
			        form.submit();
			    } else if (action === 'delete') {
			        if (confirm('정말 삭제하시겠습니까?')) {
			            form.action = "<%=contextPath%>/noticeDelete.shs";
			            form.submit();
			        } else {
			            return false;
			        }
			    }
			}
			</script>
		</div>
	</form>
</div>
	<div id="footer">
		<%@include file="/views/common/footer.jsp"%>
	</div>
</body>
</html>