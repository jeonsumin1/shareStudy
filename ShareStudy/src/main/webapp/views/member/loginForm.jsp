<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
    html, body {
        height: 100%;
        margin: 0;
    }

    #contentWrapper {
        display: flex;
        align-items: center;
        justify-content: center;
        height: 70vh;
    }

    #loginForm {
        text-align: center;
        width: 400px;
        padding-left: 50px;
        padding: 40px;
        border: 1px solid #e9ecef;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    #idForm {
        margin: 0 auto;
    }

    #pwBox {
        width: 195px;
    }
    
    p {
        text-align: center;
    }
    
    #loginBtn {
        display: block;
        margin: 10px auto;
    }
    
    #exampleImg{
    	text-align: center;
    	margin-bottom: 500px;
    }

</style>
</head>
<body>
    <%@include file="/views/common/menubar.jsp"%>
    <div id="contentWrapper" style="display: flex; flex-direction: column; align-items: center;">
     <div id="contentWrapper" style="display: flex; flex-direction: column; align-items: center;">
        <!-- #loginForm을 포함하는 부모 div -->
        <div style="text-align: center; margin-bottom: 20px;">
            <!-- #loginForm 위에 이미지 추가 -->
            <img src="<%=contextPath%>/views/common/images/ShareStudyLogo2.png" alt="ShareStudyLogo2" style="width: 80%; max-width: 300px;"/>
        </div>
        
        <form action="<%=contextPath%>/login.shs" method="post">
        <div id="loginForm">
            <table id="idForm">
                <tr>
                    <th>아이디 :</th>
                    <td><input type="text" name="userId" placeholder="아이디를 입력해주세요."></td>
                </tr>
                <tr>
                    <th>비밀번호 :</th>
                    <td><input type="password" name="userPw" placeholder="비밀번호를 입력해주세요." ></td>
                </tr>
            </table>
			 <button type="submit" id="loginBtn">로그인</button>
            <p>아이디/비밀번호 찾기</p>
        </div>
        </form>
     </div>
    </div>
</body>
</html>