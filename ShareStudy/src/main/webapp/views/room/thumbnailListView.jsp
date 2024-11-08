<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<style>
    .list-area{
        width : 760px;
        margin : auto;
    }
    .thumbnail{
        border : 1px solid white;
        width : 220px;
        display : inline-block;
        margin : 14px;
    }
    .thumbnail:hover{
        cursor : pointer;
        opacity : 0.7;
    }
</style>
</head>
<body>
    <%@ include file="/views/common/menubar.jsp" %>
    <div class="outer">
        <h2 align="center">상품 상세보기</h2>
        <br>
        
        <c:if test="${'admin'eq userid}">
        <div align="center">
            <button class="btn btn-info" onclick="location.href='<%=contextPath%>/room/insert.shs'">상품등록</button>
        </div>
       </c:if>
				
			        
        <div class="list-area">
            <c:forEach var="room" items="${list}">
                <div class="thumbnail" align="center" onclick="location.href='<%=contextPath%>/detail.room?rno=${room.roomNo}'">
              
                    <%-- <img src="${contextPath}${room.titleImg}" width="200px" height="150px"> --%>
                    <img src="..${room.titleImg}" width="230px" height="160px">
                   
                    <p>
                        지역 : ${region.regionName}<br>
                        ${room.roomName}<br>
                        이용가격: ${room.price}원
                    </p>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>