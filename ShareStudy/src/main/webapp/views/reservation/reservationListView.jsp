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
	 	border: 1px solid #ddd;
    	width: 60%;
    	margin: auto;
    	margin-top: 50px;
    	border-radius: 10px;
    }
    
    .tbClass{
    	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
    	margin-top: 20px;
    	height: 10%;
    }   
    
    .i{
    	display: flex;
    	justify-content: space-between;
    	align-items: center;
    	margin-top: 10px;
    }
    .btnStyle{
    	border:none;
    	background-color: rgba(255, 166, 0, 0.774);
    	font-size: 12px;
    	margin: 1px;
    	border-radius: 10px;
    }
    .btnStyle:hover{
    	background-color: rgba(255, 217, 175, 1);
    	
    }
</style>

</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	
	<div class="rvList" align="center">
		<c:choose>
			<%-- 예약 내역이 없을 때 --%>
			<c:when test="${empty relist}">
				<div class="tbClass rvList" align="center">
					<p>조회된 예약 내역이 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<%-- 예약 내역이 있을 때.--%>
				<c:forEach var="relist" items="${relist}">
				<div class="rvList tbClass">
					<div align="left">
						<div class="i">&nbsp; ◎ &nbsp;${relist.roomNo}
							<div align="right">
								<!-- 상세보기 클릭 시 상품 예약 상세보기 페이지로 이동. hidden 사용하여 상품 번호 가려서 보내기. -->
								<form action="<%= contextPath %>/reMyDetail.shs" method="POST">
									<input type="hidden" value="${relist.rvNo}" name="rvNo">
									<button class="btnStyle " style="margin-right: 10px;">상세보기</button>
								</form>
							</div>
						</div>
						<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;예약일 :&nbsp; ${relist.reDate.substring(0,11)}</div>
					</div>
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