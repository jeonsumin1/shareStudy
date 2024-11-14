<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> 
<meta charset="UTF-8">
<title>메인페이지</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

#header {
	top: 0;
	left: 0;
	right: 0;
	background-color: #fff;
	display: flex;
	flex-direction: column;
	align-items: center;
	max-height: 400px;
}

#Logo {
	margin: 10px 0;
}

.search-container {
    display: flex;
    align-items: center;
}

.search-container input[type="text"] {
    margin-right: 10px;
    padding: 8px;
    font-size: 16px;
}

.search-container button {
    padding: 8px 16px;
    font-size: 16px;
    cursor: pointer;
}

#loginContainer {
	position: fixed;
	top: 20px;
	right: 20px;
	display: flex;
	flex-direction: column;
	align-items: flex-end;
}

#content {
    flex: 1;
    padding-top: 50px;
}

table {
	border-collapse: collapse;
}

th, td {
	padding: 5px 10px;
}


#loginSpace {
	position: absolute;
	top: 110px;
	right: 20px;
	margin-top: 100px;
}

#mainLogo{
	max-height: 200px;
}

#loginSpace{
	top: 50px;
}

#product{
	padding-left: 250px;
	padding-right: 200px;
}

#roomPhoto{
	width: 410px;
	height: 226px;
}

</style>
</head>
<body>	

<%@ include file="/views/common/menubar.jsp" %>

<script>
	
	var msg = "<%=alertMsg%>";
	if(msg != "null"){
		alert(msg);
		<%session.removeAttribute("alertMsg");%>
	}
    	function enrollPage(){
    		location.href="<%=contextPath%>/enrollPage.shs";
		}
    	
	</script>
	
	<div id="header">
		<div id="Logo">
			<a href="<%=contextPath%>">
			<img src="<%=contextPath%>/views/common/images/ShareStudyLogo2.png"
				alt="ShareStudyLogo" id="mainLogo" oncontextmenu="return false"></a>
		</div>
	</div>
	
	<div id="content" style="display:flex; justify-content:center; flex-wrap: wrap;">
    <div id="product">
        <table style="margin: 10px; text-align: center; display: inline-block;">
            <tr>
                <th colspan="3">
                <a href="detail.room?rno=R01"><img src="<%=contextPath%>/resources/uploadFiles/rsiel12.jpg"
                alt="R01" id="roomPhoto" oncontextmenu="return false"></a></th>
            </tr>
            <tr>
                <td>상품 번호 : R01</td>
                <td>수용인원 : 1~7명</td>
                <td>가격 : 50,000￦</td>
            </tr>
        </table>
        
        <table style="margin: 10px; text-align: center; display: inline-block;">
            <tr>
                <th colspan="3">
                <a href="detail.room?rno=R02"><img src="<%=contextPath%>/resources/uploadFiles/rsiel3.jpg"
                alt="R02" id="roomPhoto" oncontextmenu="return false"></a></th>
            </tr>
            <tr>
                <td>상품 번호 : R02</td>
                <td>수용인원 : 1~10명</td>
                <td>가격 : 80,000￦</td>
            </tr>
        </table>
        
        <table style="margin: 10px; text-align: center; display: inline-block;">
            <tr>
                <th colspan="3">
                <a href="detail.room?rno=R03"><img src="<%=contextPath%>/resources/uploadFiles/167990883_3fc1759cd950b0bcd98cf1cfbad35de0.jpg"
                alt="roomEx" id="roomPhoto" oncontextmenu="return false"></a></th>
            </tr>
            <tr>
                <td>상품번호 : R03</td>
                <td>수용인원 : 1~7명</td>
                <td>가격 : 60,000￦</td>
            </tr>
        </table>
        <table style="margin: 10px; text-align: center; display: inline-block;">
            <tr>
                <th colspan="3">
                <a href="detail.room?rno=R04"><img src="<%=contextPath%>/resources/스터디룸2.jpg"
                alt="roomEx" id="roomPhoto" oncontextmenu="return false"></a></th>
            </tr>
            <tr>
                <td>상품번호 : R04</td>
                <td>수용인원 : 1~7명</td>
                <td>가격 : 60,000￦</td>
            </tr>
        </table>
        <table style="margin: 10px; text-align: center; display: inline-block;">
            <tr>
                <th colspan="3">
                <a href="detail.room?rno=R05"><img src="<%=contextPath%>/resources/스터디룸3.jpg"
                alt="roomEx" id="roomPhoto" oncontextmenu="return false"></a></th>
            </tr>
            <tr>
                <td>상품번호 : R05</td>
                <td>수용인원 : 1~7명</td>
                <td>가격 : 60,000￦</td>
            </tr>
        </table>
        <table style="margin: 10px; text-align: center; display: inline-block;">
            <tr>
                <th colspan="3">
                <a href="detail.room?rno=R06"><img src="<%=contextPath%>/resources/스터디룸4.jpg"
                alt="roomEx" id="roomPhoto" oncontextmenu="return false"></a></th>
            </tr>
            <tr>
                <td>상품번호 : R06</td>
                <td>수용인원 : 1~7명</td>
                <td>가격 : 60,000￦</td>
            </tr>
        </table>
        <table style="margin: 10px; text-align: center; display: inline-block;">
            <tr>
                <th colspan="3">
                <a href="detail.room?rno=R07"><img src="<%=contextPath%>/resources/uploadFiles/168059146_3a5fbb60f8d30b8ed87a5e2af9188c81.png"
                alt="roomEx" id="roomPhoto" oncontextmenu="return false"></a></th>
            </tr>
            <tr>
                <td>상품번호 : R07</td>
                <td>수용인원 : 1~7명</td>
                <td>가격 : 60,000￦</td>
            </tr>
        </table>
        
    </div>
</div>
<%@ include file="/views/common/footer.jsp" %>


</body>
</html>