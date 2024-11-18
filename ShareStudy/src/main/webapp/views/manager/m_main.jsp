<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.member.model.vo.User
    ,com.kh.room.model.vo.Room, com.kh.member.model.vo.Question
    ,com.kh.notice.model.vo.Review, com.kh.reservation.model.vo.Reservation "%>

<%
    //회원
     ArrayList<User> mList = (ArrayList<User>) session.getAttribute("mList");
     ArrayList<Room> rList = (ArrayList<Room>) session.getAttribute("rList");
     ArrayList<Question> qList = (ArrayList<Question>) session.getAttribute("qList");
     ArrayList<Review> vList = (ArrayList<Review>) session.getAttribute("vList");
     ArrayList<Reservation> rvList = (ArrayList<Reservation>) session.getAttribute("rvList");
     int memCount = mList.size();
     int roomCount = rList.size();
     int questionCount = qList.size();
%>
<% 
    String errorMessage = (String) request.getAttribute("errorMessage");
    String altMsg = (String) request.getAttribute("altMsg"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
.delete-button {
    background-color: #FFD700; 
    color: #333; 
    font-weight: bold; 
    border: none; 
    border-radius: 8px; 
    padding: 8px 16px; 
    cursor: pointer; 
    text-align: center; 
    display: inline-block; 
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); 
    transition: background-color 0.3s ease, transform 0.2s ease; 
    vertical-align: middle; 
    line-height: 1; 
}

.delete-button:hover {
    background-color: #FFCC00; 
    transform: translateY(-2px); 
}

.delete-button:active {
    transform: translateY(0); 
}

td, th {
    text-align: center; 
}

</style>
<link rel="stylesheet" href="${contextPath}/share/views/manager/css/manager.css">
</head>
<body>

	<div class="total_board">
		<div class="board1">
			<h2>총 예약 건수 : 건</h2>
			<h3>현재 등록된 룸 갯수 : <%=roomCount%> 개</h3>
		</div>
		<div class="board2">
			<h2>회원 수 : <%=memCount%> 명</h2>
		</div>
		<div class="board3">
			<h2>상담 신청 내역 : <%=questionCount%> 건</h2>
		</div>
	</div>

	<section class="room" id="room">
		<h2>룸(상품) 관리</h2>

		<h3>룸(상품) 관리</h3>
		<table>
			<tr>
			    <th width="12%">룸 번호</th>
				<th width="12%">지역</th>
				<th width="20%">룸 명</th>
				<th width="13%">수용가능 인원</th>
				<th width="12%">가격</th>
				<th width="7%">예약가능 여부</th>
				<th width="7%">룸 상세정보</th>
				<th width="7%">삭제</th>
			</tr>
			<%
			    if (rList == null || rList.isEmpty()) {
			%>
			        <tr>
			            <td colspan="8">현재 등록된 룸이 없습니다</td>
			        </tr>
			<%
			    } else {
			        for (Room r : rList) {
			%>
			 <tr>
			       <td><%= r.getRoomNo() %></td>
			       <td><%= r.getRegionNo() %></td>
			       <td><%= r.getRoomName() %></td>
			       <td><%= r.getRoomSize() %></td>
			       <td><%= r.getPrice() %>원</td>
			       <td><%= r.getStatus() %></td>
			       <td><a href="${contextPath}/share/rselect.ma?rNo=<%= r.getRoomNo()%>">상세보기</a></td>
			       <td>
				 <form action="${contextPath}/share/rdelete.ma" method="post" style="display:inline;" 
                      onsubmit="return confirm('정말 삭제하시겠습니까?');">
                    <input type="hidden" name="roomNo" value="<%= r.getRoomNo() %>">
                    <button type="submit" class="delete-button">삭제</button>
                    <% if (altMsg != null) { %>
	                 <script type="text/javascript">
	                        alert("<%= altMsg %>");
	                        location.reload();
	                 </script>
	                 <% 
	                     request.setAttribute("altMsg", null); 
	                 %>
	                 <% } %>
                </form>
                </td>
			  </tr>
			                
			
			
			<%             
			        }
			    }
			%>
		</table>
	</section>

	<section class="reservation" id="reservation">
    <h2>관리</h2>

    <h3>회원 예약</h3>
    <table>
        <tr>
            <th width="10%">예약 번호</th>
            <th width="10%">룸(상품) 번호</th>
            <th width="13%">예약자 ID</th>
            <th width="18%">예약시간</th>
            <th width="18%">예약확정일</th>
            <th width="12%">결제방법</th>
            <th width="9%">상세보기</th>
            <th width="9%">삭제</th>
        </tr>
        <%
            if (rvList == null || rvList.isEmpty()) {
        %>
            <tr>
                <td colspan="8">예약 정보가 없습니다.</td>
            </tr>
        <%
            } else {
                for (Reservation rv : rvList) {
        %>
            <tr>
                <td><%= rv.getRvNo() %></td>
                <td><%= rv.getRoomNo() %></td>
                <td><%= rv.getUserId() %></td>
                <td><%= rv.getReDate() %></td>
                <td><%= rv.getRvConfirm() %></td>
                <td><%= rv.getRvPayment() %></td>
               <td><a href="${contextPath}/share/rvselect.ma?rvNo=<%= rv.getRvNo()%>">상세보기</a></td>
                <td>
			     <form action="${contextPath}/share/rvdelete.ma" method="post" style="display:inline;" onsubmit="return confirm('정말 삭제하시겠습니까?');">
					<input type="hidden" name="rvNo" value="<%=rv.getRvNo()%>">
					<input type="hidden" name="rmNo" value="<%=rv.getRoomNo()%>">
					<button type="submit" class="delete-button">삭제</button>
				</form>
				</td> 
            </tr>
        <%
                }
            }
        %>
    </table>
