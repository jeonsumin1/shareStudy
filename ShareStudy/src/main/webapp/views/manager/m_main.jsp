<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.member.model.vo.User
    ,com.kh.reservation.model.vo.Room"%>

<%
    //회원
     ArrayList<User> mList = (ArrayList<User>) session.getAttribute("mList");
     ArrayList<Room> rList = (ArrayList<Room>) session.getAttribute("rList");
     int memCount = mList.size();
     int roomCount = rList.size();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<link rel="stylesheet" href="${contextPath}/share/views/manager/css/manager.css">
</head>
<body>

	<div class="total_board">
		<div class="board1">
			<h2>총 예약 건수 : 건</h2>
			<h3>현재 등록된 룸 갯수 : <%=roomCount %> 건</h3>
		</div>
		<div class="board2">
			<h2>회원 수 : <%=memCount%> 명</h2>
		</div>
		<div class="board3">
			<h2>리뷰 수 : 15 개</h2>
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
				<th width="7%">예약 가능 여부</th>
				<th width="7%">룸 상세정보</th>
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
			        for (Room r : rList) {
			%>
			 <tr>
			       <td><%= r.getRoomNo() %></td>
			       <td><%= r.getRegionNo() %></td>
			       <td><%= r.getRoomName() %></td>
			       <td><%= r.getRoomSize() %></td>
			       <td><%= r.getPrice() %>원</td>
			       <td><%= r.getStatus() %></td>
			       <td><a href="">상세보기</a></td>
			       <td><a href="">삭제</a></td>
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
			    <th width="7%">행1</th>
			    <th width="7%">행2</th>
				<th width="19%">행3</th>
				<th width="17%">행4</th>
				<th width="19%">행5</th>
				<th width="12%">행6</th>
				<th width="9%">행7</th>
				<th width="9%">행8</th>
			</tr>
			
			<tr>
			    <td>값1</td>
			    <td>값2</td>
				<td>값3</td>
				<td>값4</td>
				<td>값5</td>
				<td>값6</td>
				<td>값7</td>
				<td>값8</td>
			</tr>
		</table>

		<h3>비회원 예약</h3>
		<table>
			<tr>
			    <th width="7%">행1</th>
			    <th width="7%">행2</th>
				<th width="19%">행3</th>
				<th width="14%">행4</th>
				<th width="14%">행5</th>
				<th width="7%">행6</th>
				<th width="14%">행7</th>
				<th width="9%">행8</th>
				<th width="9%">행9</th>
			</tr>
			<tr>
			    <td>값1</td>
			    <td>값2</td>
				<td>값3</td>
				<td>값4</td>
				<td>값5</td>
				<td>값6</td>
				<td>값7</td>
				<td>값8</td>
				<td>값9</td>
			</tr>
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
				<th width="7%"></th>
			</tr>
			<%
			    if (mList == null || mList.isEmpty()) {
			%>
			        <tr>
			            <td colspan="7">조회할 회원 정보가 없습니다.</td>
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
			                 
			                <td><a href="">상세보기</a></td>
			                <td><form action="${contextPath}/share/mdelete.ma" method="post" style="display:inline;">
							        <input type="hidden" name="userId" value="<%= u.getUserId() %>">
							        <button type="submit">삭제</button>
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
				<th width="25%">작성일</th>
				<th width="15%">작성자</th>
				<th width="40%">리뷰 제목</th>
				<th width="10%">상세보기</th>
				<th width="10%">삭제</th>
			</tr>
			<tr>
				<td>값1</td>
				<td>값2</td>
				<td>값3</td>
				<td>값4</td>
				<td>값5</td>
			</tr>
		</table>
	</section>
	
	<section class="question" id="question">
		<h2>1:1상담 신청 내역</h2>
  
		<table>
			<tr>
				<th width="25%">신청자</th>
				<th width="25%">전화번호</th>
				<th width="40%">신청일</th>
				<th width="10%">삭제</th>
			</tr>
			<tr>
				<td>값1</td>
				<td>값2</td>
				<td>값3</td>
				<td>값4</td>
			</tr>
		</table>
	</section>

	<section class="graph_n_chart" id="chart_wrap">
		<h2>통계</h2>
		<div class="chart1">
			<h3>순위(그래프 예정)</h3>
			<canvas id="myChart1"></canvas>
		</div>
		<div class="chart2">
			<h3>카테고리(그래프 예정)</h3>
			<div class="chart2_group">
				<canvas id="myChart2"></canvas>
			</div>
		</div>
	</section>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
<script>

</script>

</html>
