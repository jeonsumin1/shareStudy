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
            width: 70%;
            height: 70%;
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

    #submit,#delete{
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
        
        <script>
                	$(function(){
                		
                		var reName = "${r.regionName}";
                		
                		$("#review-area option").each(function(){
                			
                			if($(this).text() == reName){
                			
                				$(this).attr("selected",true);
                				
                				return false;
                			}	
                			
                		});
                		
                		
                	});
                
                </script>


        <form action="<%=contextPath %>/detailReview.shs" id="review-area" >
            <br>
            <br>
            <h2 align="center" >리뷰게시판</h2>
            <br>
			<input type="hidden" name="userId" value="${userInfo.userId }">
			
            
            <table align="center" >
                <tr>
                    <td align="center">제목</td>
                    <td colspan="5"><input type="text" name="title" id="title" value="${r.reviewTitle }"></td>
                </tr>
                <tr>
                    <td align="center">작성자</td>
                    <td><input type="text" id="writer" value="${r.userId }" ></td>
                    <td align="center">장소</td>
                    <td><input type="text" name="place" id="place"  value=${r.roomNo }></td>
                    <td align="center" >지역
                    <select name="region" >
                         <option value="${r.regionName }">${r.regionName }</option>
                         
                    </select>
                    </td>
                    
                </tr>
                
                
                
                <tr>
                   
                </tr>
                <tr> 
                    <td align="center">내용</td>
                    <td colspan="5" height="300"><textarea name="content" rows='10'>${r.reviewContent}</textarea></td>
                    
                </tr>
            
         <c:forEach items="${rt }" var="rt" >
				<c:if test="${not empty rt.filePath and not empty rt.changeName}">
					
							<tr>
								
						<td colspan="6" width="50" height="50" align="center">
						<img id="contentImg" src="<%=contextPath %>/resources/reviewUploadFiles/${rt.changeName}">
					           </td>
									
								
							</tr>
					</c:if>
				</c:forEach>
               
                </table>
                
                <c:if test="${userInfo.userId == r.userId or userInfo.userId eq 'admin'}">
			<br>
			<div align="center">
				<button type="button" id="delete">삭제하기</button>
				<br><br>
				
			</div>
		</c:if>
        </form>
        
        <script>
        $(function(){
			
			$("#delete").click(function(){
				<%-- 
				삭제하기 버튼을 누르면 정말 삭제하시겠습니까? 확인 취소 가 나오는 confirm을 이용하여
				확인을 눌렀을때 삭제 요청이 되도록 처리하기
				매핑주소 : delete.bo
				메소드명 : deleteBoard() 
				컨트롤러명 : BoardDeleteController
				
				함수를 이용하여 post 방식 form 요청이 될 수 있도록 처리할것 
				
				삭제시 DML - DELETE 를 사용한다면 업로드 파일도 삭제 
				삭제시 DML - UPDATE 를 사용한다면 업로드 파일은 보류
				--%>
				if(confirm("정말 삭제하시겠습니까?")){
					
					$("<form>",{
								method:"POST"
							   ,action:"<%=contextPath%>/reviewDelete.shs"
					  }).append($("<input>",{
								  type:"hidden"
								 ,name:"reviewNo"
								 ,value:"${r.reviewNo}"
					  })).appendTo("body").submit();
				}
				
			});
			
		});
	
        </script>
				


            
        
        
        


    </div>


<br><br><br><br><br><br>


    <%@ include file="/views/common/footer.jsp" %>
</body>

</html>