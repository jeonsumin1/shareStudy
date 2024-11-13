<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰게시판</title>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <style>



    
.outer {
            display: flex; /* 플렉스 박스 사용 */
            justify-content: center; /* 수평 중앙 정렬 */
            align-items: center; /* 수직 중앙 정렬 (필요할 경우) */
            border: 1px solid #99999953;
            width: 800px;
            height: 900px;
            margin: auto;
            margin-top: 50px;
            
            background-color: white;
            position: relative;
            z-index: 200;
            top: 100px;
            
            
        }
    .back{
        position: absolute;
        z-index: 100;
        width: 100%;
        height: 20%;
    }
    .backback{
        position: absolute;
        z-index: 50;
        background-color: #f5a60806;
        width: 100%;
        height: 100%;
    }
    #orange{
        width: 100%;
        height: 200px;
    }

    input[type="text"],select{
    border-radius: 5px;
    border: 1px solid #99999953;
    height: 30px;
    
}

    input[type="file"]{
        border-radius: 5px;
        border: 1px solid #99999953;
        height: 30px;
        width: 99%;
    }
    textarea{
        border-radius: 5px;
        border: 1px solid #99999953;
        height: 98%;
        width: 99%;
        resize: none;
    }
   
   
    #title{
    border-radius: 5px;
    border: 1px solid #99999953;
    height: 30px;
    width: 99%;
}

    #writer,#area,#place{
    border-radius: 5px;
    border: 1px solid #99999953;
    height: 30px;
    width: 98%;
    }

    #submit{
    width: 100px;
    height: 40px;
    background-color: white;
    border-color:  rgba(255, 145, 0, 0.882);
    border-radius: 5px;
    border-style:double;
    font-size: small;

    
}
#contentImg1,#contentImg2,#contentImg3,#contentImg4{
	border-radius: 5px;
    border: 1px solid #99999953;
    height: 100%;
    width: 100%;
	}
	

    </style>

</head>

<body>

