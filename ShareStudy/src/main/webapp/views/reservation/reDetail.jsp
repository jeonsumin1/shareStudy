<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 정보 확인</title>

<style>
	    
    .suc{
    	border: 1px solid rgba(255, 166, 0, 0.774); 
    	background-color: rgba(255, 166, 0, 0.774);
    	text-align: center;
    	padding : 1% 0% 0% 0%;
    }
    
    #reTable {
    	width: 60%;
    	margin: auto;
    	border-radius: 5px 5px 0px 0px;
    	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    
    #reTable th {
    	width: 200px; 
    	background-color: #f8f9fa;
	}	
	
	.suc p{
		font-size: 12px; 
		color: red;
		background-color: white;
		width: 350px;
		margin: auto;		
		margin-bottom: 1%;
	}
	
	.remove{
		border: 1px solid lightgray; 
    	background-color: lightgray;
	}
	.remove p{
		margin: 8px 10px 10px 10px;
		font-size: 12px;
	}
	
	button{
		margin-top: 10px;
		background-color: rgba(255, 166, 0, 0.774);
		border-color: rgba(255, 166, 0, 0.774);
		
	}
	
	button:hover{
		background-color: rgba(255, 217, 175, 1);
		border-color: rgba(255, 217, 175, 1);
		
	}
	.btnDiv{
		margin-top: 10px; 
		
	}
</style>


</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	<!-- 예약 완료 정보 - 예약한 상품 명, 예약 번호, 이용 인원, 예약 날짜, 예약 금액, 야간 이용/주차/취식여부  -->
	
	<br>
	<div> 
		<div class="suc" id="reTable">
			<h4>예약 확정 정보</h4>
			<p>** 무통장 입금은 입금 확인 후 예약이 완료됩니다.</p>
		</div>
		
		<table id="reTable" class="table table-bordered">
			<tr>
				<th><p>예약 번호</p></th>
				<td colspan="3">${reSuccessInfo.rvNo}</td>
			</tr>
			<tr>
				<th><p>상품명</p></th>
				<td colspan="3"><p>${reSuccessInfo.roomName }</p></td>
			</tr>
			<tr>
				<th><p>예약 날짜</p></th>
				<td colspan="3">${reSuccessInfo.rvDate }</td>
			</tr>
			<tr>
				<th><p>예약자 명</p></th>
				<td colspan="3"><p>${reSuccessInfo.userId }</p></td>
			</tr>
			<tr>
				<th><p>이용 인원</p></th>
				<td colspan="3"><p>${reSuccessInfo.rvPeople } 명</p></td>
			</tr>
			<tr>
				<th><p>예약 금액</p></th> 
				<td colspan="3"><p>
				<%-- bAmount, pAmount null 값이 아닌 값을 보여주기 --%>
				<c:choose>
					<c:when test="${not empty reSuccessInfo.bAmount}">
						${reSuccessInfo.bAmount } 원
					</c:when>
					<c:otherwise>
						${reSuccessInfo.pAmount } 원
					</c:otherwise>
				</c:choose>
			</p></td>
			</tr>
		</table>
		<div class="remove" id="reTable" style="border-radius: 0px;">
			<p> ** 취소 관련 사항은 호스트 또는 관리자에게 직접 문의하시기 바랍니다.</p>
		</div>
		<div align="center" class="btnDiv">
			<button onclick="location.href='<%= contextPath%>/rvlist.shs'">목록으로</button>
			<!-- history.back()을 사용할 경우 예약하기 페이지에서는 예약 내역 목록이 아닌 예약페이지로 다시 돌아간다. -->
		</div>
		
	</div>
	
	<script>
			var rvNo = "${reSuccessInfo.rvNo}";
	        var roomName = "${reSuccessInfo.roomName}";
	        var rvDate = "${reSuccessInfo.rvDate}";
	        var userId = "${reSuccessInfo.userId}";
	        var rvPeople = "${reSuccessInfo.rvPeople}";
	        var bAmount = "${reSuccessInfo.bAmount}";
	        var pAmount = "${reSuccessInfo.pAmount}";

	        console.log("rvNo: " + rvNo);
	        console.log("roomName: " + roomName);
	        console.log("rvDate: " + rvDate);
	        console.log("userId: " + userId);
	        console.log("rvPeople: " + rvPeople);
	        console.log("bAmount: " + bAmount);
	        console.log("pAmount: " + pAmount);
			
	
		
	</script>
	<br><br><br><br><br><br><br>
	<%@ include file="/views/common/footer.jsp" %>
	
</body>
</html>