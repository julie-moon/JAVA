<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	User user = new User("wingging", "19990529", "윙깅");
	pageContext.setAttribute("user", user);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HTML</title>
	</head>
	<body>
		<h1>아이디 : ${user.id}</h1>
		<h1>비밀번호 : ${user.password}</h1>
		<h1>닉네임 : ${user.nickname}</h1>
	</body>
</html>