<%@ include file="/views/common/menubar.jsp" %>

    <div class="backback"></div>
    <div class="back">
        
        <div>
            
                <input type="image" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.pinimg.com%2F736x%2Fe0%2F6d%2Fba%2Fe06dba360ce9afe0c6cbda29fe41e975.jpg&type=ofullfill340_600_png" id="orange">
    
            
        </div>
    
    </div>

    <div class="outer">
        


        <form action="<%=contextPath %>/insertReview.shs" method="post" id="review-area" enctype="multipart/form-data">
            
            <h2 align="center" >리뷰게시판</h2>
            <br>
			<input type="hidden" name="userId" value="${userInfo.userId }">
            <table align="center"  >
                <tr>
                    <td align="center">제목</td>
                    <td colspan="5"><input type="text" name="title" id="title"></td>
                </tr>
                <tr>
                    <td align="center">작성자</td>
                    <td><input type="text" id="writer" value="${userInfo.userId }" ></td>
                    <td align="center">장소</td>
                    <td><input type="text" name="place" id="place"></td>
                    <td align="center" >지역
                    <select name="region" >
                         <option value="서울">서울</option>
                         <option value="경기">경기</option>
                         <option value="인천">인천</option>
                         <option value="부산">부산</option>
                         <option value="대구">대구</option>
                         <option value="대전">대전</option>
                         <option value="제주">제주</option>
                         <option value="강원">강원</option>
                         <option value="경남">경남</option>
                         <option value="경북">경북</option>
                         <option value="전남">전남</option>
                         <option value="전북">전북</option>
                         <option value="충남">충남</option>
                         <option value="충북">충북</option>
                         <option value="대전">대전</option>
                    </select>
                    </td>
                    
                </tr>
                <tr>
                   
                </tr>
                <tr> 
                    <td align="center">내용</td>
                    <td colspan="5" height="300"><textarea name="content" rows='10'></textarea></td>
                    
                </tr>
            
            
                <tr>
					<td>이미지</td>
					
					<td colspan="1.5" width="130" height="120" >
						<img id="contentImg1">
					</td>
					<td colspan="1.5" width="130" height="120" >
						<img id="contentImg2">
					</td>
					<td  colspan="1.5" width="130" height="120">
						<img id="contentImg3">
					</td>
					<td  colspan="1.5" width="130" height="120">
						<img id="contentImg4">
					</td>
					
				</tr>
                
                <tr>
                    <td align="center">첨부파일</td>  <!-- on -->
                    <td colspan="5" align="center"><input type="file" id="file1" name="file1" onchange="loadImg(this,1);"></td>
                </tr>
                <tr>
                	<td></td>
                    <td colspan="4" align="center"><input type="file" id="file2" name="file2" onchange="loadImg(this,2);"></td>
                </tr>
                <tr>
                	<td></td>
                    <td colspan="4" align="center"><input type="file" id="file3" name="file3" onchange="loadImg(this,3);"></td>
                </tr>
                <tr>
                	<td></td>
                    <td colspan="4" align="center"><input type="file" id="file4" name="file4" onchange="loadImg(this,4);"></td>
                </tr>

                <tr>
                    <td style="height: 30px;"></td>
                </tr>
                <tr>
                    <td colspan="6" align="center"><input type="submit" id="submit">
                    <input type="button" id="submit" onclick="history.back();" value="뒤로가기"></td>

                </tr>
                </table>
        </form>
        
        		<script>
        		
        		
        			//onchange에서 동작할 함수 정의
        			function loadImg(inputFile,num){
        				//inputFile는 현재 이벤트가 발생한 요소이고 num은 자식으로 생각하면 된다.
        				//inputFile.files : input file에 현재 파일 정보를 확인할 수 있는 속성(배열형식의 fileList)
        				//파일을 선택하면 0번 인덱스에 파일 정보가 담긴다. 이때 length는 1이 된다.
        				//파일을 선택했을땐 length가 1이고 선택하지 않았을땐 또는 선택을 취소했을땐 0이기 때문에 해당 조건으로 파일에 대한 처리하기 
        				
        				if(inputFile.files.length == 1){
        					//해당 파일의 정보를 읽어서 미리보기 영역에 보여주기
        					//파일 정보를 읽어줄 객체 FileReader() 준비
        					var reader = new FileReader();
        					//FileReader의 메소드중 readAsDataURL(파일) 이라는 메소드로 
        					//파일을 읽어 해당 파일의 고유한 url을 반환받아 사용한다.
        					
        					reader.readAsDataURL(inputFile.files[0]);
        					//파일은 0번 인덱스에 등록되어있다.
        					
        					//reader 객체가 해당 파일 정보를 읽어오는 시점 : onload
        					reader.onload = function(e){
        						//이벤트 정보 매개변수(e)
        						//이벤트가 동작한 대상 : e.target
        						//해당 이벤트가 발생한 대상의 결과 : e.target.result (생성된 고유 url이 담긴다.)
        						
        						console.log(e.target.result);
        						
        						switch(num){//같이 전달했던 번호 이용하기
	        						case 1 : $("#contentImg1").attr("src",e.target.result); break;
	        						case 2 : $("#contentImg2").attr("src",e.target.result); break;
	        						case 3 : $("#contentImg3").attr("src",e.target.result); break;
	        						case 4 : $("#contentImg4").attr("src",e.target.result); break;
        						
        						}
        						
        					};
        					
        				}else{
    						//선택된 파일이 사라졌을때 띄워놨던 이미지 지워주기 (src 비우기)
    						switch(num){
    							case 1 : $("#contentImg1").attr("src",null); break; 
    							case 2 : $("#contentImg2").attr("src",null); break;
    							case 3 : $("#contentImg3").attr("src",null); break;
    							case 4 : $("#contentImg4").attr("src",null); break;
    						}
    					}
    					
        				
        			}
        			
        		</script>
            
            

                
				


            
        
        
        


    </div>


<br><br><br><br><br><br>


    <%@ include file="/views/common/footer.jsp" %>
</body>

</html>