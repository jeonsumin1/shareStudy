<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰게시판</title>

    <style>



    
.outer {
            display: flex; /* 플렉스 박스 사용 */
            justify-content:center; /* 수평 중앙 정렬 */
            align-items:normal; /* 수직 중앙 정렬 (필요할 경우) */
            border: 1px solid #99999953;
            width: 1300px;
            height: 1000px;
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
    .list  td  {border-bottom:1px solid #99999953;}
    .list :first-child td {border-top: 1px solid #99999953;}
    .list{
        position: relative;
        top: 150px;
        padding: auto;
    }
    #submit{
    position: absolute;
    width: 80px;
    height: 30px;
    background-color:rgba(255, 145, 0, 0.882);
    border-color:  rgba(255, 145, 0, 0.882);
    color: black;
    border-radius: 5px;
    border-style:double;
    font-size: medium;
    text-decoration: none;
    margin: auto;

    
}
h1{
    margin: 0;
    align-items: center;
    position: absolute;
    top: 45px;
    font-size: 45px;
}
.list{
    margin: 0;
    position: absolute;

}
.paging-area{
    margin: 0;
    position: absolute;
    bottom: 200px;
    
}
#write{
	margin:0;
	position: absolute;
	bottom : 285px;
	right: 250px;
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
        

        <h1 ailgn="center" style="font-weight: bold;">리뷰게시판</h1>

       

            
            

           
               
            
            <br>
            
            <table class=list align='center' >
                <thead>
                    <tr height="50" style="background-color:#f5a60806;">
                        <td width='70' align="center">글 번호</td>
                        <td width='100' align="center">지역</td>
                        <td width='500' align="center">제목</td>
                        <td width='100' align="center">작성자</td>
                        <td width='100' align="center">조회수</td>
                        <td width='100' align="center">작성일</td>
                    </tr>
                </thead>
                <tbody>
               
                   <c:choose>
                   		<c:when test="${empty rList }">
                   			<tr>
                   				<td colspan="6">조회된 게시글이 없습니다.</td>
                   			</tr>
                   		</c:when>
                   		<c:otherwise>
                   			<c:forEach var="r" items="${rList }">
                   				<tr height="50">
                   					<td align="center" >${r.reviewNo }</td>
                   					<td align="center">${r.regionName }</td>
                   					<td>${r.reviewTitle }</td>
                   					<td align="center">${r.userId }</td>
                   					<td align="center">${r.reviewCount }</td>
                   					<td align="center">${r.reviewDate }</td>
                   				</tr>
                   			</c:forEach>
                   		</c:otherwise>
                   </c:choose>
                
               
            </tbody>
		</table>
            <br>
            <div id="write">
                <a href="<%=contextPath %>/insertReview.shs" id="submit" align="center">글작성</a>
            </div>
            
            <br><br>
            
            <div align="center" class="paging-area">
			 <c:if test="${pi.currentPage != 1 }">
			 	<button onclick="location.href='reviewList.shs?currentPage=${pi.currentPage-1}'">이전</button>
			 </c:if>
			
			<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
				
				<c:choose>
					<c:when test="${i != pi.currentPage }">
						<button onclick="location.href='reviewList.shs?currentPage=${i}'">${i}</button>
					</c:when>
					<c:otherwise>
						<!-- 현재 페이지 버튼은 비활성화 -->
						<button disabled>${i}</button>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			 <c:if test="${pi.currentPage != pi.maxPage }">
			 	<button onclick="location.href='reviewList.shs?currentPage=${pi.currentPage+1}'">다음</button>
			 </c:if>
		</div>
      
            
            
            
            
            

           
            
            

                
				


            
        
        
        
<!--         </form> -->


    </div>


<br><br><br><br><br><br>


    <%@ include file="/views/common/footer.jsp" %>
</body>

</html>