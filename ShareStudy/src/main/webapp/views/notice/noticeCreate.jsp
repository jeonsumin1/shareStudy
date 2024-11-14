<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
    User userInfo2 = (User) session.getAttribute("userInfo");

    // 권한 체크: "관리자"가 아닐 경우 메인 페이지로 리다이렉트
    if (userInfo2 == null || !"관리자".equals(userInfo2.getUserName())) {
        session.setAttribute("alertMsg", "접근 권한이 없습니다.");
        response.sendRedirect(request.getContextPath());
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<style>
	.col-md-12{
		margin: auto;
	}
	
	#nContent{
		height: 500px;
	}
</style>
</head>
<body>
	<%@include file="/views/common/menubar.jsp"%>
	
	<div class="container">
		<div class="d-flex justify-content-center align-items-center"style="min-height: 100vh;">
			<div class="col-md-6">
				<form action="<%=contextPath%>/createNotice.shs" method="post">
					<div class="form-group" style="align: center">
						<label for="title">제목</label> <input type="text"
							class="form-control" id="nTitle" name="nTitle" placeholder="제목을 입력해주세요">
					</div>
					<br>
					<div class="form-group" style="align: center">
						<label for="content"> 내용 </label>
						<textarea class="form-control" id="nContent" name="nContent" style="resize: none"
							placeholder="내용을 입력해주세요"></textarea>
					</div>
				
				<br>
				<a href="<%=contextPath%>/noticeBoard.shs" role="button" class="btn btn-secondary">취소</a>
				<button type="submit" class="btn btn-primary" id="btn-save">등록</button>
				</form>
			</div>
		</div>
	</div>
	<%@include file="/views/common/footer.jsp"%>

</body>
</html>