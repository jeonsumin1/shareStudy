<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    #userName, #phone{
        width: 300px;
    }

    .st{
        display: inline-block;
    }

    #rvField{
        width: 90%;     
    }

    #rvField img{
        width: 100%;
        height: 300px;
    }

    #stDiv{
        margin: 5%;
        text-align: left;
    }
    div{
        margin: 5%;
    }



</style>

</head>
<body>
	<h1>예약페이지</h1>
    <div align="center">
        <fieldset id="rvField">
            <div class="st"> 
                <img src="resources/스터디룸.jpg" >  <!-- 상품 사진으로 불러오기 -->
            </div>
            
            <div class="st" id="stDiv">
                * 상품 정보 *
                <p>상품명</p>          <!-- db 에서 정보 가져오기 -->
                <p>상품 가격</p>       <!-- db 에서 정보 가져오기 -->
                <p>주차 가능 유무</p>  <!-- db 에서 정보 가져오기 -->
                <p>취식 가능 유무</p>  <!-- db 에서 정보 가져오기 -->
        
                <p> 예약 날짜 </p> 
                <input type="date" name="rvDate" id="rvDate">  
                
                <p> 예약 인원 수 </p> 
                <input type="number" name="rvUser" id="rvUser" min="1" max="50">    <!-- 상품 정보 테이블에서 사용 가능 인원 불러와서 max에 넣어주기? -->
        
            </div>
        </fieldset>
    </div>
    <hr>
    <div>
        * 예약자 정보 * <br>
        <input type="hidden" > <!-- 사용자 아이디, 룸 (상품) 번호 -->
  
        <p> 성명 </p> 
        <input type="text" name="userName" id="userName">  <!-- 로그인한 사용자 이름 불러오기 -->

        <p> 휴대폰 번호 </p> 
        <input type="text" name="phone" id="phone">  

        <p> 요청사항 </p> 
        <textarea cols="50" rows="5" style="resize:none;" placeholder="남기고 싶은 말을 적어주세요. (최대 500글자)"></textarea>  

    </div>
    <hr>
    <div id="pay"> 
        <p>결제 방법</p>
        <p>
            <input type="radio" name="card" id="card"><label>신용카드</label>
            <input type="radio" name="card" id="card"><label>카카오페이</label>  <!-- 신용카드 기능 구현 후 추가 구현하기 -->
        </p>

    </div>

</body>
</html>