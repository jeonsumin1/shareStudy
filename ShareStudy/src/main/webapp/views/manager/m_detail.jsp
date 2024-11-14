<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/share/views/manager/css/manager.css">
</head>
<body>
		<section class="goods" id="goods">
			<h2>상세보기</h2>
			<h3>예약조회</h3>

			<form name="goodsModify" method="post" action="updateGoodsResult.jsp">

			<table>
				<tr>
					<th width="13%">예약 확인</th>
					<td><input type="text" name="no" id="no" value=""></td>
				</tr>
				<tr>
					<th>방 상세정보</th>
					<td><img src="" onclick="window.open(this.src)"></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="text" name="type" id="type" value=""></td>
				</tr>
				<tr>
					<th>상세 설명</th>
					<td><textarea name="detail" id="detail"></textarea></td>
				</tr>
			</table>
			
			<h3>결제방법</h3>
			<table>
				<tr>
					<th width="13%">결제 방법</th>
					<td><input type="text" name="no" id="no" value=""></td>
				</tr>
				<tr>
					<th>방 상세정보</th>
					<td><img src="" onclick="window.open(this.src)"></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="text" name="type" id="type" value=""></td>
				</tr>
				<tr>
					<th>상세 설명</th>
					<td><textarea name="detail" id="detail"></textarea></td>
				</tr>
			</table>
			<a href="m_main.jsp"><div class="btn_back">뒤로가기</div></a>

			</form>
			
		</section>
</body>
</html>