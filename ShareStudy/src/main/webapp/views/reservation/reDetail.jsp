<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<td colspan="3"><p>${reSuccessInfo.rvDate }</p></td>
			</tr>
			<tr>
				<th><p>이용 인원</p></th>
				<td colspan="3"><p>${reSuccessInfo.rvPeople } 명</p></td>
			</tr>
			<tr>
				<th><p>예약 금액</p></th> <%-- bAmount, pAmount 조건처리하기 --%>
				<td colspan="3"><p>${reSuccessInfo.roomName }</p></td>
			</tr>
		</table>
	</div>
	
	
	
</body>
</html>