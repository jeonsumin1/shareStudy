<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://use.fontawesome.com/72aaf9ab20.js"></script>


<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>


 		


 #update table{
        margin: auto; 
        border-collapse: collapse;
      
}
 #update input{
        margin: 5px;
       

}


.outer {
            display: flex; /* 플렉스 박스 사용 */
            justify-content: center; /* 수평 중앙 정렬 */
            align-items: center; /* 수직 중앙 정렬 (필요할 경우) */
            border: 1px solid #99999953;
            width: 550px;
            height: 1100px;
            margin: auto;
            margin-top: 50px;
            border-radius: 10px;

            
            
        }

        table {
            border-collapse: collapse; /* 경계선 합치기 */
            width: 100%; /* 원하는 너비 */
            
        }

        /*th, td {
           
            text-align: center;
            padding: 5px; 
        }*/
#a1{
     position: relative;
     top:3px;
     right: 130px;
     text-align: center;
     padding: 5px; 
     font-size: small;
    }
#a2{
    position: relative;
    top: 3px;
    right: 55px;
    text-align: center;
    padding: 5px; 
    font-size: small;
}
#a3{
    position: relative;
    top:3px;
    right: 58px;
    text-align: center;
     padding: 5px; 
     font-size: small;

}
#a4{
    position: relative;
    top: 3px;
    right: 84px;
    text-align: center;
     padding: 5px; 
     font-size: small;
    
}
#agree1 {
    width: 1.5rem;
    height: 1.5rem;
    border-radius: 50%;
    border: 1px solid #999;
   
   
}

input[type="text"]{
    border-radius: 5px;
    border: 1px solid #99999953;
    height: 30px;
    width: 300px;
}

#form{
    position: relative;
    left: 187px;
    top: 85px;
    font-size: 30px;
    z-index: 200;
}
input[type="password"]{
    border-radius: 5px;
    border: 1px solid #99999953;
    height: 30px;
    width: 300px;
}

input[type="password"].valid{
    border-color: greenyellow;
}

input[type="password"].invalid{
    border-color: red;
}

input[type="email"]{
    border-radius: 5px;
    border: 1px solid #99999953;
    height: 30px;
    width: 300px;
}


#submit1,#submit2,#submit3{
    width: 100px;
    height: 40px;
    background-color: white;
    border-color:  rgba(0, 136, 255, 0.558);
    border-radius: 5px;
    border-style:double;
    font-size: small;

    
}
#button{
    font-size: 10px;
    width: 60px;
    height: 20px;
    background-color: white;
    border-color:  rgba(0, 136, 255, 0.558);
    border-radius: 5px;
    border-style:double;
    

}
.z-test{
            width: 135px;
            height: 20px;
            border: 1px solid  rgba(0, 136, 255, 0.558);
            position: absolute;
            
        }
#z1{
            background-color:  rgba(0, 136, 255, 0.558);
            top: 200px;
            left: 200px;
            z-index: 100;
            /*z-index : 더 높은 수가 위로 올라온다 */
 }

 #ch{
    color: red;
    display: none;
 }

 #re{
    color: red;
    display: none;
    
    
 }
 .error{
    border-color: red;
 }

 #rn{
    color: red;
    display: none;
 }
 #ph{
    color: red;
    display: none;
 }
 #m1{
    display: flex;
    align-items: center;
    border : 1px solid #99999953;
    margin: 2px;
    border-radius: 5px;
    height: 30px;
    width: 300px;
 }
 
 /* id -> class로 바꿔야 될듯?!*/
 .m1{
 	display: flex;
    align-items: center;
    border : 1px solid #99999953;
    margin: 2px;
    border-radius: 5px;
    height: 30px;
    width: 300px;
 }

.eyes{
    position: absolute;
    top:155px;
    bottom: 0;
    right: 645px;
    margin: auto;
    height: 20px;
    font-size: 15px;
    cursor: pointer;
    display: flex;
    align-items: center;
}



    
.qq{
	   width: 550px; /* 페이지 너비 */
       margin: auto; /* 페이지 중앙 정렬 */
       margin-top: 50px;
       text-align: left;
       border: 1px solid #99999953;
	   border-radius: 10px;
	   height: 230px;
}
.inputSt{
    	margin-top: 10px;
    	width: 100%; 
    }
