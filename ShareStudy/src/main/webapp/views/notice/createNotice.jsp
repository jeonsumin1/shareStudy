<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<style>
	
	#noticeTitle{
		width: 600px;
	}

	#noticeContent{
		resize:none;
		width: 660px;
		height: 400px;
	}
	
	#createNoticeBtn{
		float: right;
		margin-right: 32.8%;
	}
	

</style>
</head>
<body>
	<%@include file="/views/common/menubar.jsp" %>
	<table align="center">
	<tr>
	</tr>
	<tr>
	</tr>
		<tr>
			<th width="60">제목 : </th>
			<th width="400">
			<input id="noticeTitle" type="text" placeholder="공지사항의 제목을 입력해주세요.">
			</th>
		</tr>
		<tr>
			<th>내용 : </th>
			<td></td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea id="noticeContent" placeholder="공지사항의 내용을 입력해주세요."></textarea>
			</td>
		</tr>
	</table>
	<div class="text-center mb-3">
			<button class="button-secondary" id="createNoticeBtn" style="display: block; top: 76%; right: 15px">작성하기</button>
	</div>
</body>
</html>