</section>

	<section class="member" id="member">
		<h2>회원 정보 관리</h2>
   
		<table>
			<tr>
				<th width="10%">회원 아이디</th>
				<th width="15%">회원 이름</th>
				<th width="20%">이메일</th>
				<th width="15%">전화번호</th>
				<th width="19%">가입일자</th>
				<th width="7%">수신 동의</th>
				<th width="7%">상세보기</th>
				<th width="7%">삭제</th>
			</tr>
			<%
			    if (mList == null || mList.isEmpty()) {
			%>
			        <tr>
			            <td colspan="8">조회할 회원 정보가 없습니다.</td>
			        </tr>
			<%
			    } else {
			        for (User u : mList) {
			%>
			            <tr>
			                <td><%= u.getUserId() %></td>
			                <td><%= u.getUserName() %></td>
			                <td><%= u.getEmail() %></td>
			                <td><%= u.getUserPhone() %></td>
			                <td><%= u.getEnrollDate() %></td>
			                <td><% if (u.getAdAccept() != null && u.getAdAccept().contains("마케팅동의")) { %>
                                      Y
                                 <% } else { %>
                                     N
                                 <% } %></td>
			                 
			                <td><a href="${contextPath}/share/uselect.ma?userId=<%= u.getUserId()%>">상세보기</a></td>
			                  <td>
			                 <form action="${contextPath}/share/mdelete.ma" method="post" style="display:inline;" onsubmit="return confirm('정말 삭제하시겠습니까?');">
							        <input type="hidden" name="userId" value="<%= u.getUserId() %>">
							        <button type="submit" class="delete-button">삭제</button>
							    </form>
							</td> 
			            </tr>
			<%             
			        }
			    }
			%>
		</table>
	</section>

	<section class="review" id="review">
    <h2>리뷰 관리</h2>

    <table>
        <tr>
            <th width="10%">게시글 번호</th>
            <th width="25%">작성일</th>
            <th width="15%">작성자</th>
            <th width="30%">리뷰 제목</th>
            <th width="10%">상세보기</th>
            <th width="10%">삭제</th>
        </tr>
        <%
            if (vList == null || vList.isEmpty()) {
        %>
            <tr>
                <td colspan="5">리뷰 정보가 없습니다.</td>
            </tr>
        <%
            } else {
                for (Review v : vList) {
        %>
            <tr>
                <td><%= v.getReviewNo() %></td>
                <td><%= v.getReviewDate() %></td>
                <td><%= v.getUserId() %></td>
                <td><%= v.getReviewTitle() %></td>
               <td><a href="${contextPath}/share/vselect.ma?vNo=<%= v.getReviewNo()%>">상세보기</a></td>
                <td>
				<form action="${contextPath}/share/vdelete.ma" method="post" style="display:inline;" 
                      onsubmit="return confirm('정말 삭제하시겠습니까?');">
                    <input type="hidden" name="vNo" value="<%= v.getReviewNo() %>">
                    <button type="submit" class="delete-button">삭제</button>
                    <% if (altMsg != null) { %>
	                 <script type="text/javascript">
	                        alert("<%= altMsg %>");
	                        location.reload();
	                 </script>
	                 <% 
	                     request.setAttribute("altMsg", null); 
	                 %>
	                 <% } %>
                </form>
                </td>
            </tr>
        <%
                }
            }
        %>
    </table>
