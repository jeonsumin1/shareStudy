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

.eyes{
    position: absolute;
    top:190px;
    bottom: 0;
    right: 645px;
    margin: auto;
    height: 20px;
    font-size: 15px;
    cursor: pointer;
    display: flex;
    align-items: center;
}



    

 


 



</style>


</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>

<%
	String userId = userInfo.getUserId();
	String userPhone = userInfo.getUserPhone();
	String email = userInfo.getEmail();
	String adAgree = userInfo.getAdAccept();
	String userPw = userInfo.getUserPw();
%>

	<h2 align="left" id="form">마이페이지</h2>
    <div id="z1" class="z-test"></div>
  			<div class="outer">
  			 	<br> 
  			 	

                <form action="<%=contextPath %>/update.shs" id="update" method="post">
                <input type="hidden" name="userId" value= "<%=userId%>">
                
             
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
                        <td colspan="2"><p id="m1" class="rrn1"> &nbsp; </p></td>
                        </tr>
                        <tr>
                        <td align="left" style="font-size: small;"> 📌 비밀번호 </td>
                        </tr>
                         
                        <tr>
                        <td colspan="2"><input type="password" id="m1" class="mm1" value="<%=userPw %>" > <div onclick="eye();" class="eyes"><i id="icon" class="fa fa-eye fa-lg"></i></div></td>
                        </tr>     
                
                        <tr>
                        <td align="left" style="font-size: small;"> 📌 전화번호</td>
                        </tr>
                        <tr>
                        <td colspan="2"><input type="text" id="m1" name="phone" value="<%=userPhone%>"></td>
                        </tr>
                        
                        <tr>
                        <td align="left" style="font-size: small;">📌 이메일</td>
                        </tr>
                        <tr>
                        <td colspan="2"><input type="email" id="m1" name="email" value="<%=email%>"></td>
                        </tr>
                        
                      
                        
                        <tr id="a1">
                        <td colspan="3"><input type="checkbox" name="agree" id="all" value="전체동의" align="right" onclick="chkAll();">
                        <label for="all"align="right">전체동의하기</label>
                        </td>
                        </tr>
                        
                         
                      
                        <tr id="a2">
                        <td colspan="3"><input type="checkbox" name="agree" id="a" value="서비스동의"  required>
                        <label for="a">[필수]sharestudy 서비스 이용약관 동의</label>

                        </td>
                        </tr>
                         
                        <tr id="a3">
                        <td colspan="3"><input type="checkbox" name="agree" id="b" value="본인확인동의"  required>
                        <label for="b">[필수]본인 확인 서비스 이용약관 동의</label>
                        </td>
                        </tr>
                         
                        <tr id="a4">
                        <td colspan="3"><input type="checkbox" name="agree" id="c" value="마케팅동의">
                        <label for="c">[선택] 마케팅 정보 수신 동의</label>
                        </td>
                        </tr>
                   
                        
                        <tr>
                            <td style="height: 20px;"></td>
                        </tr>
                    
                    
                        <tr>
                            <td align="left" style="font-size: small;">● 예약 정보</td>
                        </tr>
                            <td colspan="2"><input type="image" src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MTBfNDYg%2FMDAxNjU3NDU2MjM2NTAz.yJQCChoFPgiWm0vjkCU4NlcH4lRPWWxePl6n0R7IkB0g.1Alvs-Px7p8PWhddQBr3-SZXZ5X2zzMGMAQqSVemU7Mg.JPEG.room_rivate%2F%25BD%25BA%25C5%25CD%25B5%25F0%25B7%25EB1.JPG&type=a340" required></td>
                        <tr>
                        </tr>
                        <td align="left" style="font-size: small;" id="inform1">📚예약번호</td>
                        <tr>
                        </tr>
                        <td align="left" style="font-size: small;"  id="inform2">📚룸 번호</td>
                        <tr>
                        </tr>
                        <td align="left" style="font-size: small;" id="inform3">📚예약인원수</td>
                        <tr>
                        </tr>
                        <td align="left" style="font-size: small;" id="inform4">📚예약시간</td>
                        <tr>

                        <tr>
                            <td style="height: 20px;"></td>
                        </tr>

                        <tr>
                            <td align="left" style="font-size: small;">📞 나의 문의</td>
                            </tr>
                            <td align="left" style="font-size: small;"><p id="m1"> 💌 시간문의(카테고리화)</p></td>
                        <tr>       


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
          
          <input type="hidden" name="userId" value= "<%=userId%>">
          
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
          
          <input type="hidden" name="userId" value= "<%=userId%>">
          
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
          		
          	
          	
          
          
          
          
          
            
            <script>
               
                

               
                    
                
                
                
                
                

                function checkPwd(){

                	var pwd1 = document.querySelector("#p1");
                	var pwd2 = document.querySelector("#p2");
                	
                	if(pwd1.value != pwd2.value){
                		alert("변경된 비밀번호가 일치하지 않습니다. 다시 입력해주시길 바랍니다.");
                		return false;
                	}
                }
                

                $(function(){
                	
                	var adAgree = "<%=adAgree%>";
                	
                	var adAgreeStr = adAgree.split(",");
                	
                	$("input[name=agree]").each(function(){
                		
                		if(adAgreeStr.indexOf($(this).val()) != -1){
                		
                		$(this).attr("checked",true);
                		}
                		
                	});
                	
                	
                	
                });
                
                
                function deleteUser(){
                	
                	var pwd1 = 	$("#d1").val();
                	var userPw = ${userInfo.userPw};
                	
                	if(pwd1 == userPw){}
                		
                		return confirm("정말 탈퇴하시겠습니까? 탈퇴 후 복구는 불가능하며 사이트 이용 원할시 다시 회원가입해주시길 바랍니다. 그동안 이용해주셔서 감사합니다." );
                
                		
                	}else{
                		alert("비밀번호를 잘못입력하셨습니다. 다시 확인 해주시길 바랍니다.");
                		return false;
                	}
                	
     
                	
                }
                
				var rrn = "${userInfo.rrn}";
                
                function maskRrn(rrn) {
                    // 주민등록번호에서 뒤 6자리를 마스킹
                    
                	var maskedRrn = rrn.substring(0, 8) + "●●●●●●";
                    return maskedRrn;
                    
                }
                    
                
                var maskedRrn = maskRrn(rrn);
                $(".rrn1").html("&nbsp;" +maskedRrn);
                
                
                
                function eye(){
					
                    var mm1 = document.querySelector(".mm1");
                    var icon = document.querySelector("#icon");
                    
                    if(mm1.type != password){
                    	mm1.type = "password";
                    	icon.classList.remove("fa-eye-slash");
                    	icon.classList.add("fa-eye");
                    }else{
                    	mm1.type = "text";
                    	icon.classList.remove("fa-eye");
                    	icon.classList.add("fa-eye-slash");
                    }
                    
                }

                	
            
            
            </script>
                    
                    




</body>
</html>