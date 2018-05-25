<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>index</title>
	</head>
	<body>
		<h1>${name}의 친구 목록</h1>
		<ul>
			<!-- -->  
			<c:forEach items="${list}" var="member">
				<li>아이디 : ${member.id} / 비밀번호 : ${member.password} / 닉네임 : ${member.nickname}</li>
			</c:forEach>
			
		</ul>
	</body>
</html>