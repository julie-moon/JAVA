<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	/*
		Model1 방식에서
		User loginUser = (User)session.getAttribute("loginUser");
	*/
	User loginUser = (User)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>웹서비스</title>
	</head>
	<body>
		<h1>웹서비스</h1>
		<%-- Model1 방식에서 --%>
		<% if(loginUser == null) { %>
		<h2>로그인</h2>
		<form action="login.jsp">
			<input placeholder="아이디 입력" />
			<input placeholder="비밀번호 입력" />
			<button>로그인</button>
		</form>
		<% } else { %>
		<h2><%=loginUser.getNickname()%>님 환영합니다-!</h2>
		<a href="logout.jsp">로그아웃</a>
		<% } %>
	</body>
</html>