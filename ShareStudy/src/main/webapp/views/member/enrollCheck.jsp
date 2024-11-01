<%@page import="com.kh.member.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 

	String contextPath = request.getContextPath();
    User u = (User)request.getAttribute("u");


%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 입력 후 입력한 게 맞는지 확인하는 페이지</title>

    <style>
        .outer{
            width: 600px;
            height: 450px;
            margin: auto;
            margin-top: 50x;
            background-color: white;
            border-style: solid;
            border-color: rgba(255, 166, 0, 0.774);
            border-radius: 10px;
            z-index: 100;
        }

        #table1{
            width: 200px;
            border-collapse: separate;
            border-spacing: 10px 10px;
            
            
            
        }
        #picture{
            margin: auto;
            width: 150px;
            position: relative;
            left: 680px;
            top: 60px;
            z-index: 200;
            
        }
        #okay,#back{
            width: 100px;
            height: 30px;
            border-radius: 5px;
            background-color: rgba(255, 166, 0, 0.774);
            border-style: none;
            font-size: 20px;
            font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            color: white;
            position: relative;
            left: 650px;
            top: 30px;
        }

		ul{
			margin : 0;
		
		}
		
    </style>
</head>
<body>
    
    <form action="<%=contextPath%>/enrollCheck.me" method="post">
    <img src="data:image/png;base64,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" id="picture"/>
    

    <div class="outer">
        <h2  align="center" style="font-size: 50px;">Welcom ShareStudy!</h2>
        <table align="center" id="table1">
            <tr>
               <td colspan="2" align="left" ><ul><li><%=u.getUserId() %></li></ul></td> 
            </tr>
            <tr>
                <td colspan="2" align="left" ><ul><li><%=u.getUserPw() %></li></ul></td> 
             </tr>
             <tr>
                <td colspan="2" align="left" ><ul><li><%=u.getUserName() %></li></ul></td> 
             </tr>
             <tr>
                <td colspan="2"align="left" ><ul><li><%=u.getRrn() %></li></ul></td> 
             </tr>
             <tr>
                <td colspan="2" align="left" ><ul><li><%=u.getUserPhone() %></li></ul></td> 
             </tr>
             <tr>
                <td colspan="2" align="left" ><ul><li><%=u.getEmail() %></li></ul></td> 
             </tr>
         </table>
    </div>
</form>

			<tr>
                <td align="center"><button id="okay" onclick="enrollCheck();">submit</button></td>
                <td><button type="submit" id="back" onclick="return back();">back</button></td>    
                
             </tr>
        

	<script>
		function enrollCheck(){
			
			alert("ShareStudy 회원이 되신 것을 환영합니다.");
			location.href = '/share';
			
		}
		
		
	
	
	</script>
      

    
</body>
</html>