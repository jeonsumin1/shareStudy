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
        


        <form action="<%=contextPath %>/detailReview.shs" id="review-area" >
            
            <h2 align="center" >리뷰게시판</h2>
            <br>
			<input type="hidden" name="userId" value="${userInfo.userId }">
            <table align="center"  >
                <tr>
                    <td align="center">제목</td>
                    <td colspan="5"><input type="text" name="title" id="title" value="${r.reviewTitle }"></td>
                </tr>
                <tr>
                    <td align="center">작성자</td>
                    <td><input type="text" id="writer" value="${r.userId }" ></td>
                    <td align="center">장소</td>
                    <td><input type="text" name="place" id="place" ></td>
                    <td align="center" >지역
                    <select name="region">
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
                    <td colspan="5" height="300"><textarea name="content" rows='10'>${r.reviewContent}</textarea></td>
                    
                </tr>
            
            
               <tr>
				<th>첨부파일</th> 
				<td colspan="3">
					<c:choose>
						<c:when test="${empty at}">
							첨부파일이 없습니다 
						</c:when>
						<c:otherwise>
							<!-- 다운로드 속성 추가 -->
							<a href="${contextPath}${at.filePath}${at.changeName}">${at.originName}</a>
						</c:otherwise>
					</c:choose>
				
				</td>
			</tr>
                
               
                </table>
        </form>
        
        		
				


            
        
        
        


    </div>


<br><br><br><br><br><br>


    <%@ include file="/views/common/footer.jsp" %>
</body>

</html>