<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.notice.model.vo.Review"%>
<!DOCTYPE html>
<% 
    // 세션에서 vList를 가져옴
    ArrayList<Review> vList = (ArrayList<Review>) session.getAttribute("vList");
    
    // vList에서 첫 번째 리뷰 객체를 가져옴 (리스트에 하나의 리뷰만 있을 경우)
    Review r = vList.get(0);
%>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 상세조회</title>
<link rel="stylesheet" href="${contextPath}/share/views/manager/css/manager.css">
</head>
<body>
    <section class="goods" id="goods">
        <h2>리뷰 상세조회</h2>

        <form name="goodsModify" method="post" action="updateGoodsResult.jsp">
        <table>
            <tr>
                <th width="13%">글 번호</th>
                <td><input type="hidden" name="no" id="no" value="<%= r.getReviewNo() %>"><%= r.getReviewNo() %></td>
            </tr>
            <tr>
                <th>작성자 아이디</th>
                <td><input type="hidden" name="userId" id="userId" value="<%= r.getUserId() %>"><%= r.getUserId() %></td>
            </tr>
            <tr>
                <th>상품 이름</th>
                <td><input type="hidden" name="roomNo" id="roomNo" value="<%= r.getRoomNo() %>"><%= r.getRoomNo() %></td>
            </tr>
            <tr>
                <th>리뷰 제목</th>
                <td><input type="hidden" name="reviewTitle" id="reviewTitle" value="<%= r.getReviewTitle() %>"><%= r.getReviewTitle() %></td>
            </tr>
            <tr>
                <th>리뷰 작성일</th>
                <td><input type="hidden" name="reviewDate" id="reviewDate" value="<%= r.getReviewDate() %>"><%= r.getReviewDate() %></td>
            </tr>
            <tr>
                <th>지역</th>
                <td><input type="hidden" name="regionName" id="regionName" value="<%= r.getRegionName() %>"><%= r.getRegionName() %></td>
            </tr>
            <tr>
                <th>리뷰 내용</th>
                <td><textarea name="reviewContent" id="reviewContent"><%= r.getReviewContent() %></textarea></td>
            </tr>
        </table>
        </form>
        
    </section>
</body>
</html>
