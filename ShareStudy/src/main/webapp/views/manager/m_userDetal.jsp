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
			<h2>상품(룸) 상세조회</h2>

			<form name="goodsModify" method="post" action="updateGoodsResult.jsp">
			<table>
				<tr>
					<th width="13%">상품(룸) 번호</th>
					<td><input type="text" name="no" id="no" value=""></td>
				</tr>
				<tr>
					<th>지역</th>
					<td><input type="text" name="type" id="type" value=""></td>
				</tr>
				<tr>
					<th>상품 이름</th>
					<td><textarea name="detail" id="detail"></textarea></td>
				</tr>
			</table>
			</form>
			
		</section>
</body>
</html>