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
 #enroll table{margin : auto; float : right;
     	       position: absolute; top: 30px; left: 30px;
    
        		
        		

     }
 #enroll input{
               position: absolute; top: 30px; left: 30px;
 				
 }
 .outer{
 		border : 1px solid black;
 		width : 700x;
 		margin : auto;
 		margin-top : 50px;
 		float : right;
 		
 }	
</style>


</head>
<body>
	<h2 align="left">회원가입</h2>
  			<div class="outer">
  			 	<br> 
  			 	

                <form action="<%=contextPath %>/insert.me" id="enroll" method="post">
                
                
                    <table>
                    
                    	
                    	<tr>
                    	<td>아이디</td>
                        <td><input type="text" name="userId" id="userId" maxlength="12" placeholder="" required></td>
                        <td><button type="button" onclick="checkId();">중복확인</button></td>
                        </tr>
                        
                       
                        
                        <tr>
                    	<td>비밀번호</td>
                        <td><input type="password" name="userPwd" id="userPwd" maxlength="15" placeholder="" required></td>
                        </tr>
                        
                        <tr>
                        <td>비밀번호 확인</td>
                        <td><input type="password" id="checkPwd" maxlength="15" placeholder="" required></td>
                        </tr>
                        
                        <tr>
                        <td>이름</td>
                        <td><input type="text" name="userName"  maxlength="6" placeholder="" required></td>
                        </tr>
                      
                        <tr>
                        <td>주민등록번호</td>
                        <td><input type="text" name="rrn"  maxlength="20" placeholder="" required></td>
                        </tr>
                       
                        <tr>
                        <td>전화번호</td>
                        <td><input type="text" name="phone"  maxlength="15" placeholder="" required></td>
                        </tr>
                        
                        <tr>
                        <td>이메일</td>
                        <td><input type="email" name="email"  required></td>
                        </tr>
                        
                      
                        
                        <tr>
                        <td><input type="checkbox" name="agree"  id="agree1" value="" >전체동의하기
                        <label for="agree1">전체동의하기</label>
                        </td>
                        </tr>
                        
                         
                        <tr>
                        <td><input type="checkbox" name="agree" id="agree2"   required>
                        <label for="agree2">[필수]sharestudy 서비스 이용약관 동의</label>
                        </td>
                        </tr>
                         
                        <tr>
                        <td><input type="checkbox" name="agree" id="agree3"   required>
                        <label for="agree3">[필수]본인 확인 서비스 이용약관 동의</label>
                        </td>
                        </tr>
                         
                        <tr>
                        <td><input type="checkbox" name="agree" id="agree4" >
                        <label for="agree4">[선택] 마케팅 정보 수신 동의</label>
                        </td>
                        </tr>
                        
                      
                    
                    


					</table>

                </form>
            </div>

</body>
</html>