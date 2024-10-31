<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 

	String contextPath = request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Jua&display=swap" rel="stylesheet">

<title>Insert title here</title>
</head>
<body>

  			<div id="section1">

                <form action="<%=contextPath %>/enrollForm.me" id="search_form">
                    <div id="search_text">
                        <input type="search" class="alert alert-success" placeholder="검색어를 입력하세요.">
                        <br clear="both">
                      
                    </div>
                    <div id="search_btn">
                        <input type="submit"  value="검색">
                    </div>



                </form>
            </div>

</body>
</html>