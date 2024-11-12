<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.member.model.vo.User"%>
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
 <style>
   #logout{
   		text-decoration: none;
      color: grey;
   }
    .btn-outline-primary {
    color: rgba(255, 166, 0, 0.774);
    border-color: rgba(255, 166, 0, 0.774);
   }
   .btn-outline-primary:hover {
    background-color: rgba(255, 166, 0, 0.774);
    color: #fff; /* 호버 시 텍스트 색상 */
    border-color: #FFA500;
   }
   .btn-primary {
    background-color: rgba(255, 166, 0, 0.774);
    border-color: rgba(255, 166, 0, 0.774); /* 테두리 색상 */
    }
   .btn-primary:hover {
    background-color: rgba(255, 166, 0, 0.9);
    border-color: rgba(255, 166, 0, 0.9);
    }
    .border-bottom {
    	border-bottom: 2px solid !important;
    	color: rgb(193, 195, 190);
	}
 </style>
<title>메뉴바</title>
</head>
<body>
<svg xmlns="http://www.w3.org/2000/svg" class="d-none">
  <symbol id="bootstrap" viewBox="0 0 118 94">
  </symbol>
</svg>
<main>
  <h1 class="visually-hidden">Headers examples</h1>
  <div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <div class="col-md-3 mb-2 mb-md-0">
        <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
        </a>
      </div>
      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
      <li><a href="<%=contextPath%>" class="nav-link px-2 link-secondary" style="margin-right: 2px;">Home</a></li>
        <li><a href="<%=contextPath%>/noticeBoard.shs" class="nav-link px-2 link-secondary">공지사항</a></li>
        <li><a href="<%=contextPath%>/room/list.shs" class="nav-link px-2 link-secondary">상품 상세보기</a></li>

        <li><a href="<%=contextPath%>/reviewList.shs?currentPage=1" class="nav-link px-2 link-secondary">리뷰게시판</a></li>

        
        <!-- <li><a href="<%=contextPath%>/reservation.re" class="nav-link px-2 link-secondary">예약 페이지(삭제예정)</a></li> -->
        <li><a href="<%=contextPath%>/reservation.re" class="nav-link px-2 link-secondary">예약 페이지(삭제예정)</a></li>
      </ul>
   		
   	  <%if(userInfo==null){%>
      <div class="col-md-3 text-end">
      <form action="<%=contextPath %>/login.shs">
        <button type="submit" class="btn btn-outline-primary me-2">로그인</button>
       </form>
        <form action="<%=contextPath %>/views/member/enrollForm.jsp">
        <button type="submit" class="btn btn-primary">회원가입</button>
        </form>
      </div>
      <%}else{%>
      <b><%=userInfo.getUserName()%>님 환영합니다.</b>
      <form action="<%=contextPath %>/views/member/myPage.jsp">
      <button type="submit" class="btn btn-outline-primary me-2">마이페이지</button>
      </form>
      <a href="<%=contextPath%>/logout.shs" id="logout">로그아웃</a>
      <%}%>
    </header>
  </div>
</main>
<script src="${pageContext.request.contextPath}/views/common/assets/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>