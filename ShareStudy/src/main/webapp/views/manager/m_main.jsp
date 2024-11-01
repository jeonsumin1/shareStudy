<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<h3>현재 등록된 룸 갯수 :  건</h3>
		</div>
		<div class="board2">
			<h2>회원 수 : 500 명</h2>
		</div>
		<div class="board3">
			<h2>리뷰 수 : 15 개</h2>
		</div>
	</div>

	<section class="goods" id="goods">
		<h2>관리</h2>

		<h3>관리1</h3>
		<table>
			<tr>
			    <th width="12%">행1</th>
				<th width="12%">행2</th>
				<th width="20%">행3</th>
				<th width="13%">행4</th>
				<th width="13%">행5</th>
				<th width="10%">행6</th>
				<th width="10%">행7</th>
			</tr>
			<tr>
			    <td>값1</td>
				<td>값2</td>
				<td>값3</td>
				<td>값4</td>
				<td>값5</td>
				<td>값6</td>
				<td>값7</td>
			</tr>
		</table>
	</section>

	<section class="order" id="order">
		<h2>관리</h2>

		<h3>관리2</h3>
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

		<h3>관리3</h3>
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
				<th width="10%">행1</th>
				<th width="15%">행2</th>
				<th width="20%">행3</th>
				<th width="31%">행4</th>
				<th width="10%">행5</th>
				<th width="7%">행6</th>
				<th width="7%">행7</th>
			</tr>
			<tr>
				<td>값1</td>
				<td>값2</td>
				<td>값3</td>
				<td>값4</td>
				<td>값5</td>
				<td>값6</td>
				<td>값7</td>
			</tr>
		</table>
	</section>

	<section class="review" id="review">
		<h2>리뷰 관리</h2>
  
		<table>
			<tr>
				<th width="25%">행1</th>
				<th width="15%">행2</th>
				<th width="40%">행3</th>
				<th width="10%">행4</th>
				<th width="10%">행5</th>
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

</script>

</html>
