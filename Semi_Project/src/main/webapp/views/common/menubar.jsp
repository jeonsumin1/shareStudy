<%@page import="com.kh.user.model.vo.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String contextPath = request.getContextPath();

User userInfo = (User)session.getAttribute("userInfo");

String alertMsg = (String)session.getAttribute("alertMsg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ������</title>

   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

#header {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	background-color: #fff;
	display: flex;
	flex-direction: column;
	align-items: center;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	z-index: 800;
}

#Logo {
	margin: 20px 0;
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
	margin-top: 700px;
	padding-left: 200px;
    flex: 1;
    padding: 20px;
}

table {
	border-collapse: collapse;
}

th, td {
	padding: 5px 10px;
}

#footer {
	background-color: #f9f9f9;
	text-align: center;
	padding-top: 20px;
	padding-bottom: 20px;
}

#adminLogin{
	color: #f6f6f6;
	padding-left: 95%;
}

#loginSpace {
	position: absolute;
	top: 90px;
	right: 20px;
	margin-top: 100px;
}
</style>
</head>
<body>
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
			<a href="<%=contextPath%>"><img
				src="<%=contextPath%>/resources/ShareStudyLogo.png"
				alt="ShareStudyLogo" id="mainLogo" oncontextmenu="return false"></a>
		</div>
		<div id="searchBar">
			<form action="search.shs" id="searchForm">
				<div class="search-container">
					<input type="text" name="searchBar" id="searchInput"
						placeholder="�˻�� �Է����ּ���.">
					<button type="submit">�˻�</button>
				</div>
			</form>
		</div>
		<%if(userInfo == null) {%>
		<div id="loginSpace">
			<form action="<%=contextPath%>/login.shs" method="post" id="loginForm">
				<table>
					<tr id="idForm">
						<th>���̵� :</th>
						<td><input type="text" name="userId" id="userId" placeholder="���̵� �Է����ּ���."></td>
					</tr>
					<tr id="pwForm">
						<th>��й�ȣ :</th>
						<td><input type="password" name="userPw" id="userPw"
							placeholder="��й�ȣ�� �Է����ּ���."></td>
					</tr>
					<tr>
						<td colspan=2>
							<button type="submit">�α���</button>
				<button type="button" onclick="enrollPage();">ȸ������</button>
				</td>
				</tr>
			</table>
			</form>
		</div>
		<%}else{ %> 
		<div id="loginSpace">
			<%=userInfo.getUserId()%>�� ȯ���մϴ�.
			<a href="<%=contextPath %>/myPage.shs">����������</a>
			<a href="<%=contextPath %>/logout.shs">�α׾ƿ�</a>
		</div>
		<%} %>
	</div>


	<div id="content">
		asdfasdfasdfasdfasdf
		<div id="product"></div>
	</div>


	<div id="footer">
		<pre oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
            

��ȣ�� : ����͵��               								��ǥ : ???                                       
            
����� ��Ϲ�ȣ : 000-00-00000                                 	����Ǹž��Ű��ȣ : 1234-������-1234
            
���������� : ����Ư���� �������� ������2�� 57 �̷�����(����) 19F,20F     �̸��� : ???                      
            
���޹��� : ShareStudy@Shs.kr
            
��ǥ��ȭ : 02-123-1234(���� am 10:00 ~ pm 05:30)

����͵�� ����Ǹ��߰����̸� ����Ǹ��� ����ڰ� �ƴմϴ�. ���� ����͵�� ���� �ŷ����� �� �ŷ��� ���� å������ �ʽ��ϴ�.
	</pre>
	<p id="adminLogin">������ �α���</p>
	</div>
</body>
</html>