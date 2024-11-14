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
  
  
  <!-- 결제를 위한 라이브러리 추가 (iamport) -->
  <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
  
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
	.imgSt{
		margin-right: 30px;
	}
	
	.areSt{
		color : red;
	}
	table{
		background-color: #f8f9fa;
	}
	table th{
		width: 150px;
	}
	
	.roomInfo{
		padding-top: 30px;
		display: flex;
		justify-content: space-between; /* 아이템 사이에 균일한 간격을 만들어 준다. */
	}
	
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	
	<%-- 임시. 상품 상세 페이지에서 예약 버튼 클릭시 로그인하지 않은 경우 로그인 후 예약 할 수 있도록 조건처리 
		 - 비회원 예약 추가할 경우 비회원/로그인 예약 페이지 따로 생성.?
	--%>
	<div class="outer" align="center">
		 
		<c:if test="${not empty userInfo}">
		
			<h2>예약 정보 작성</h2>
			<hr>
			    <div>	  
			    	<div><h4>${room.roomName}</h4></div> <!-- ${room.roomName}    상세페이지에서 클릭한 상품 pk를 이용하여 상품명 불러오기 -->
			        <div class="roomInfo">
			            <div class="imgSt">
			            	<!-- 룸정보 중 filePath가 1인 것만 보여준다. -->
			           		<c:forEach var="atList" items="${atList}">
				            	<c:if test="${atList.fileLevel == 1}">
				            		<img alt="예약룸사진" src="<%= contextPath %>${atList.filePath}${atList.changeName}">
				            	</c:if>
			           		</c:forEach>
				        </div>
			            <br>
			            <div class="" id="stDiv" style="width: 500px;">
			            	<table class="table table-bordered">
			            		<tr>
			            			<th>가격</th>
			            			<td>${room.price} 원</td> <!-- 수정  -->
			            		</tr>
			            		<tr>
			            			<th>이용 가능 인원</th>
			            			<td>${room.roomSize} 명</td> <!-- 수정  -->
			            		</tr>
			            		<tr>
			            			<th>야간이용</th>
			            			<td>${room.useNight == "Y" ? "가능":"불가능"}</td>
			            		</tr>
			            		<tr>
			            			<th>주차</th>
			          	  			<td>${room.parking == "Y" ? "가능":"불가능"}</td>
			            		</tr>
			            		<tr>
			            			<th>취식</th>
			            			<td>${room.eating == "Y" ? "가능":"불가능"}</td>
			            		</tr>
			            	</table>
			               
						</div>	        
					</div>
					
					<br>
					
					<div class="input">
						<div class="text"><p>예약 정보 입력</p></div>	     
					    <hr>
				    	<div class="i">
			                <div>
				                <p> 예약 날짜 </p>
			                	<input type="date" name="rvDate" id="rvDate" min="2024-11-06" class="form-control" required onchange="selDate();">
			                </div>
			                <br>
			             
			                <div>
				                <p> 예약 인원 수 </p>
				                <!-- 전달받은 예약 인원 수 만큼 option 생성  -->
			                	<select name="rePeople" class="form-control" oninput="selDate();" required ></select>
			                </div>
			            
					        <br>
					        <div>
						        <p> 성명 </p>
						        <input type="text" name="userName" id="userName" class="form-control" value="${ userInfo.userName }" readonly>  <!-- 로그인한 사용자 이름 불러오기 -->				        </div>
					
							<br>
							<div>
						        <p> 휴대폰 번호 </p>
						        <input type="text" name="phone" id="phone" class="form-control" value="${ userInfo.userPhone }" readonly>
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
				    	<h4 align="right">₩<strong style="margin-left: 3%;">${room.price}<%-- 수정 ${room.price} --%></strong></h4> 
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
					    <div class="i divBor" id="payRadio">
					    	<p>결제 수단 선택</p>
					        <div class="radio">
					            <input type="radio" name="rvPayment" id="bankTransfer" value="bank"><label for="bankTransfer" class="itext">무통장입금</label>
					        </div>
						  
						
					        <div class="radio">
					            <input type="radio" name="rvPayment" id="card" value="card"><label for="card" class="itext">신용카드</label>
					        </div>
							
						</div>
				    </div>
				    <br><hr><br>
				   
				    <!-- 무통장입금을 눌렀을 경우 하단에 입금 정보 입력 -->
					<!-- 입금은행, 입금자, 입금예정일 -->
					
					<div class="i divBor" id="bInfo" style="display:none;">
						<div>
						   입금은행:
			               <select name="bank" class="form-control" required>
			               	   <option value="NO" disabled selected>입금 은행 선택</option>
	                           <option value="KI">기업은행 / 521-458845-01-255 / 쉐어스터디(주) </option>
	                           <option value="KUK">국민은행 / 465201-01-222569 / 쉐어스터디(주) </option>
	                       </select>
						</div>
						
						<br>
						
						<div>  
			               입금자 명 <input type="text" id="rvName" class="form-control" required>
						</div>
						
						<br>
						
						<div>
			               입금예정일 <input type="date" class="form-control" id="payDate" required>
			               <!-- 7일 이후에는 선택 못하도록 조건처리하기 -->
						</div>	
	
						<p style="color:red; font-size:12px;">* 무통장입금은 입금 완료 확인 후 예약이 확정됩니다.</p>		              
					</div>
						  
					<br><br>
				  
				    <div class="divBor">
				    	<strong>서비스 동의</strong>
						<div align="right" id="check">
							<input type="checkbox" class="agr" id="all" onclick="chkAll();" required><label for="all">전체동의</label>
						</div>
						<br>
						<input type="checkbox" class="agr" name="agreement" id="ag1" required> <label for="ag1">위 공간의 예약 조건 확인 및 결제 진행 동의 <span class="areSt">(필수)</span></label>  <br>
						<input type="checkbox" class="agr" name="agreement" id="ag2" required> <label for="ag2">환불 규정 안내에 대한 동의 <span class="areSt">(필수)</span></label>  <br>
						<input type="checkbox" class="agr" name="agreement" id="ag3" required> <label for="ag3">개인정보 제3자 제공 동의 <span class="areSt">(필수)</span></label>  <br>
						<input type="checkbox" class="agr" name="agreement" id="ag4" required> <label for="ag4">개인정보 수집 및 이용 동의 <span class="areSt">(필수)</span></label>  <br>
				    </div>				   
			    </div>
			 
			   <br><br>
			   <button onclick="insertReservation();" class="btn btn-block" style="background-color: rgba(255, 166, 0, 0.774); font-weight: bold;">결제하기</button>
		 
		</c:if>
		
	</div>
	  
