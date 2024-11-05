<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.User"%>
<!DOCTYPE html>
<html>
<%  
    String contextPath = request.getContextPath(); 
	User userInfo = (User)session.getAttribute("userInfo");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<head>
<meta charset="UTF-8">
   <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/headers/">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
   <link href="${pageContext.request.contextPath}/views/common/assets/dist/css/bootstrap.min.css" rel="stylesheet">

   }
 <style>
   #logout{
   		text-decoration: none;
      color: grey;
   }

 </style>
<title>메뉴바</title>
</head>
<body>
    
<svg xmlns="http://www.w3.org/2000/svg" class="d-none">
  <symbol id="bootstrap" viewBox="0 0 118 94">
    <title>메인페이지</title>
    <path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
  </symbol>
</svg>

<main>
  <h1 class="visually-hidden">Headers examples</h1>

  <div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <div class="col-md-3 mb-2 mb-md-0">
        <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
          <svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
        </a>
      </div>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="<%=contextPath%>/noticeBoard.shs" class="nav-link px-2 link-secondary">공지사항</a></li>
        <li><a href="<%=contextPath%>/productDetail.shs" class="nav-link px-2">상품 상세보기</a></li>
        <li><a href="<%=contextPath%>/reviewBoard.shs" class="nav-link px-2">리뷰게시판</a></li>
        <li><a href="${contextPath}/share/views/manager/m_Frame.jsp" class="nav-link px-2">관리자(임시)</a></li>
    
      </ul>
   		
   		
   		
   	  <%if(userInfo==null){%>
      <div class="col-md-3 text-end">


        <button type="button" class="btn btn-outline-primary me-2">Login</button>
        <form action="<%=contextPath %>/enrollForm.me">
        <button class="btn btn-primary">회원가입</button>
        </form>


      </div>
      <%}else{%>
      <b><%=userInfo.getUserName()%>님 환영합니다.
      <button type="submit" class="btn btn-outline-primary me-2">마이페이지</button>
      <a href = "javascript:void(0);" style="text-decoration: none; color:grey;" id="logout" onclick="logout();">로그아웃</a></b>
      <%}%>
    </header>
  </div>

<script>
	function logout(){
		if(confirm("정말로 로그아웃 하시겠습니까?")){
			alert("로그아웃 되었습니다.");
			window.location.href="<%=contextPath%>/logout.shs";
		}
	}
</script>

</main>
<script src="${pageContext.request.contextPath}/views/common/assets/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>