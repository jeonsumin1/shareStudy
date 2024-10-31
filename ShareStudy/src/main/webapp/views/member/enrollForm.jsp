<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 

	String contextPath = request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<style>
	
</style>


</head>
<body>

  			<div>

                <form action="<%=contextPath %>/enrollForm.me" id="enroll">
                    <div id="search_text">
                        <input type="search" placeholder="검색어를 입력하세요.">
                        
                      
                    </div>
                    



                </form>
            </div>

</body>
</html>