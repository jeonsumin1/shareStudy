<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
<style>
    .outer {
        width: 1000px;
        margin: auto;
        padding: 20px;
    }
    .detail-table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }
    .detail-table th {
        width: 150px;
        background-color: #f8f9fa;
        padding: 10px;
        text-align: left;
        border: 1px solid #ddd;
    }
    .detail-table td {
        padding: 10px;
        border: 1px solid #ddd;
    }
    .main-img {
        width: 100%;
        max-width: 500px;
        margin: 20px auto;
        display: block;
    }
    .sub-images {
        display: flex;
        justify-content: center;
        gap: 10px;
        margin: 20px 0;
    }
    .sub-images img {
        width: 150px;
        height: 150px;
        object-fit: cover;
        border: 1px solid #ddd;
        cursor: pointer;
    }
</style>
</head>
<body>
    <%@ include file="/views/common/menubar.jsp" %>
    
    <div class="outer">
        <h2 align="center">${room.roomName}</h2>
        
        <table class="detail-table">
            <tr>
                <th>주소</th>
                <td colspan="3">${room.roomAddress}</td>
            </tr>
            <tr>
                <th>이용가능인원</th>
                <td colspan="3">${room.roomSize}</td>
            </tr>
            <tr>
                <th>이용가격</th>
                <td colspan="3">${room.price}원</td>
            </tr>
            <tr>
                <th>야간이용가능</th>
                <td>${room.useNight == 'Y' ? '가능' : '불가능'}</td>
                <th>주차가능</th>
                <td>${room.parking == 'Y' ? '가능' : '불가능'}</td>
            </tr>
            <tr>
                <th>취식가능</th>
                <td colspan="3">${room.eating == 'Y' ? '가능' : '불가능'}</td>
            </tr>
        </table>

        <div class="image-area">
            <c:forEach items="${atList}" var="at">
                <c:if test="${at.fileLevel == 1}">
                    <img src="${contextPath}${at.filePath}${at.changeName}" class="main-img" id="mainImg">
                </c:if>
            </c:forEach>

            <div class="sub-images">
                <c:forEach items="${atList}" var="at">
                    <c:if test="${at.fileLevel == 2}">
                        <img src="${contextPath}${at.filePath}${at.changeName}" 
                             onclick="changeMainImage('${contextPath}${at.filePath}${at.changeName}')">
                    </c:if>
                </c:forEach>
            </div>
        </div>
        
        <div align="center">
            <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/reservation/form?roomNo=${room.roomNo}'">
                예약하기
            </button>
            <button type="button" class="btn btn-secondary" onclick="history.back();">
                목록으로
            </button>
        </div>
    </div>

    <script>
        function changeMainImage(src) {
            document.getElementById('mainImg').src = src;
        }
    </script>
</body>
</html>