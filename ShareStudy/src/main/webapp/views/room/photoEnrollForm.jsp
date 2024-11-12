  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<style>
    .outer {
        width: 1000px;
        margin: auto;
        padding: 20px;
    }
    #enroll-form table { width: 100%; }
    #enroll-form th { width: 200`px; padding: 10px; }
    #enroll-form input[type="text"], #enroll-form select { 
        width: 100%; 
        padding: 8px;
        margin: 5px 0;
    }
    .img-area {
        width: 150px;
        height: 150px;
        border: 1px solid #ddd;
        display: flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
    }
    .img-area img {
        max-width: 100%;
        max-height: 100%;
    }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <%@ include file="/views/common/menubar.jsp" %>
    
    <div class="outer">
        <h2 align="center">상품 등록</h2>
        
        <form action="<%=contextPath%>/room/insert.shs" method="post"  
              enctype="multipart/form-data" id="enroll-form" onsubmit="return validateForm()">
            <table>
                <tr>
                    <th>상품번호</th>
                    <td><input type="text" name="roomNo" required></td>
                </tr>
                <tr>
                    <th>지역</th>
                    <td>
                        <select name="regionNo" required>
                            <c:forEach items="${regionList}" var="region">
                                <option value="${region.regionNo}">${region.regionName}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>상품이름</th>
                    <td><input type="text" name="roomName" required></td>
                </tr>
                <tr>
                    <th>상품주소</th>
                    <td><input type="text" name="roomAddress" required></td>
                </tr>
                <tr>
                    <th>이용가능인원</th>
                    <td>
                        <input type="text" name="roomSize" 
                               placeholder="최소인원~최대인원 으로 입력하세요." required>
                    </td>
                </tr>
                <tr>
                    <th>이용가격</th>
                    <td>
                        <input type="text" name="price" placeholder="단위(원)" required>
                    </td>
                </tr>
                <tr>
                    <th>야간이용 가능유무</th>
                    <td>
                        <input type="radio" id="useNight_n" name="useNight" value="N" checked>
                        <label for="useNight_n">불가능</label>
                        <input type="radio" id="useNight_y" name="useNight" value="Y">
                        <label for="useNight_y">가능</label>
                    </td>
                </tr>
                <tr>
                    <th>주차이용 가능유무</th>
                    <td>
                        <input type="radio" id="parking_n" name="parking" value="N" checked>
                        <label for="parking_n">불가능</label>
                        <input type="radio" id="parking_y" name="parking" value="Y">
                        <label for="parking_y">가능</label>
                    </td>
                </tr>
                <tr>
                    <th>취식 가능유무</th>
                    <td>
                        <input type="radio" id="eating_n" name="eating" value="N" checked>
                        <label for="eating_n">불가능</label>
                        <input type="radio" id="eating_y" name="eating" value="Y">
                        <label for="eating_y">가능</label>
                    </td>
                </tr>
                <tr>
                    <th>메인 이미지</th>
                    <td>
                        <div class="img-area" onclick="$('#file1').click();">
                            <img id="contentImg1">
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>추가 이미지</th>
                    <td>
                        <div class="img-area" onclick="$('#file2').click();">
                            <img id="contentImg2">
                        </div>
                        <div class="img-area" onclick="$('#file3').click();">
                            <img id="contentImg3">
                        </div>
                        <div class="img-area" onclick="$('#file4').click();">
                            <img id="contentImg4">
                        </div>
                    </td>
                </tr>
            </table>         
           
            <div id="file-area">
                <input type="file" id="file1" name="file1" onchange="loadImg(this,1);" required>
                <input type="file" id="file2" name="file2" onchange="loadImg(this,2);">
                <input type="file" id="file3" name="file3" onchange="loadImg(this,3);">
                <input type="file" id="file4" name="file4" onchange="loadImg(this,4);">
            </div>
            
            <div align="center" style="margin-top: 20px;">
                <button type="submit" class="btn btn-primary">등록하기</button>
                <button type="reset" class="btn btn-secondary">초기화</button>
            </div>
        </form>
    </div>
    
</body>

<script>
        function validateForm() {
            // 상품번호 검증
            const roomNo = document.querySelector('input[name="roomNo"]').value;
            if(!/^[A-Za-z0-9]+$/.test(roomNo)) {
                alert('상품번호는 영문자와 숫자만 입력 가능합니다.');
                return false;
            }
            
            
 
 			// 이용가능인원 검증
 			const roomSize = document.querySelector('input[name="roomSize"]').value;
            if(!/^\d+~\d+$/.test(roomSize)) {
                alert('이용가능인원은 숫자~숫자 형식으로 입력해주세요.');
                return false;
            }
            
            // 가격 검증
            const price = document.querySelector('input[name="price"]').value;
            if(!/^\d+$/.test(price)) {
                alert('가격은 숫자만 입력 가능합니다.');
                return false;
            }
            
            return true;
        }
        
        function loadImg(inputFile, num) {
            if(inputFile.files.length === 1) {
                const reader = new FileReader();
                reader.readAsDataURL(inputFile.files[0]);
                reader.onload = function(e) {
                    document.getElementById("contentImg" + num).src = e.target.result;
                }
            } else {
                document.getElementById("contentImg" + num).src = "";
            }
        }
    </script>
</html>


