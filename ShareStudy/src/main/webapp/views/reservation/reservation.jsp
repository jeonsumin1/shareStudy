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
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script> -->
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
	
	.divBor{
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
		                	<input type="number" name="rePeople" id="rePeople" class="form-control" min="1" max="50" required oninput="selDate();"> <!-- 입력 시 값을 보여줄 수 있도록 oninput 사용 -->
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
					        <textarea id="rvRequest" name="rvRequest" class="form-control" cols="50" rows="5" style="resize:none;" placeholder="남기고 싶은 말을 적어주세요. (최대 500글자)"></textarea>
						</div>
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
				
				<div class="divBor">
					<strong>환불 규정 안내</strong>
					<br><br>
					<p style="color:red;">환불 관련 사항은 호스트에게 직접 문의하시기 바랍니다.</p>
				</div>	
				    
			    <br><br><br>
			   
			    <div>
			        <div class="text"> <p>결제 방법</p> </div>
				    <hr>
				    <div class="i divBor">
				    	<p>결제 수단 선택</p>
				        <div class="radio">
				            <input type="radio" name="rvPayment" id="bankTransfer" value="무통장입금" onclick="Rvbank();"><label for="bankTransfer" class="itext">무통장입금</label>
				        </div>
					  
					
				        <div class="radio">
				            <input type="radio" name="rvPayment" id="card" value="신용카드"><label for="card" class="itext">신용카드</label>
				        </div>
						
				       
				        <div class="radio">
				            <input type="radio" name="rvPayment" id="kpay" value="카카오페이"><label for="kpay" class="itext">카카오페이</label>  <!-- 신용카드 기능 구현 후 추가 구현하기 -->
				        </div>
					</div>
			    </div>
			    <br><hr><br>
			   
			    <!-- 무통장입금을 눌렀을 경우 하단에 입금 정보 입력 -->
				<!-- 입금은행, 입금자, 입금예정일 -->
				
				<div class="i divBor" id="bInfo" style="display:none;">
					<div>
					   입금은행:
		               <select name="bank" class="form-control">
		               	   <option value="NO" selected>입금 은행 선택</option>
                              <option value="기업은행">기업은행 / 521-458845-01-255 / 쉐어스터디(주) </option>
                              <option value="국민은행">국민은행 / 465201-01-222569 / 쉐어스터디(주) </option>
                          </select>
					</div>
					
					<br>
					
					<div>
		               입금자 명 <input type="text" name="usserName" id="userName" class="form-control">
					</div>
					
					<br>
					
					<div>
		               입금예정일 <input type="date" class="form-control">
		               <!-- 7일 이후에는 선택 못하도록 조건처리하기 -->
					</div>				              
				</div>
					  
				<br><br>
			  
			    <div class="divBor">
			    	<strong>서비스 동의</strong>
					<div align="right" id="check">
						<input type="checkbox" class="agr" id="all" onclick="chkAll();" required><label for="all"> 전체동의</label>
					</div>
					<br>
					<input type="checkbox" class="agr" name="agreement" id="ag1" required> <label for="ag1">위 공간의 예약 조건 확인 및 결제 진행 동의 (필수)</label>  <br>
					<input type="checkbox" class="agr" name="agreement" id="ag2" required> <label for="ag2">환불 규정 안내에 대한 동의 (필수)</label>  <br>
					<input type="checkbox" class="agr" name="agreement" id="ag3" required> <label for="ag3">개인정보 제3자 제공 동의 (필수)</label>  <br>
					<input type="checkbox" class="agr" name="agreement" id="ag4" required> <label for="ag4">개인정보 수집 및 이용 동의 (필수)</label>  <br>
			    </div>				   
		    </div>
		 
		   <br><br>
		    <button onclick="insertReservation();" class="btn btn-block" style="background-color: #A3C296; font-weight: bold;">결제하기</button>
	  
	    <script>
	    
			<%-- 무통장 입금 클릭시 결제 정보 입력 영역 보여주기 --%>
			function Rvbank(){
				var bankTransfer = $("#bankTransfer");
				
				if(bankTransfer.checked){
					$("#bInfo").css("display","block");
				}else{
					$("#bInfo").css("display","none");
				}
			}
			
	    	<%-- 결제 예정 금액 테이블에 선택한 날짜와 예약 인원 표시 --%>
	    	function selDate(){
	    		//console.log($("#rvDate").val());
	    		//console.log($("#rePeople").val());
	    		
	    		var selectDate = $("#rvDate").val();
	    		var selectUser = $("#rePeople").val();
	    		
	    		$("#selDate").text(selectDate);
	    		$("#selUser").text(selectUser + " 명");	
	    		
	    	}
	    	
	    	// 서비스 동의 전체 체크
	    	function chkAll(){
	    		//console.log($("#all"));
	    		//console.log($("input[name='agreement']"));
	    		
	    		var all = $("#all")[0]; /* Object 타입으로 반환 → 0번 인덱스에 있는 input 요소를 가져와야 한다.*/
	    		
	    		var sub = $("input[name='agreement']");
	    		
	    		if(all.checked){	    			
	    			// 나머지 요소에 접근하여 속성 checked true로 변경	
	    			for(var i=0; i<sub.length; i++){
    					sub[i].checked = true;
	    			}
	    			
	    		}else{ // 체크 해제
	    			for(var i=0; i<sub.length; i++){
    					sub[i].checked = false;
	    			}
	    		}		
	    	}
	    	
	    	function insertReservation(){
	    		var rvDate = $("#rvDate").val();
				var rePeople = $("#rePeople").val();
				var userName = $("#userName").val();
				var rvRequest = $("#rvRequest").val();
				var rvPayment = $("input[name='rvPayment']:checked").val();
	    		var agrementChk = $("input[name='agreement']:checked").length;
	    		
	    		console.log($("input[name='agreement']"));
	    		
	    		var sub = $("input[name='agreement']");
	    		console.log(sub.length);
	    		// 무통장입금체크 시 페이지
	    		console.log($("#bankTransfer").val());	    		
	    		console.log($("#card").val());	    		
	    		console.log($("#kpay").val());	    		
	    		// 신용카드 체크 시 페이지
	    		
	    		// 카카오페이 체크 시 페이지	
	    		
				<%-- 예약 날짜, 인원수, 결제 방법 미입력시 focus --%>
	    		if(!rvDate || !rePeople || !rvPayment){
	    			if(!rvDate){
		    			$("#rvDate").focus();
		    			return;
		    		}
	    			if(!rePeople){
		    			$("#rePeople").focus();
		    			return;
		    		}
	    			if(!rvPayment){
		    			alert("결제 수단을 입력해 주세요.");
		    			$(".radio").parent().css("border-color", "red").focus();
		    			return;
		    		}
	    		}
	    		
	    		<%-- 서비스 전체동의를 하지 않은 경우 결제 불가능하게 하기.
	    			 	| ** → DB 컬럼 추가. [서비스 동의 여부]
	    				| ** → 전체 동의를 했을 경우 Y로 저장되게 하기.
	    		--%>
	    		
	    		if(agrementChk !== sub.length){
	    			alert("서비스 동의를 해주시기 바랍니다.");
	    			
	    			// 체크되지 않은 체크박스 찾아서 focus
	    			for(var i = 0; i < sub.length; i++) {
	    	            if (!sub[i].checked) {
	    	                $(sub[i]).next('label').css("color", "red").focus();
	    	                break;
	    	            }else{
	    	                $(sub[i]).next('label').css("color", "black").focus();	    	           
	    	            }
	    	        }
	    			
	    	        return;
	    		}
	    		
	 
				$.ajax({
					url : "<%= contextPath %>/reservation.re",
					type: "POST",
					data: {
						rvDate: rvDate,
				        rePeople: rePeople,
				        userName: userName,
				        rvRequest: rvRequest,
				        rvPayment : $("input[name='rvPayment']:checked").val()  <%-- check되어있는 현재 값을 가져와야 한다. --%>
					},
					success : function(){
						// 성공했을 경우 입력받은 데이터들을 DB 테이블에 넣어준다.
						alert("예약이 완료되었습니다.");
					},
					error: function(){
						alert("예약 중 오류 발생.");
					}
				});
			}
	   
	   
	    </script>
	  
	  
	    <br><br><br><br><br><br>
	</div>	
</body>
</html>