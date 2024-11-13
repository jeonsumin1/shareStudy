<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	.rvList { 
    	width: 70%;
    	margin: auto;
    }
    
    .tbClass{
    	border: 1px solid gray;
    	border-radius: 10px;
    	height: 230px;
    }   
    
</style>

</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	
	<div class="rvList" align="center">
		<c:choose>
			<c:when test="${empty relist}">
				<div class="tbClass rvList" align="center">
					<p>조회된 예약 내역이 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="relist" items="${relist}">
				<div class="rvList tbClass">
					<div align="right">
						<form action="<%= contextPath %>/reMyDetail.shs" method="POST">
							<input type="hidden" value="${relist.rvNo}" name="rvNo">
							<button class="btnStyle btn btn-outline-light text-dark" style="margin-right: 3px;">상세보기</button>
						</form>
					</div>
					<table class="table table-bordered">
						<tr>
							<td>예약번호</td> 
							<td>${relist.rvNo}</td>
						</tr>
						<tr>
							<td>상품명</td>
							<td>${relist.roomNo}</td>
						</tr>
						<tr>
							<td>방문 날짜</td>
							<td>${relist.reDate}</td>
						</tr>
						<tr>
							<td>예약 인원</td>
							<td>${relist.rePeople}</td>
						</tr>
					</table>
					<br>
				</div>
				<br>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>	
	

	<br><br><br><br>
	<%@ include file="/views/common/footer.jsp" %>
	
</body>
</html>