<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.reservation.model.vo.Reservation, 
                                  com.kh.reservation.model.vo.RvBank"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세보기</title>
<link rel="stylesheet" href="${contextPath}/share/views/manager/css/manager.css">
</head>
<body>
    <section class="goods" id="goods">
        <h2>상세보기</h2>
        <h3>예약조회</h3>

        <%
            Reservation r = (Reservation) session.getAttribute("rvvList");
            RvBank b = (RvBank) session.getAttribute("baList");
        %>

        <form name="goodsModify" method="post" action="updateGoodsResult.jsp">
            <table>
                <tr>
                    <th width="13%">예약 번호</th>
                    <td><%= r.getRvNo() %></td>
                </tr>
                <tr>
                    <th>상품 번호</th>
                    <td><%= r.getRoomNo() %></td>
                </tr>
                <tr>
                    <th>예약자 아이디</th>
                    <td><%= r.getUserId() %></td>
                </tr>
                <tr>
                    <th>예약 인원</th>
                    <td><%= r.getRePeople() %></td>
                </tr>
                <tr>
                    <th>방문 날짜</th>
                    <td><%= r.getReDate() %></td>
                </tr>
                <tr>
                    <th>예약 확정일</th>
                    <td><%= r.getRvConfirm() %></td>
                </tr>
                <tr>
                    <th>결제방법</th>
                    <td><%= r.getRvPayment() %></td>
                </tr>
                <tr>
                    <th>요청사항</th>
                    <td><%= r.getRvRequest() %></td>
                </tr>
            </table>
             <% if (r.getRvPayment().equals("bank")) { %>
            <table>
                <tr>
                    <th width="13%">예약 번호</th>
                    <td><%= b.getRvNo() %></td>
                </tr>
                <tr>
                    <th>입금 은행</th>
                     <td>
			       <%
			           String bankCode = b.getRvBank();
			           String bankName = "";
			           if ("KI".equals(bankCode)) {
			               bankName = "기업은행";
			           } else if ("KUK".equals(bankCode)) {
			               bankName = "국민은행";
			           } else {
			               bankName = "알 수 없는 은행";
			           }
			       %>
			       <%= bankName %>
                   </td>
                </tr>
                <tr>
                    <th>입금자명 </th>
                    <td><%= b.getRvName() %></td>
                </tr>
                <tr>
                    <th>입금예정일</th>
                    <td><%= b.getRvDate() %></td>
                </tr>
                <tr>
                    <th>결제 금액</th>
                    <td><%= b.getAmount() %></td>
                </tr>
            </table>
            <%}else{%>
                <table>
                <tr>
                    <th width="13%">예약 번호</th>
                    <td><%= r.getRvNo() %></td>
                </tr>
                <tr>
                    <th>결제 방법</th>
                    <td>카드 결제</td>
                </tr>
                </table>
            <%} %>
        </form>
    </section>
</body>
</html>