</section>
	
	<section class="question" id="question">
		<h2>1:1상담 신청 내역</h2>
  
		<table>
			<tr>
				<th width="25%">신청자</th>
				<th width="25%">전화번호</th>
				<th width="30%">신청일</th>
				<th width="10%">상세보기</th>
				<th width="10%">삭제</th>
			</tr>
			<%
			    if (qList == null || qList.isEmpty()) {
			%>
			        <tr>
			            <td colspan="5">상담 신청 내역이 없습니다.</td>
			        </tr>
			 <%}else{
				 for(Question q : qList){%>
			<tr>
				<td><%= q.getUserId() %></td>
				<td><%= q.getQtPhone() %></td>
				<td><%= q.getQtDate() %></td> 
				<td><a href="${contextPath}/share/qselect.ma?vNo=<%= q.getQtPhone()%>">상세보기</a></td>
				<td>
				<form action="${contextPath}/share/qdelete.ma" method="post" style="display:inline;" 
                      onsubmit="return confirm('정말 삭제하시겠습니까?');">
                    <input type="hidden" name="userId" value="<%= q.getUserId() %>">
                    <button type="submit" class="delete-button">삭제</button>
                    <% if (altMsg != null) { %>
	                 <script type="text/javascript">
	                        alert("<%= altMsg %>");
	                        location.reload();
	                 </script>
	                 <% 
	                     request.setAttribute("altMsg", null); 
	                 %>
	                 <% } %>
                </form>
                </td>
			</tr> 
				<% 
				}
			 }
			%>       
			 
			
		</table>
	</section>

	<section class="graph_n_chart" id="chart_wrap">
		<h2>통계</h2>
		<div class="chart1">
			<h3>순위</h3>
			<canvas id="myChart1"></canvas>
		</div>
		<div class="chart2">
			<h3>카테고리</h3>
			<div class="chart2_group">
				<canvas id="myChart2"></canvas>
			</div>
		</div>
	</section>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
<script>

let labels = ['상품 A', '상품 B', '상품 C', '상품 D', '상품 E']; 
let totalQuantities = [50, 30, 20, 40, 10]; 

// 막대형 차트 설정
let myCt1 = document.getElementById('myChart1');
let myChart1 = new Chart(myCt1, {
    type: 'bar',
    data: {
        labels: labels,
        datasets: [{
            label: '판매량(개)',
            data: totalQuantities, 
        }]
    },
    options: {
        responsive: true,
        plugins: {
            title: {
                display: true,
                text: '카테고리별 제품 구매 회수'
            }
        },
        scales: {
            y: {
                beginAtZero: true
            }
        },
    },
});

let ctgLabels = ['카테고리 A', '카테고리 B', '카테고리 C', '카테고리 D'];
let ctgData = [25, 15, 30, 20];


let myCt2 = document.getElementById('myChart2');
let myChart2 = new Chart(myCt2, {
    type: 'doughnut',
    data: {
        labels: ctgLabels,
        datasets: [{
            data: ctgData, 
        }]
    },
    options: {
        responsive: true,
        plugins: {
            title: {
                display: true,
                text: '카테고리별 제품 구매 회수'
            }
        },
    },
});
</script>


</html>
