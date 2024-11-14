<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
<style>
.outer {
   width: 1000px;
   margin: auto;
   padding: 20px;
}

.detail-table {
   width: 100%;
   border-collapse: collapse;
   margin: 20px 0;
}

.detail-table th {
   width: 150px;
   background-color: #f8f9fa;
   padding: 10px;
   text-align: left;
   border: 1px solid #ddd;
}

.detail-table td {
   padding: 10px;
   border: 1px solid #ddd;
}

.main-img {
   width: 100%;
   max-width: 500px;
   margin: 20px auto;
   display: block;
}

.sub-images {
   display: flex;
   justify-content: center;
   gap: 10px;
   margin: 20px 0;
}

.sub-images img {
   width: 150px;
   height: 150px;
   object-fit: cover;
   border: 1px solid #ddd;
   transition: all 0.3s ease;
}

.sub-images img:hover { /*마우스 올라가면 약가 투명하게 변하게*/
   opacity: 0.8;
   cursor: pointer;
}
</style>
</head>
<body>
   <%@ include file="/views/common/menubar.jsp"%>

   <div class="outer">
   	<h2 align="center">${room.roomName}</h2>

   	<table class="detail-table">
   		<tr>
   			<th>주소</th>
   			<td colspan="3">${room.roomAddress}</td>
   		</tr>
   		<tr>
   			<th>최대이용가능인원</th>
   			<td colspan="3">${room.roomSize}</td>
   		</tr>
   		<tr>
   			<th>이용가격</th>
   			<td colspan="3">${room.price}원</td>
   		</tr>
   		<tr>
   			<th>야간이용가능</th>
   			<td>${room.useNight == 'Y' ? '가능' : '불가능'}</td>
   			<th>주차가능</th>
   			<td>${room.parking == 'Y' ? '가능' : '불가능'}</td>
   		</tr>
   		<tr>
   			<th>취식가능</th>
   			<td colspan="3">${room.eating == 'Y' ? '가능' : '불가능'}</td>
   		</tr>
   	</table>

   	<div class="image-area">
   		<%-- 메인 이미지 --%>
   		<c:forEach items="${atList}" var="at">
   			<c:if test="${at.fileLevel == 1}">
   				<img src="<%=contextPath%>${at.filePath}${at.changeName}"
   					class="main-img" id="mainImg">
   			</c:if>
   		</c:forEach>

   		<%-- 추가 이미지들 --%>
   		<div class="sub-images">
   			<c:forEach items="${atList}" var="at">
   				<c:if test="${at.fileLevel > 1}">
   					<img src="<%=contextPath%>${at.filePath}${at.changeName}"
   						onmouseover="changeMainImage('<%=contextPath%>${at.filePath}${at.changeName}')"
   						onmouseout="restoreMainImage()">
   				</c:if>
   			</c:forEach>
   		</div>
   	</div>



   	<div align="center">
   		<button type="button" class="btn btn-primary"
   			onclick="location.href='<%= contextPath %>/reservation.re?rno=${room.roomNo}'">예약하기</button>
   		<button type="button" class="btn btn-secondary"
   			onclick="location.href='<%=contextPath%>/room/list.shs'">목록으로</button>
   	</div>

   	<%-- 관리자만 볼 수 있는 버튼 --%>
   	<c:if test="${'admin' eq userid}">
   		<div align="center" style="margin-top: 20px;">
   			<button type="button" class="btn btn-warning"
   				onclick="location.href='<%=contextPath%>/updateForm.shs?rno=${room.roomNo}'">수정하기</button>
   		
   		</div>
   	</c:if>

   	<br>
   	<br>
   	<br>
   	<br>
   	<br>
   </div>

   <script>
   	// 원본 메인 이미지 URL을 저장할 변수
   	let originalMainImage = '';

   	// 페이지 로드시 원본 메인 이미지 URL 저장
   	window.onload = function() {
   		originalMainImage = document.getElementById('mainImg').src;
   	}

   	// 마우스 올렸을 때 이미지 변경
   	function changeMainImage(src) {
   		document.getElementById('mainImg').src = src;
   	}

   	// 마우스 뗐을 때 원본 이미지로 복구
   	function restoreMainImage() {
   		document.getElementById('mainImg').src = originalMainImage;
   	}

   	// 수정페이지 이동
   	function showUpdateForm(roomNo) {
   		location.href = '<%=contextPath%>/room/updateForm.shs?rno=' + roomNo;
   	}

   	
   	
   </script>

   <div id="footer">
   	<%@include file="/views/common/footer.jsp"%>
   </div>
</body>
</html>