<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
    .input input, .input textarea{
        width: 100%;
		height: 3%;
    }
   .outer{
    	width: 700px; /* 페이지 너비 */
        margin: auto; /* 페이지 중앙 정렬 */
        margin-top: 50px;
        text-align: left;
    }
	
	h2{
		text-align: center;
		/*display:center;*/
	}
	
	hr{
		width: 100%;
	}

	img{
		width: 100%;
	}

	.i{
		padding:5%;
	}
	
	.text {
		font-weight: bold;
	}
	
	.radio{
		display: inline-flex;
        margin-right: 5%;
	}
	
	.radio label{
		margin-left: 10px; 
	}
	
	#divBor{
		border: 2px solid lightgray ;
		padding: 3%;
		border-radius: 5px;
	}
	

</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	
	<div class="outer" align="center">
	
		<h2>예약하기</h2>
		<hr>
		    <div>	    
	            <div class="i">
		            <div><h4>상품명</h4></div> <!-- 상세페이지에서 클릭한 상품 pk를 이용하여 상품명 불러오기 -->
		            <div>
			            <img src="../../resources/스터디룸.jpg" >  <!-- 상품 사진으로 불러오기 -->
		            </div>
		            <br>
		            <div class="st" id="stDiv">
		                <p>* 상품 정보 * </p>  <!-- db 에서 정보 가져오기 -->      
		                <p>상품 가격</p>       <!-- db 에서 정보 가져오기 -->
		                <p>주차 가능 유무</p>  <!-- db 에서 정보 가져오기 -->
		                <p>취식 가능 유무</p>  <!-- db 에서 정보 가져오기 -->
		                 
					</div>	          
				</div>
				
				<br>
				
				<div class="input">
					<div class="text"><p>예약 정보 입력</p></div>	       
				    <hr>
			    	<div class="i">
		                <div>
			                <p> 예약 날짜 </p>
		                	<input type="date" name="rvDate" id="rvDate" class="form-control" required onchange="selDate();">
		                </div>
		                <br>
		               
		                <div>
			                <p> 예약 인원 수 </p>
		                	<input type="number" name="rvUser" id="rvUser" class="form-control" min="1" max="50" required oninput="selDate();"> <!-- 입력 시 값을 보여줄 수 있도록 oninput 사용 -->
		                		<!-- 각 상품별 예약 가능 입원수로 제한? --ROOM_SIZE를 가져와서 max에 넣어주면 될 듯. -->
		                		<!-- 상품 정보 테이블에서 사용 가능 인원 불러와서 max에 넣어주기? -->
		                </div>
		              
				        <div><input type="hidden"></div> <!-- 사용자 아이디, 룸 (상품) 번호 받아와야 한다. -->
									 
				        <br>
				        <div>
					        <p> 성명 </p>
					        <input type="text" name="userName" id="userName" class="form-control" value="예약자" readonly>  <!-- 로그인한 사용자 이름 불러오기 -->
				        </div>
				
						<br>
						<div>
					        <p> 휴대폰 번호 </p>
					        <input type="text" name="phone" id="phone" class="form-control" value="010-1111-1111" readonly>
						</div>
					
						<br>
						<div>
					        <p> 요청사항 </p>
					        <textarea id="request" name="request" class="form-control" cols="50" rows="5" style="resize:none;" placeholder="남기고 싶은 말을 적어주세요. (최대 500글자)"></textarea>
						</div>
						<button onclick="check();" class="btn btn-block" style="background-color: #a3c296; font-weight: bold;">확인하기</button>
					</div>
			    </div>
			    <br><br>
			   
			    <div class="text"><p>결제 예정 금액</p></div>
			    <hr>
			    <div class="i">
			    	<!-- 상품 정보에 있는 price 가져오기 -->
			    	<!--  위에서 선택한 예약 날짜/예약인원 정보 보여주기  -->
			    	<table class="table table-bordered">
			    		<tr>
			    			<th>예약 날짜</th>
			    			<td id="selDate"></td>
			    			
			    		</tr>
			    		<tr>
			    			<th>예약 인원</th>
			    			<td id="selUser"></td>
			    		</tr>
			    	</table>
			    	<hr>  <!-- text-align은 block 요소에만 사용됨.  -->
			    	<div style="text-align: right;"><h4><strong> ₩ 40,000</strong></h4></div> <!-- price 값 가져오기 -->
			    </div>
				
				<div id="divBor"> 
					<strong>환불 규정 안내</strong>
					<br><br>
					<p style="color:red;">환불 관련 사항은 호스트에게 직접 문의하시기 바랍니다.</p>
				</div>	
				    
			    
			    <br><br>
			    <div id="pay">
			        <div class="text"> <p>결제 방법</p> </div>
				    <hr>
				    <div class="i" id="divBor">
				    	<p>결제 수단 선택</p>
				        <div class="radio">
				            <input type="radio" name="card" id="card" value="신용카드"><label for="card" class="itext">신용카드</label>
				        </div>
						
				        <div class="radio">
				            <input type="radio" name="card" id="bankTransfer" value="무통장 입금"><label for="bankTransfer" class="itext">무통장 입금</label>  
				        </div>
				        
				        <div class="radio">
				            <input type="radio" name="card" id="kpay" value="카카오페이"><label for="kpay" class="itext">카카오페이</label>  <!-- 신용카드 기능 구현 후 추가 구현하기 -->
				        </div>
					</div>
			    </div>
			    
			    <br><br>
			    
			    <div id="divBor"> 
			    	<strong>서비스 동의</strong> 
					<div align="right" id="check">
						<input type="checkbox" name="agreement" id="allCheck" required> <label>전체동의</label>
					</div>
					<br>
					<input type="checkbox" name="agreement" id="ag1" required> <label>위 공간의 예약 조건 확인 및 결제 진행 동의</label> <br>
					<input type="checkbox" name="agreement" id="ag2" required> <label>환불 규정 안내에 대한 동의</label> <br>
					<input type="checkbox" name="agreement" id="ag3" required> <label>개인정보 제3자 제공 동의</label> <br>
					<input type="checkbox" name="agreement" id="ag4" required> <label>개인정보 수집 및 이용 동의</label> <br>
			    </div>				    
		    </div>
		   
		   <br><br>
		    <button onclick="isnertReservation();" class="btn btn-block" style="background-color: #a3c296; font-weight: bold;">결제하기</button>

	    
	    <script>
	    	function check(){
	    		console.log($("#rvDate").val());
	    		console.log($("#rvUser").val());
	    		console.log($("#userName").val());  <%-- --%>
	    		console.log($("#phone").val());
	    		console.log($("#request").val());
	    		console.log($("input[name='card']:checked").val());
	    		
	    		var result = $("input[name='card']:checked").val();
	    		$("#result").text(result);
	    		
	    	}
	    	
	    	<%-- 결제 예정 금액 테이블에 선택한 날짜와 예약 인원 표시 --%>
	    	function selDate(){
	    		console.log($("#rvDate").val());
	    		console.log($("#rvUser").val());
	    		
	    		var selectDate = $("#rvDate").val();
	    		var selectUser = $("#rvUser").val();
	    		
	    		$("#selDate").text(selectDate);
	    		$("#selUser").text(selectUser+ " 명");	
	    		
	    		
	    		
	    	}
	    	
	    <%--
	    	function isnertReservation(){
				$.ajax({
					url : "<%= contextPath %>/reservation.re",
					type: "post",
					data: {
						rvDate: $("#rvDate").val(),
				        rvUser: $("#rvUser").val(),
				        userName: $("#userName").val(),
				        phone: $("#phone").val(),
				        request: $("#request").val()
					}
					success : function(){
						// 성공했을 경우 입력받은 데이터들을 DB 테이블에 넣어준다. 
						alert("예약이 완료되었습니다.");
					}, 
					error: function(){
						alert("예약 중 오류 발생.");
					}
				});
				
			}
	    
	    --%>
	    
	    </script>
	    
	    
	    <br><br><br><br><br><br>
	</div>	
</body>
</html>