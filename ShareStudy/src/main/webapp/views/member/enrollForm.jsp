<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  

<title>ShareStudy 회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>


 		


 #enroll table{
        margin: auto; 
        border-collapse: collapse;
      
}
 #enroll input{
        margin: 5px;
       

}

.outer {
            display: flex; /* 플렉스 박스 사용 */
            justify-content: center; /* 수평 중앙 정렬 */
            align-items: center; /* 수직 중앙 정렬 (필요할 경우) */
            border: 1px solid #99999953;
            width: 550px;
            height: 700px;
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
#form{
    position: relative;
    left: 205px;
    top: 85px;
    font-size: 30px;
    z-index: 200;
}
#submit{
    width: 370px;
    height: 40px;
    background-color: white;
    border-color: rgba(255, 166, 0, 0.774);
    border-radius: 5px;
    border-style:double;

    
}
#button{
    font-size: 10px;
    width: 60px;
    height: 20px;
    background-color: white;
    border-color: rgba(255, 166, 0, 0.774);
    border-radius: 5px;
    border-style:double;
    

}
.z-test{
            width: 135px;
            height: 20px;
            border: 1px solid  rgba(255, 166, 0, 0.774);
            position: absolute;
            
        }
#z1{
            background-color: rgba(255, 166, 0, 0.774);
            top: 235px;
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

 



</style>


</head>
<body>

<%@ include file="/views/common/menubar.jsp" %>

	<h2 align="left" id="form">회원가입</h2>
    <div id="z1" class="z-test"></div>
  			<div class="outer">
  			 	<br> 
  			 	

                <form action="<%=contextPath %>/insert.shs" id="enroll" method="post">
                
                
                    <table>
                    
                    	
                    	<tr>
                    	<td align="left" style="font-size: small;">아이디*</td> 
                        </tr>
                        <tr>
                        <td colspan="2"><input type="text" name="userId" id="userId" maxlength="12"  placeholder="아이디를 입력하세요."required>
                        <button type="button" onclick="checkId();" id="button"> 중복확인 </button></td>
                        </tr>
                        
                       
                        
                        <tr>
                    	<td align="left" style="font-size: small;">비밀번호* <div id="re"> 비밀번호는 영문자+숫자 조합으로 8~15자리 사용해야 합니다.</div></td>
                        </tr>
                        <td colspan="2"><input type="password" name="userPwd" id="userPwd" maxlength="15" oninput="che();"  placeholder="영문/숫자 조합 8~15자로 입력하세요." required></td>
                        
                         
                        <tr>
                        <td align="left" style="font-size: small;">비밀번호 확인<div id="ch"> PASSWORD가 동일하지 않습니다.</div></td>
                        </tr>
                        <td colspan="2"><input type="password" id="checkPwd" maxlength="15" oninput="che();"  required></td>
                        
                        
                        <tr>
                        <td align="left" style="font-size: small;">이름*</td>
                        </tr>
                        <td colspan="2"><input type="text" name="userName"  maxlength="6" placeholder="이름을 입력하세요." required></td>
                        
                      
                        <tr>
                        <td align="left" style="font-size: small;">주민등록번호*<div id="rn"> 잘못입력하셨습니다. 다시 입력해주세요.</div></td>
                        </tr>
                        <td colspan="2"><input type="text" name="userRrn"  id="rrn" maxlength="15" placeholder="- 없이 입력하세요." oninput="num();" required></td>
                        
                       
                        <tr>
                        <td align="left" style="font-size: small;">전화번호*<div id="ph"> 잘못입력하셨습니다. 다시 입력해주세요.</div></td>
                        </tr>
                        <td colspan="2"><input type="text" name="phone" id="phone" maxlength="15" placeholder="- 없이 입력하세요."  oninput="phone();" required></td>
                        
                        
                        <tr>
                        <td align="left" style="font-size: small;">이메일*</td>
                        </tr>
                        <td colspan="2"><input type="email" name="email" id="email" required></td>
                        
                        
                      
                        
                        <tr id="a1">
                        <td colspan="3"><input type="checkbox"  id="all" value="전체동의" align="right" onclick="chkAll();">
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
                            <td align="center" ><input type="submit"   id="submit" disabled></td>
                        </tr>
                            
                             
					</table>
                </form>
            </div>
            
            <script>
            
            function chkAll(){

                var all = document.getElementById("all");
                var agrees = document.getElementsByName("agree");
                console.log(agrees);
                console.log(all);

                if(all.checked){

                    for(var i=0; i<agrees.length; i++){
                        agrees[i].checked = true;
                    }
                }else{
                    for(var i=0; i<agrees.length; i++){
                        agrees[i].checked = false;
                    }
                }
            }
            
            function checkId(){
            	
            	var chId = $("#userId");
            	var share = "<%= contextPath %>";
            	
            	console.log(chId);
            	$.ajax({
            		url : share+"/idCheck.me",
            		type : "GET",
            		data : {
            			chId : chId.val()
            	
            		},
            		success : function(result){
            			console.log(result)
            			if(result=='NO'){
            				alert("이미 존재하는 아이디입니다. 다시 입력주세요.")
            			}else if(result=='YES'){
            				if(confirm("사용 가능한 아이디입니다. 정말 사용하시겠습니까?")){
            					
            					$("#submit").removeAttr("disabled");
            					chId.attr("readonly",true);
            				}else{
            					chId.focus();
            				}
            			}
            		},
            		error : function(){
            			console.log("통신실패");
            		}
            	});
            	
            }
            
            
                function che(){

                    var password = $("#userPwd").val();
                    var passwordCheck = $("#checkPwd").val();
                    var regExp = /^[a-zA-Z\d]{8,15}$/;

                    if(!regExp.test(password)){
                        $("#re").show();
                        $("#userPwd").css("border-color","red");
                    }
                    else {
                        $("#userPwd").css("border-color","#99999953");
                        $("#re").hide();

                    }

                    if(password !== passwordCheck){
                        $("#ch").show();
                    }else{
                        $("#ch").hide();
                    }

                    }

                

                $(document).ready(function(){
                    $("#ch").hide();
                    $("#re").hide();
                    $("#userPwd").addClass("error");
                   

                });

                function num(){

                    var rrn = $("#rrn").val();
                    var regExp =/^\d{2}(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])[1-4]\d{6}$/;
                    
                   
                    
                    

                    if(!regExp.test(rrn)){
                        $("#rn").show();
                        $("#rrn").css("border-color","red");
                    }else{
                        $("#rrn").css("border-color","#99999953");
                        $("#rn").hide();
                        
                    }

                }

                    $(document).ready(function(){
                        $("#rn").hide();
                        
                    
                        var regExp1 = regExp.replace("\\d{6}","●");
                        
                        var regExp2 = new regExp(regExp1);
                   

                });

                function phone(){

                var phone = $("#phone").val();
                var regExp =/^(\d{3})(\d{3,4})(\d{4})$/;


                if(!regExp.test(phone)){
                    $("#ph").show();
                    $("#phone").css("border-color","red");
                }else{
                    $("#phone").css("border-color","#99999953");
                    $("#ph").hide();
                    
                }

                }

                $(document).ready(function(){
                $("#ph").hide();
                $("#phone").on("input", phone);


                });

                
                

                
                    

                  


                

                





                
            
            
            </script>
                    
                    

<%@ include file="/views/common/footer.jsp" %>


</body>
</html>