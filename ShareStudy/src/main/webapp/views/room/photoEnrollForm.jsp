<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#enroll-form input, #enroll-form textarea {
	width: 100%;
	box-sizing: border-box;
}

#enroll-form td>img {
	width: 100%;
	height: 100%;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script></head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>

	<div class="outer">
		<br>
		<h2 align="center">상품 등록</h2>
		<br>

		<form action="<%=contextPath%>/productDetail.shs" method="post" id="enroll-form" enctype="multipart/form-data">
			<table align="center">
				<tr>
					<th width="100">상품번호</th>
					<td colspan="3"><input type="text" name="roomNo" required>
					</td>
				</tr>
				<tr>
					<!-- 지역 선택할수 있게 -->
					<th width="100">지역번호</th>
					<td>
						<select name="regionNo">
							<option value="1">서울1</option>
							<option value="2">경기2</option>
							<option value="3">인천3</option>
							<option value="4">부산4</option>
							<option value="5">대구5</option>
							<option value="6">대전6</option>
							<option value="7">제주7</option>
							<option value="8">강원8</option>
							<option value="9">경남9</option>
							<option value="10">경북10</option>
							<option value="11">전남11</option>
							<option value="12">전북12</option>
							<option value="13">충남13</option>
							<option value="14">충북14</option>
							
						</select>					
					</td>	
				</tr>
				<tr>
					<th width="100">상품이름</th>
					<td colspan="3"><input type="text" name="roomName" required>
					</td>
				</tr>
				<tr>
					<th width="100">상품주소</th>
					<td colspan="3"><input type="text" name="roomAddress" required>
					</td>
				</tr>
				<tr>
					<th width="100">이용가능인원</th>
					<td colspan="3"><input type="text" name="roomSize" placeholder = "최소인원~최대인원 으로 입력하세요." required>
					</td>
				</tr>
				<tr>
					<th width="100">이용가격  (시간/인당)</th>
					<td colspan="3"><input type="text" name="price" placeholder = "단위(원)" required>
					</td>
				</tr>
				<tr>
					<th width="150">야간이용 가능유무</th>
					<td>
						<input type="radio" id="x" name="useNight" value="N" checked>
						<label for="x" >불가능</label> 
						<input type="radio" id="o" name="useNight" value="Y">
						<label for="o">가능</label>
					</td>
				</tr>
				<tr>
					<th width="150">주차이용 가능유무</th>
					<td>
						<input type="radio" id="x" name="parking" value="N" checked>
						<label for="x" >불가능</label> 
						<input type="radio" id="o" name="parking" value="Y">
						<label for="o">가능</label>
					</td>
				</tr>
				<tr>
					<th width="150">취식 가능유무</th>
					<td>
						<input type="radio" id="x" name="eating" value="N" checked>
						<label for="x" >불가능</label> 
						<input type="radio" id="o" name="eating" value="Y">
						<label for="o">가능</label>
					</td>
				</tr>
				

				<tr>
					<th>메인사진</th>
					<td colspan="3" align="center" width="250" height="170"><img
						id="mainImg">
				</tr>
				<tr>
					<th>추가사진</th>
					<td width="150" height="120"><img id="contentImg1"></td>
					<td width="150" height="120"><img id="contentImg2"></td>
					<td width="150" height="120"><img id="contentImg3"></td>

				</tr>


			</table>
			<br>
			<br>

			<div id="file-area">
				<input type="file" id="file1" name="file1" onchange="loadImg(this,1);" required>
				<input type="file" id="file2" name="file2" onchange="loadImg(this,2);">
				<input type="file" id="file3" name="file3" onchange="loadImg(this,3);">
				<input type="file" id="file4" name="file4" onchange="loadImg(this,4);">
			</div>
			
				
			<div align="center">	
				<button type="submit">등록</button>
				<button type="button" onclick="history.back();">취소</button>			
			</div>
		</form>
		
			<script>
			
				$(function(){
					$("#mainImg").click(function(){
						$("#file1").click();
					});
					$("#contentImg1").click(function(){
						$("#file2").click();
					});
					$("#contentImg2").click(function(){
						$("#file3").click();
					});
					$("#contentImg3").click(function(){
						$("#file4").click();
					});
					$("#file-area").hide();
				});
			
			
			
			
			
				function loadImg(inputFile,num){
					if(inputFile.files.length == 1){
					
						var reader = new FileReader();

						reader.readAsDataURL(inputFile.files[0]);
						
						reader.onload = function(e){
							
							switch(num){
								case 1 : $("#mainImg").attr("src",e.target.result);break;
								case 2 : $("#contentImg1").attr("src",e.target.result);break;
								case 3 : $("#contentImg2").attr("src",e.target.result);break;
								case 4 : $("#contentImg3").attr("src",e.target.result);break;
							}
							
						};
					
					}else{
						switch(num){
							case 1 : $("#mainImg").attr("src",null);break;
							case 2 : $("#contentImg1").attr("src",null);break;
							case 3 : $("#contentImg2").attr("src",null);break;
							case 4 : $("#contentImg3").attr("src",null);break;
						
						}
					}
			
				}
			</script>
		
		
		
	</div>
</body>
</html>