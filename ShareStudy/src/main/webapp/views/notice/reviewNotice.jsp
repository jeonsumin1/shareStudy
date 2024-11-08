<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰게시판</title>

    <style>

    
.outer {
            display: flex; /* 플렉스 박스 사용 */
            justify-content: center; /* 수평 중앙 정렬 */
            align-items: center; /* 수직 중앙 정렬 (필요할 경우) */
            border: 1px solid #99999953;
            width: 800px;
            height: 700px;
            margin: auto;
            margin-top: 50px;
            border-radius: 10px;

            
            
        }
    

    input[type="text"]{
    border-radius: 5px;
    border: 1px solid #99999953;
    height: 30px;
    width: px;
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
    select{
        border-radius: 5px;
        border: 1px solid #99999953;
        height: 30px;
        width: 100px;
    }
   
    #title{
    border-radius: 5px;
    border: 1px solid #99999953;
    height: 30px;
    width: 99%;
}

    #writer{
    border-radius: 5px;
    border: 1px solid #99999953;
    height: 30px;
    width: 98%;
    }
    </style>
</head>
<body>

    <div class="outer">
        


        <form action="${contextPath}"/insertReview.shs method="post" id="review-area" enctype="multipart/form-data">
            
            <h2 align="center">리뷰 게시판</h2>

            <table align="center"  >
                <tr>
                    <td align="center">제목</td>
                    <td colspan="5"><input type="text" id="title"></td>
                </tr>
                <tr>
                    <td align="center">작성자</td>
                    <td><input type="text" id="writer"></td>
                    <td align="center">장소</td>
                    <td><input type="text"></td>
                    <td align="center">지역</td>
                    <td><select name="region" id="">
                         <option value="서울">서울</option>
                         <option value="인천">인천</option>
                         <option value="경기">경기</option>
                         <option value="부산">부산</option>
                         <option value="강원도">강원도</option>
                    </select>
                    </td>
                    
                </tr>
                <tr>
                   
                </tr>
                <tr> 
                    <td align="center">내용</td>
                    <td colspan="6" height="300"><textarea name="content" rows='10'></textarea></td>
                    
                </tr>
                
                <tr>
                    <td align="center">첨부파일</td>
                    <td colspan="6" align="center"><input type="file"></td>
                </tr>



                




            </table>
        
        
        
        </form>







    </div>
    
</body>
</html>