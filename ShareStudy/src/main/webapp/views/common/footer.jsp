<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  #footer {
	background-color: #f9f9f9;
	text-align: center;
	padding: 5px 0;
	margin: 0;
	
}

  #footer p{
  	font-size: 0.8em;
  	margin: 0;
 }

  #adminLogin{
	color: #f6f6f6;
	padding-left: 92%;
}

  #snsIcon{
  	width: 25px;
  	height: 25px;
  }
</style>
</head>
<body>
<div id="footer">
	<p>상호명 : 쉐어스터디㈜ &nbsp;&nbsp;&nbsp; 대표 : 3조의 누군가</p>
	<p>사업자 등록번호 : 000-00-00000 &nbsp;&nbsp;&nbsp; 통신판매업신고번호 : 1234-서울당산-1234</p>
	<p>영업소재지 : 서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F,20F &nbsp;&nbsp;&nbsp; 이메일 : ShareStudy@shs.kr</p>
	<p>제휴문의 : ShareStudy@Shs.kr</p>
	<p>대표전화 : 02-123-1234 (평일 am 10:00 ~ pm 06:00)</p>
	<p>쉐어스터디(이하 Shs)는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 Shs는 공간 거래정보 및 거래에 대해 책임지지 않습니다.</p>
	<a href="${contextPath}/share/views/manager/m_manager.jsp" style="float:right; color:grey; text-decoration:none;" >관리자 로그인</a>
	<img src="./resources/Icon/NaverBlog.png" alt="NaverBlogIcon" id="snsIcon">
	<img src="./resources/Icon/NaverPost.png" alt="NaverPostIcon" id="snsIcon">
	<img src="./resources/Icon/Instagram.png" alt="InstagramIcon" id="snsIcon">
	<img src="./resources/Icon/Twitter.png" alt="TwitterIcon" id="snsIcon">
	<img src="./resources/Icon/FaceBook.png" alt="FaceBookIcon" id="snsIcon">
</div>
</body>
</html>