table th{
	width: 200px;
}



 



</style>


</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>


	
    
    
   
    

	<h2 align="left" id="form">마이페이지</h2>
    <div id="z1" class="z-test"></div>
  			<div class="outer">
  			 	<br> 
  			 	

                <form action="<%=contextPath %>/update.shs" id="update" method="post">
                <input type="hidden" name="userId" value= "${userInfo.userId }">
                
             
                    <table>
                     
                    	
                    	
                    	<tr>
                    	<td align="left" style="font-size: small;">📌 아이디</td> 
                        </tr>
                        <tr>
                            <td align="left" style="font-size:medium;"><p id="m1"> &nbsp; ${userInfo.userId }</p></td>
                        </tr>
                        
                        <tr>
                            <td align="left" style="font-size: small;">📌 이름</td>
                        </tr>
                        <tr>
                            <td align="left" style="font-size:medium;"><p id="m1"> &nbsp; ${userInfo.userName }</p></td>
                        </tr>
                        
                      
                        <tr>
                        <td align="left" style="font-size: small;"> 📌 주민등록번호</td>
                        </tr>
                        <tr>
                        <td colspan="2"><p id="m1" class="rrn1" ></p></td>
                        </tr>
                       
                        <tr>
                        <td align="left" style="font-size: small;"> 📌 비밀번호 </td>
                        </tr>
                         
                        <tr>
                        <td colspan="2"><input type="password" id="m1" class="mm1" value=" &nbsp; ${userInfo.userPw }" > <div onclick="eye();" class="eyes"><i id="icon" class="fa fa-eye fa-lg"></i></div></td>
                        </tr>     
                
                        <tr>
                        <td align="left" style="font-size: small;"> 📌 전화번호</td>
                        </tr>
                        <tr>
                        <td colspan="2"><input type="text" id="m1" name="phone" value=" &nbsp; ${userInfo.userPhone }"></td>
                        </tr>
                        
                        <tr>
                        <td align="left" style="font-size: small;">📌 이메일</td>
                        </tr>
                        <tr>
                        <td colspan="2"><input type="email" id="m1" name="email" value=" &nbsp; ${userInfo.email }"></td>
                        </tr>
                        
                      
                        
                        <tr id="a1">
                        <td colspan="3"><input type="checkbox" name="agreeBox" id="all" value="전체동의" align="right" >
                        <label for="all" align="right">전체동의하기</label>
                        </td>
                        </tr>
                        
                         
                      
                        <tr id="a2">
                        <td colspan="3"><input type="checkbox" name="agreeBox" id="a" value="서비스동의"  required>
                        <label for="a">[필수]sharestudy 서비스 이용약관 동의</label>

                        </td>
                        </tr>
                         
                        <tr id="a3">
                        <td colspan="3"><input type="checkbox" name="agreeBox" id="b" value="본인확인동의"  required>
                        <label for="b">[필수]본인 확인 서비스 이용약관 동의</label>
                        </td>
                        </tr>
                         
                        <tr id="a4">
                        <td colspan="3"><input type="checkbox" name="agreeBox" id="c" value="마케팅동의">
                        <label for="c">[선택] 마케팅 정보 수신 동의</label>
                        </td>
                        </tr>
                   
                        
                        <tr>
                            <td style="height: 20px;"></td>
                        </tr>
                    
                    	
                    	<!-- sm 추가! -->
                    	<tr>
                            <td align="left" style="font-size: small;"><p id="m1" onclick="location.href='<%= contextPath %>/rvlist.shs'">📚 예약 내역</p></td>                       
                        </tr>
                        
                        <tr>
                            <!-- <td align="left" style="font-size: small;">📞 나의 문의</td> -->
                            <td align="left" style="font-size: small;">
                            	<p id="m1" data-toggle="modal" data-target="#QModal">📞 문의 하기</p>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="font-size: small;"><p id="m1">💭 문의 횟수 : ${count}</td>
                        </tr>    
                        <tr>
                            <td align="left" style="font-size: small;"><p id="m1"> 💌 시간문의(카테고리화)</p></td>
                        </tr>    

                        <tr>
                            <td style="height: 20px;"></td>
                        </tr>
                        <tr>
                            <td style="height: 20px;"></td>
                        </tr>
                        
                            
                        <tr>   
                            <td align="left" >
                                <input type="submit" id="submit1" value="정보변경">
                                <input type="button" data-toggle="modal" data-target="#updatePwd" id="submit2" value="비밀번호 변경">
                                <input type="button" id="submit3" data-toggle="modal" data-target="#deleteUser" value="회원탈퇴" onclick="deleteUser();">
                            </td>
                        </tr>
                                
					</table>
                </form>
                
            </div>
            

  <!-- The Modal -->
  <div class="modal fade" id="updatePwd">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">비밀번호 변경</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        
          <form action="<%=contextPath %>/updatePwd.shs" method="post">
          
          <input type="hidden" name="userId" value= "${userInfo.userId }">
          
          	<table>
          		<tr>
          			<td>현재 비밀번호</td>
          		</tr>
          		<tr>
          			<td><input type="password" name="uPwd" required ></td>
          		</tr>
          			
          		<tr>
          			<td>변경할 비밀번호</td>
          		</tr>
          		<tr>
          			<td><input type="password" name="upPwd" id="p1"  required ></td>
          		</tr>
          			
          		
          		<tr>
          			<td>변경할 비밀번호 확인</td>
          		</tr>
          		<tr>
          			<td><input type="password" name="chUpPwd" id="p2" required ></td>
          		</tr>
          			
          	</table>
          	 <br>
          	 <!-- Modal footer -->
        
        
          <button type="submit" class="btn btn-warning"  onclick="return checkPwd();">저장</button>
        
          </form>
          
        </div>
        
      </div>
      
    </div>
  </div>
  
  <!-- The Modal -->
  <div class="modal fade" id="deleteUser">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
  <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">회원계정탈퇴</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        
          <form action="<%=contextPath %>/delete.shs" method="post">
          
          <input type="hidden" name="userId" value= "${userInfo.userId }">
          
          	<table>
          	
          		<tr>
          			<td>현재 비밀번호</td>
          		</tr>
          		<tr>
          			<td><input type="password" name="delPwd" id="d1"  required ></td>
          		</tr>
          			
          		
          		
          			
          	</table>
          	 <br>
          	 <!-- Modal footer -->
        
        
          <button type="submit" class="btn btn-warning"  onclick=" deleteUser();">탈퇴</button>
        
          </form>
   	 
          
        </div>        
       
      </div>
      
    </div>
  </div> 		
          		
          	
    <!-- 문의하기 모달 -->
	<div class="modal" id="QModal">
	   <div class="modal-dialog">
	       <div class="modal-content">
	           <div class="modal-header">
	               <h4 class="modal-title">ShareStudy</h4>
	               <button type="button" class="close" data-dismiss="modal">&times;</button>
	           </div>
	
	           <div class="modal-body">
	               <p>문의사항</p>
	               <table class="table table-bordered inputSt">
	                   <tr>
	                       <th>상담 가능 시간</th>
	                       <td><input type="datetime-local" id="qTime" class="form-control" required></td>
	                   </tr>
	                   <tr>
	                       <th>전화번호</th>
	                       <td><input type="text" id="tel" class="form-control" placeholder="010-0000-0000 (- 포함입력)" maxlength="13" required></td>
	                   </tr>
	                   <tr>
	                       <th>상담 상담 내용</th>
	                       <td><textarea id="qContent" rows="5" cols="30" placeholder="상담 내용에 대해 간략하게 적어주세요." style="resize: none;" class="form-control"></textarea></td>
	                   </tr>
	               </table>
	           </div>
	
	           <div class="modal-footer">
	               <!-- 'send' 버튼 클릭 시 test() 함수 호출 -->
	               <button class="btn" style="background-color: rgba(255, 166, 0, 0.774)" onclick="test();">send</button>
	               <!-- 'close' 버튼 클릭 시 모달만 닫히고 test() 함수는 호출되지 않음 -->
	                <button type="button" class="btn btn-danger" data-dismiss="modal">close</button>
	            </div>
	        </div>
	    </div>
	</div>


