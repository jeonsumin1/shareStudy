<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 

	String contextPath = request.getContextPath();



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  

<title>Insert title here</title>

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
     right: 90px;
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
input[type="email"]{
    border-radius: 5px;
    border: 1px solid #99999953;
    height: 30px;
    width: 300px;
}
#form{
    position: relative;
    left: 200px;
    top: 87px;
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
            top: 130px;
            left: 200px;
            z-index: 100;
            /*z-index : 더 높은 수가 위로 올라온다 */
 }

 



</style>


</head>
<body>
	<h2 align="left" id="form">회원가입</h2>
    <div id="z1" class="z-test"></div>
  			<div class="outer">
  			 	<br> 
  			 	

                <form action="<%=contextPath %>/insert.me" id="enroll" method="post">
                
                
                    <table>
                    
                    	
                    	<tr>
                    	<td align="left" style="font-size: small;">아이디*</td> 
                        </tr>
                        <tr >
                        <td colspan="2"><input type="text" name="userId" id="userId" maxlength="12" placeholder="아이디를 입력하세요."required>
                        <button type="button" onclick="checkId();" id="button">중복확인</button></td>
                        </tr>
                        
                       
                        
                        <tr>
                    	<td align="left" style="font-size: small;">비밀번호*</td>
                        </tr>
                        <td colspan="2"><input type="password" name="userPwd" id="userPwd" maxlength="15" onclick="password();"placeholder="영문/숫자 조합 8~15자로 입력하세요." required></td>
                        
                         
                        <tr>
                        <td align="left" style="font-size: small;">비밀번호 확인</td>
                        </tr>
                        <td colspan="2"><input type="password" id="checkPwd" maxlength="15" required></td>
                        
                        
                        <tr>
                        <td align="left" style="font-size: small;">이름</td>
                        </tr>
                        <td colspan="2"><input type="text" name="userName"  maxlength="6" placeholder="이름을 입력하세요." required></td>
                        
                      
                        <tr>
                        <td align="left" style="font-size: small;">주민등록번호</td>
                        </tr>
                        <td colspan="2"><input type="text" name="userRrn"  id="rrn" maxlength="20" placeholder="-포함하여 입력하세요." onclick="num();" required></td>
                        
                       
                        <tr>
                        <td align="left" style="font-size: small;">전화번호</td>
                        </tr>
                        <td colspan="2"><input type="text" name="phone" id="phone" maxlength="15" placeholder="-없이 입력하세요."  onclick="phone();"required></td>
                        
                        
                        <tr>
                        <td align="left" style="font-size: small;">이메일</td>
                        </tr>
                        <td colspan="2"><input type="email" name="email" id="email" required></td>
                        
                        
                      
                        
                        <tr id="a1">
                        <td colspan="3"><input type="checkbox" name="agree"  id="agree1" value="전체동의" align="right" >전체동의하기
                        <label for="agree1"align="right">전체동의하기</label>
                        </td>
                        </tr>
                        
                         
                      
                        <tr id="a2">
                        <td colspan="3"><input type="checkbox" name="agree" id="agree2" value="서비스동의"  required>
                        <label for="agree2">[필수]sharestudy 서비스 이용약관 동의</label>

                        </td>
                        </tr>
                         
                        <tr id="a3">
                        <td colspan="3"><input type="checkbox" name="agree" id="agree3" value="본인확인동의"  required>
                        <label for="agree3">[필수]본인 확인 서비스 이용약관 동의</label>
                        </td>
                        </tr>
                         
                        <tr id="a4">
                        <td colspan="3"><input type="checkbox" name="agree" id="agree4" value="마케팅동의">
                        <label for="agree4">[선택] 마케팅 정보 수신 동의</label>
                        </td>
                        </tr>
                        
                        <tr>
                            <td style="height: 20px;"></td>
                        </tr>
                       
                        
                            
                        <tr>   
                            <td align="center" ><input type="submit"  onclick="retrun pwdCheck();" id="submit"  required></td>
                        </tr>
                            
                             
					</table>
                </form>
            </div>
            
            <script>
            
            function num(){
            	var num = document.querySelector("#rrn");
            	var phone = document.querySelector("#phone");
            	var regExp =/^\d{2}(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])-[1-4]\d{6}$/;
            	
            	if(regExp.num(num.value)){
            		phone.focus();
                }else{
                	num.focus();
                }

            }
            
            function pwdCheck(){
            	
            	var userPwd = document.querySeletor("#userPwd");
            	var checkPwd = document.querySeletor("#checkPwd");
            	
            	if(userPwd.value != checkPwd){
            		alert("입력하신 비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
            		userPwd.focus();
            		return false;
            	}
            }
            
            function phone(){
            	
            	var phone = document.querySelector("#phone");
            	var email = document.querySelector("#email");
            	var regExp = /^(\d{3})-(\d{3,4})-(\d{4})$/;
            	
            	if(reExp.phone(phone.value)){
            		email.focus();
            	}else{
            		phone.focus();
            	}
            }
            
            function password(){
            	
            	var userPwd = document.querySelecor("#userPwd");
            	var checkPwd = document.querySelecor("#checkPwd");
            	
            	var regExp = /^[a-zA-Z\d]{8,15}$/;
            	
            	if(reExp.password(password.value){
            		
            	}
            }
            
            </script>
                    
                    




</body>
</html>