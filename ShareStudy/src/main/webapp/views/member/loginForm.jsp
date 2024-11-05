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
    
    p {
        text-align: center;
    }
    <!--
    #loginBtn {
        display: block;
        margin: 10px auto;
    }
    -->
    #exampleImg{
    	text-align: center;
    	margin-bottom: 500px;
    }
    
    #loginForm{
        border-radius: 5%;
    }
    
	.btn-4 {
		background: linear-gradient(0deg, rgba(255,190,0,1) 0%, rgba(251,130,2,1) 100%);
  		line-height: 42px;
  		padding: 0;
  		border: none;
  		width: 110px;
  		border-radius: 10%;
	}
	.btn-4 span {
  		position: relative;
  		display: block;
  		width: 100%;
  		height: 100%;
	}
	.btn-4:before,
	.btn-4:after {
  		position: absolute;
  		content: "";
  		right: 0;
  		bottom: 0;
  		background: rgba(251,75,2,1);
  		box-shadow:
   					-7px -7px 20px 0px rgba(255,255,255,.9),
   					-4px -4px 5px 0px rgba(255,255,255,.9),
   					 7px 7px 20px 0px rgba(0,0,0,.2),
   					 4px 4px 5px 0px rgba(0,0,0,.3);
  		transition: all 0.3s ease;
	}
	.btn-4:before{
   		height: 0%;
   		width: 2px;
	}
	.btn-4:after {
  		width: 0%;
  		height: 2px;
	}
	.btn-4:hover{
  		background-color: #89d8d3;
		background-image: linear-gradient(315deg, #fb8202 0%, #ffbe02 74%);
	}

	}
	.btn-4:hover:before {
  		height: 100%;
	}
	.btn-4:hover:after {
  		width: 100%;
	}
	.btn-4 span:before,
	.btn-4 span:after {
  		position: absolute;
  		content: "";
  		left: 0;
  		top: 0;
  		background: rgba(251,75,2,1);
  		box-shadow:
   					-7px -7px 20px 0px rgba(255,255,255,.9),
   					-4px -4px 5px 0px rgba(255,255,255,.9),
   					 7px 7px 20px 0px rgba(0,0,0,.2),
   					 4px 4px 5px 0px rgba(0,0,0,.3);
  		transition: all 0.3s ease;
	}
	.btn-4 span:before {
  		width: 2px;
  		height: 0%;
	}
	.btn-4 span:after {
  		height: 2px;
  		width: 0%;
	}
	.btn-4 span:hover:before {
  		height: 100%;
	}
	.btn-4 span:hover:after {
  		width: 100%;
	}

</style>
</head>
<body>
    <%@include file="/views/common/menubar.jsp"%>
    <div id="contentWrapper" style="display: flex; flex-direction: column; align-items: center;">
     <div id="contentWrapper" style="display: flex; flex-direction: column; align-items: center;">
        <div style="text-align: center; margin-bottom: 20px;">
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
                    <td><input type="password" size="21" name="userPw" placeholder="비밀번호를 입력해주세요."></td>
                </tr>
                <tr>
                </tr>
            </table>
			 <button type="submit" id="loginBtn" class="btn-4">로그인</button>
			 <p>아이디/비밀번호 찾기</p>
        </div>
        </form>
        </div>
      </div>
</body>
</html>