<script>

function test() {
    	var qTime = $("#qTime");
        var qContent = $("#qContent");
        var tel = $("#tel");
        console.log(qTime+" "+qContent+" "+tel);
        
        var regExp = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}$/;
       	if(!regExp.test(tel.val())){
       		alert("전화번호를 다시 입력하세요.");
       		$("#tel").focus();
       		return;
       	}
       	
    	$.ajax({
    		url: "<%= contextPath%>/question.shs",
    		type: "POST",
    		data: {
    			userId : "${userInfo.userId}", 
    			qTime: qTime.val(),
    			qContent : qContent.val(),
    			tel : tel.val()
    		},
    		success: function(result){
    			if(result>0){
	    		 	alert("상담신청이 완료되었습니다.");
			        		        
			        qTime.val("");
			        qContent.val("");
			        tel.val("");
			        
			        <!-- 모달 닫기(close)  : 모달 닫는 메소드라는데 적용이 안됨. 
			        	$('#QModal').modal('hide'); 
			        -->
			        $("#QModal").css("display","none");
			        $(".modal-backdrop").css("display","none");
			        
			        
    			}else{
	    			alert("상담신청이 실패되었습니다.");
    			}
    		},
    		error : function(){
	    			alert("에러");
    		}
    		
    	});
    }
    
    
    
		function maskRrn() {

			var rrn = "
	<%= userInfo.getRrn() %>";

                
                var maskedRrn = rrn.substring(0, 8) + "●●●●●●";

               
                $(".rrn1").html("&nbsp;" + maskedRrn);
            }

            // 페이지 로딩 후, 마스킹 함수 호출
            $(document).ready(function() {
                maskRrn();
            });
            
           
               
                
           
                
            
            
            
            
            
            function eye() {
                var mm1 = document.querySelector(".mm1");
                var icon = document.querySelector("#icon");

                if (mm1.type !== "password") {
                    mm1.type = "password"; // 비밀번호 입력창을 비밀번호로 설정
                    icon.classList.remove("fa-eye-slash"); // 'fa-eye-slash' 아이콘을 제거
                    icon.classList.add("fa-eye"); // 'fa-eye' 아이콘을 추가
                } else {
                    mm1.type = "text"; // 비밀번호 입력창을 일반 텍스트로 설정
                    icon.classList.remove("fa-eye"); // 'fa-eye' 아이콘을 제거
                    icon.classList.add("fa-eye-slash"); // 'fa-eye-slash' 아이콘을 추가
                }
            }

               
                    
             </script>   
                
                
                
                
				<script>
                function checkPwd(){

                	var pwd1 = document.querySelector("#p1");
                	var pwd2 = document.querySelector("#p2");
                	
                	if(pwd1.value != pwd2.value){
                		alert("변경된 비밀번호가 일치하지 않습니다. 다시 입력해주시길 바랍니다.");
                		return false;
                	}
                }
                

                $(function(){ //이거 수정했을때 수정이 안됨..
                	
                	var adAgree = "${userInfo.adAccept}";
                	
                	
                	
                	var adAgreeStr = adAgree.split(",");
                	console.log(adAgree);
                	console.log(adAgreeStr);
                	
                	$("input[type=checkbox]").each(function(){
                		
                		if(adAgreeStr.indexOf($(this).val()) != -1){
                		
                		$(this).attr("checked",true);
                		}
                	})
                	
                	
                	
                });
                
               
                
                function deleteUser(){
                	
                	var pwd1 = 	$("#d1").val();
                	var userPw = ${userInfo.userPw};
                	
                	if(pwd1 == userPw){
                		
                		return confirm("정말 탈퇴하시겠습니까? 탈퇴 후 복구는 불가능하며 사이트 이용 원할시 다시 회원가입해주시길 바랍니다. 그동안 이용해주셔서 감사합니다." );
                
                		
                	}else{
                		alert("비밀번호를 잘못입력하셨습니다. 다시 확인 해주시길 바랍니다.");
                		return false;
                	}
                	
     
                	
                }
            
                
               

                	
            
            
                </script>
                    
                    
<%@ include file="/views/common/footer.jsp" %>



</body>
</html>