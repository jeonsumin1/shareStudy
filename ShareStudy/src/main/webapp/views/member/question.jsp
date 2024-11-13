<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://use.fontawesome.com/72aaf9ab20.js"></script>



<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
    	width: 60%; /* 페이지 너비 */
        margin: auto; /* 페이지 중앙 정렬 */
        margin-top: 50px;
        text-align: left;
        border: 1px solid gray;
    	border-radius: 10px;
    	height: 230px;
    }
    
    .inputSt{
    	margin-top: 10px;
    	width: 100%; 
    }
    table th{
    	width: 200px;
    }
    
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>
	
	
	<div data-toggle="modal" data-target="#QModal">📞 문의 하기</div>
	<!-- 문의하기 모달 -->
	
	<div class="modal" id="QModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">ShareStudy</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <p>문의사항</p>
                <table class="table table-bordered inputSt">
                    <tr>
                        <th>상담 가능 시간</th>
                        <td><input type="datetime-local" id="qTime" class="form-control"></td>
                    </tr>
                    <tr>
                        <th>상담 상담 내용</th>
                        <td><textarea id="qContent" rows="5" cols="30" placeholder="상담 내용에 대해 간략하게 적어주세요." style="resize: none;" class="form-control"></textarea></td>
                    </tr>
                </table>
            </div>

            <div class="modal-footer">
                <!-- 'send' 버튼 클릭 시 test() 함수 호출 -->
                <button class="btn" style="background-color: rgba(255, 166, 0, 0.774)" onclick="test();">send</button>
                <!-- 'close' 버튼 클릭 시 모달만 닫히고 test() 함수는 호출되지 않음 -->
                <button type="button" class="btn btn-danger" data-dismiss="modal">close</button>
            </div>
        </div>
    </div>
</div>

<!-- jQuery 라이브러리 포함 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

	
    function test() {
    	var qTime = $("#qTime").val();
        var qContent = $("#qContent").val();
        
    	$.ajax({
    		url: "${contextPath}/question.shs",
    		type: "POST",
    		data: {
    			userId : "${userInfo.userId}", 
    			qTime: qTime,
    			qContent : qContent
    		},
    		success: function(result){
    			if(result>0){
	    		 	alert("상담신청이 완료되었습니다.");
			        $('#QModal').modal('hide');
    				
    			}else{
	    			alert("상담신청이 실패되었습니다.");
    			}
    		},
    		error : function(){
	    			alert("에러");
    		}
    		
    	});
        
    }
    
</script>    
    
    
	<br><br><br><br><br>
	<%@ include file="/views/common/footer.jsp" %>


</body>
</html>