<br><br><br><br><br><br>
<%@ include file="/views/common/footer.jsp" %> 
	  
	    <script>
	 		 		
		    $(function(){
		    	
		    	<%-- input type date 날짜 제한 --%>
		 		var rvDate = $("#rvDate")
		 		var d = new Date();  
		 		
		 		var stDate = (d.getFullYear()+"-"+(d.getMonth()+1).toString().padStart(2, '0')+"-"+d.getDate().toString().padStart(2, '0'));

		 		var laDate = new Date(stDate);  // 한국 표준시로 나온다. 
		 		laDate.setMonth(laDate.getMonth() + 1);
		 		laDate.setDate(laDate.getDate() - 1);
		 		laDate = (laDate.getFullYear()+"-"+(laDate.getMonth()+1).toString().padStart(2, '0')+"-"+laDate.getDate().toString().padStart(2, '0'));
		 		
		 		// 예약 일자 선택 
		 		rvDate.attr("min", stDate);
		 		rvDate.attr("max", laDate);

		 		// 무통장 입금 당일 입금만 가능하도록 지정.  
		 		$("#payDate").attr("min", stDate);
		 		$("#payDate").attr("max", stDate);
		 		
		 		
		 		<%-- 결제방법 무통장 입금 선택 시에만 입금 정보 입력하도록 하는 함수 --%> 
		    	$("input[type='radio']").on("click", function(){
			    	// 라디오 버튼 중 bankTransfer를 체크했을 경우에만 화면이 보여지게 하기 // 무통장 입금		
		    												//$("선택자").is("선택자") <br> (선택 요소 일치 여부 판단 → 논리값 반환)
		    		if($("#bankTransfer").is(":checked")){
		    			$("#bInfo").css("display","block");
		    		}else{
		    			$("#bInfo").css("display","none");
					}
		    	});
		    	
		    	
		    	<%-- 전달받은 예약 인원 만큼 select 박스 생성 --%>
		    	var rePeople = $("select[name='rePeople']");
		    	for(var i=1; i<=${room.roomSize}; i++){ //
		    		rePeople.append($("<option>").val(i).text(i));
		    	}
		    	
		    });
		    
		    <%-- 결제 예정 금액 테이블에 선택한 날짜와 예약 인원 표시 --%>
	    	function selDate(){ 
	    		//console.log($("#rvDate").val());
	    		//console.log($("#rePeople").val());
	    		var selectDate = $("#rvDate").val();
	    		var selectUser = $("select[name='rePeople'] :selected").text();
	    		
	    		$("#selDate").text(selectDate);
	    		$("#selUser").text(selectUser  + " 명");	
	    	}
		    	
		    <%-- 서비스 전체동의를 하지 않은 경우 결제 불가능하게 하기.
			 	| ** → DB 컬럼 추가. [서비스 동의 여부]
				| ** → 전체 동의를 했을 경우 Y로 저장되게 하기.
			--%>    	
			function chkAll(){
				// 서비스 동의 전체 체크
				var all = $("#all"); /* Object 타입으로 반환 → 0번 인덱스에 있는 input 요소를 가져와야 한다.*/
				var sub = $("input[name='agreement']");
				var allchecked = true;
				
				// 전체 체크 선택 시  	    		
				if(all.prop("checked")){	    			
					// 나머지 요소에 접근하여 속성 checked true로 변경	
					sub.prop("checked", true);
				}else{ // all 체크 해제 시 
					sub.prop("checked", false);
				}
			}
			
			
	    	// 예약 정보 전달
	    	function insertReservation(){
	    		var rvDate = $("#rvDate").val();
	    		var rePeople = $("select[name='rePeople'] :selected").text();
				var rvRequest = $("#rvRequest").val();
				var rvPayment = $("input[name='rvPayment']:checked").val(); // 결제 수단
	    		var agrementChk = $("input[name='agreement']:checked").length;
	    		
	    		// 무통장 입금시 전달할 데이터. bank (name), payName (ID), payDate (ID)
	    		var bank = $("select[name='bank'] :selected").val();
	    		var rvName = $("#rvName").val();
	    		var payDate = $("#payDate").val();
	    		
	    		var sub = $("input[name='agreement']");
	    		
				<%-- 예약 날짜, 인원수, 결제 방법 미입력시 focus --%>
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
	    			$("#payRadio").css("border-color", "red").focus();
	    			return;
	    		}else{
	    			$("#payRadio").css("border-color", "lightgray");
	    		}

	    		<%-- 무통장입금 결제정보 미입력시 focus
	   			 		해당 조건 적용이 안된다.  
	   			 	- 입금 은행 선택까지는 적용 된다. 
	   			--%>	
   		
		   		if(rvPayment == "bank"){
		   			if(!bank || bank == "NO"){
			   			alert("입금 은행을 선택해 주세요.");
			   			$("select[name='bank']").focus();
			   			return;
		   			} else if(!rvName){
			   			alert("입금자 명을 입력해 주세요.");
			   			$("#rvName").focus();
			   			return;
		   			} else if(!payDate){
			   			alert("입금 예정일을 입력해 주세요.");
			   			$("#payDate").focus();
			   			return;
		   			}
		   		}
   		
		   		if(!sub.prop("checked")){
					alert("서비스 동의를 해주시기 바랍니다.");
				}
		   		
		   		// 예약 번호 생성. 겹치지 않게 1970년 1월 1일부터 현재까지 경과 시간 ms로 표시되는 getTime()을 사용한다. → 시퀀스로 예약정보를 뽑아오는 대신 사용.(신용카드 결제 API에도 예약 고유 번호가 들어가야 하기 때문)
		   		// API 생성시 필요한 고유 번흐. (신용카드 결제 시 생성되는 예약 번호)
		   		var rvNo = 'SHS'+new Date().getTime();
		   		
		   		// amount는 String이 아니다. 추후 수정시 주의할 것. 
	    		<%-- 입금 방법 별 페이지 이동 --%>
	    		if (rvPayment === "bank") {
					$.ajax({
						url : "<%= contextPath%>/reservationInsert.re",
						type: "POST",
						data: {
							userId : "${userInfo.userId}",
							rno: "${room.roomNo}",
							rvDate: rvDate,
					        rePeople: rePeople,
					        rvRequest: rvRequest,
					        rvPayment : $("input[name='rvPayment']:checked").val(),  <%-- check되어있는 현재 값을 가져와야 한다. --%>
							bank : bank,
							rvName : rvName,
							payDate : payDate,
							amount : '${room.price}' <%-- 수정 ${room.price} --%>
						},success : function(rvNo){
							// 사용자에게 입력받은 정보가 저장되었을 때. 예약 확인 또는 메인 페이지로 이동 
							if(rvNo != null){
								if(confirm("예약이 완료되었습니다. 예약 확인 페이지로 이동하시겠습니까?")){
									<%-- 예약내역 확인 페이지로 이동 --%>
									location.href = '<%= contextPath%>/reservationDetail.shs';
								}else{
									alert('메인으로 돌아갑니다.');
									location.href = '<%= contextPath%>';				
								}
							}else{ 
								alert("예약 중 오류가 발생했습니다. ");
							}
							
						}, error: function(){
							alert("예약 중 오류 발생.");
						}
					});
					<%-- 신용카드 입금 --%>  
				} else if (rvPayment === "card") {
				    /* 1. 가맹점 식별하기 */
				    const { IMP } = window;
				    IMP.init('imp13294039');   // 발급받은 가맹점 식별 코드

				    IMP.request_pay({
				    	channelKey: 'channel-key-c35a906c-403d-4c57-8ab6-01e93e52b059', // PG Provider 지정 (html5_inicis 사용)
				        pay_method: 'scard', // 결제 방법 카드
				        merchant_uid: rvNo, // 상점에서 생성한 고유 주문번호 (상점 고유의 값으로 변경 필요)// 고유값이여야 한다.
				        name: '${room.roomName}', // 주문명
				        amount: '${room.price}',  // 상품 가격 
				        buyer_email: '${ userInfo.email }', // 구매자 이메일
				        buyer_name: "${ userInfo.userName }",  // 로그인한 userName
				        buyer_tel: "${ userInfo.userPhone }", // 구매자 전화번호
				        //m_redirect_url : '${contextPath}', 
				        // 간편결제 버튼 제외 (PC에서만 적용됨)
				        bypass: {
				            acceptmethod: 'noeasypay', // noeasypay는 간편결제 제외 (PC 환경)
				        },
				    }, function (rsp) {
				        // 결제 요청 후 콜백 함수
				        if (rsp.success) {
				            // 결제 성공 시 처리 → 결제 성공시 해당 정보를 테이블에 저장해야 한다.
				            //console.log(rsp);  // rsp 객체 내용 확인
				            //console.log(rsp.amount);  // rsp 객체 내용 확인
						    $.ajax({
						        url: '<%= contextPath %>/reservationInsertCard.re',
						        type: "POST",
						        data: {
						            userId: "${userInfo.userId}",
						            rvNo: rvNo,
						            rno: "${room.roomNo}",
						            rvDate: rvDate,
						            rePeople: rePeople,
						            rvRequest: rvRequest,
						            rvPayment: $("input[name='rvPayment']:checked").val(),
						            buyEmail: rsp.buyer_email,
						            amount: '${room.price}'   
						        }, success: function(result){
						            if(result>0){
						            	if(confirm("예약이 완료되었습니다. 예약 확인 페이지로 이동하시겠습니까?")){
											<%-- 예약내역 확인 페이지로 이동 --%>
											location.href = '<%= contextPath%>/reservationDetail.shs';
										}else{
											alert('메인으로 돌아갑니다.');
											location.href = '<%= contextPath%>';				
										}
									}else{
										if(confirm("예약 중 오류가 발생했습니다. 메인으로 돌아가시겠습니까?")){
											location.href = '<%= contextPath%>';				
										} 
									}
				            	}
				            });
				        } else {
				            // 결제 실패 시 처리
				            alert('결제 실패');
				        }
				    });
				}				
			}
	   
	   
	    </script>
	    

	  
</body>
</html>