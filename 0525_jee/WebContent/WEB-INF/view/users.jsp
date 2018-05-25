<%@page import="vo.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// List<User> list = (List)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>유저 목록</title>
	</head>
	<body>
		<%-- parameter 출력 --%>
		이름 : ${param.name}
		메세지 : ${msg}
		<h1>유저 목록</h1>
		<ul>
			<%-- for(User user : list) { 
				<li>아이디 : <%=user.getId() %> / 비밀번호 : <%=user.getPassword() %> / 닉네임 : <%=user.getNickname()%></li>
			 } --%>
			<c:forEach items="${list}" var="user">
				<li>아이디 : ${user.id} / 비밀번호 : ${user.password} / 닉네임 : ${user.nickname}</li>
			</c:forEach> 
		</ul>
	</body>
</html>