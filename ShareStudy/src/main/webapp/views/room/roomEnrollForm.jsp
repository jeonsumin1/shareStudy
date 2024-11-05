<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 align="left" id="rform">상품등록</h2>
    <div id="rf" class="rf"></div>
  			<div class="outer">
  			 	<br> 
  			 		

                <form action="" id="enroll" method="post">
                
                
                    <table>
                    
                    	
                    	<tr>
                    	<td align="left" style="font-size: small;">룸(상품번호)</td> 
                        </tr>
                        <tr >
                        <td colspan="2"><input type="text" name="roomNo" id="roomNo"  placeholder="상품번호 기입필수."required>
                        </tr>
                        
                       
                        
                        <tr>
                    	<td align="left" style="font-size: small;">지역</td>
                        </tr>
                        <td ><input type="text" name="regionNo" id="regionNo"  required></td>
                        
                         
                        <tr>
                        <td align="left" style="font-size: small;">사용가능인원</td>
                        </tr>
                        <td ><input type="number" id="roomSize"  required></td>
                        
                        
                        <tr>
                        <td align="left" style="font-size: small;">상품 이름</td>
                        </tr>
                        <td colspan="2"	><input type="text" name="roomName" required></td>
                        
                      
                        <tr>
                        <td align="left" style="font-size: small;">상품 주소</td>
                        </tr>
                        <td ><input type="text" name="roomAddress"  id="roomAddress"  required></td>
                        
                       
                        <tr>
                        <td align="left" style="font-size: small;">이용 가격</td>
                        </tr>
                        <td colspan="2"><input type="text" name="phone" id="phone" maxlength="15" placeholder="-없이 입력하세요."  onclick="phone();"required></td>
                        
                        
                        <tr>
                        <td align="left" style="font-size: small;">야간이용 가능유무</td>
                        </tr>
                        <td colspan="2"><input type="text" name="useNight" id="useNight" required></td>
                        
                        <tr>
                        <td align="left" style="font-size: small;">주차가능 유무</td>
                        </tr>
                        <td colspan="2"><input type="text" name="parking" id="parking" required></td>
                        
                        <tr>
                        <td align="left" style="font-size: small;">취식가능 유무</td>
                        </tr>
                        <td colspan="2"><input type="text" name="eating" id="eating" required></td>
                        
                        
                        
                      
                        
                    
                        
                         
                      
                        
                            
                             
					</table>
                </form>
            </div>
</body>
</html>