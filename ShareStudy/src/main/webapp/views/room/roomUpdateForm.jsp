<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸 수정</title>
<style>
.outer {
	width: 1000px;
	margin: auto;
	padding: 20px;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

.preview-area {
	display: flex;
	gap: 10px;
	margin: 10px 0;
}

.preview-area img {
	width: 150px;
	height: 150px;
	object-fit: cover;
	border: 1px solid #ddd;
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>

	<div class="outer">
		<h2 align="center">스터디룸 정보 수정</h2>

		<form action="<%=contextPath%>/roomUpdate.shs" method="post"
			enctype="multipart/form-data">

			<input type="hidden" name="roomNo" value="${room.roomNo}">

			<div class="form-group">
				<label for="regionNo">지역:</label> <select name="regionNo"
					id="regionNo" class="form-control" required>
					<c:forEach items="${regionList}" var="region">
						<option value="${region.regionNo}"
							${room.regionNo eq region.regionNo ? 'selected' : ''}>
							${region.regionName}</option>
					</c:forEach>
				</select>
			</div>

			<div class="form-group">
				<label for="roomName">스터디룸명:</label> <input type="text"
					name="roomName" id="roomName" class="form-control"
					value="${room.roomName}" required>
			</div>

			<div class="form-group">
				<label for="roomAddress">주소:</label> <input type="text"
					name="roomAddress" id="roomAddress" class="form-control"
					value="${room.roomAddress}" required>
			</div>

			<div class="form-group">
				<label for="roomSize">이용가능인원:</label> <input type="text"
					name="roomSize" id="roomSize" class="form-control"
					value="${room.roomSize}" required>
			</div>

			<div class="form-group">
				<label for="price">이용가격:</label> <input type="text" name="price"
					id="price" class="form-control" value="${room.price}" required>
			</div>

			<div class="form-group">
				<label>야간이용가능:</label> <input type="radio" name="useNight" value="Y"
					${room.useNight eq 'Y' ? 'checked' : ''}> 가능 <input
					type="radio" name="useNight" value="N"
					${room.useNight eq 'N' ? 'checked' : ''}> 불가능
			</div>

			<div class="form-group">
				<label>주차가능:</label> <input type="radio" name="parking" value="Y"
					${room.parking eq 'Y' ? 'checked' : ''}> 가능 <input
					type="radio" name="parking" value="N"
					${room.parking eq 'N' ? 'checked' : ''}> 불가능
			</div>

			<div class="form-group">
				<label>취식가능:</label> <input type="radio" name="eating" value="Y"
					${room.eating eq 'Y' ? 'checked' : ''}> 가능 <input
					type="radio" name="eating" value="N"
					${room.eating eq 'N' ? 'checked' : ''}> 불가능
			</div>

			<div class="form-group">
				<label>현재 이미지:</label>
				<div class="preview-area">
					<c:forEach items="${atList}" var="at" varStatus="vs">
						<div>
							<img src="<%=contextPath%>${at.filePath}${at.changeName}">
							<input type="hidden" name="originalFileNo${vs.count}"
								value="${at.fileNo}"> <input type="hidden"
								name="originalFileName${vs.count}" value="${at.changeName}">
						</div>
					</c:forEach>
				</div>
			</div>

			<div class="form-group">
				<label>이미지 수정:</label> <input type="file" name="file1"
					accept="image/*" onchange="loadImg(this, 1);"> <input
					type="file" name="file2" accept="image/*"
					onchange="loadImg(this, 2);"> <input type="file"
					name="file3" accept="image/*" onchange="loadImg(this, 3);">
				<input type="file" name="file4" accept="image/*"
					onchange="loadImg(this, 4);">
			</div>

			<div align="center">
				<button type="submit" class="btn btn-primary">수정완료</button>
				<button type="button" class="btn btn-secondary"
					onclick="history.back();">취소</button>
			</div>
		</form>
	</div>

	<script>
		function loadImg(inputFile, num) {
			if (inputFile.files.length == 1) {
				const reader = new FileReader();
				reader.readAsDataURL(inputFile.files[0]);
				reader.onload = function(e) {
					// preview-area에서 해당 순서의 이미지 찾기
					const imgTags = document
							.querySelectorAll('.preview-area img');
					if (imgTags.length >= num) {
						imgTags[num - 1].src = e.target.result;
					}
				}
			}
		}
	</script>
</body>
</html>