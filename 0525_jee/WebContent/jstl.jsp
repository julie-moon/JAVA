<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSTL 문법</title>
	</head>
	<body>
		<!-- if문 코드 -->
		<c:if test="${loginUser!=null}">
			<h1>로그인 되었습니다-!</h1>
		</c:if>
		<% 
			pageContext.setAttribute("grade","A"); 
		%>
		<!-- 
			if ~ else문(switch문)
			choose ~ when ~ otherwise 
		-->
		<c:choose>
			<c:when test="${grade=='A'}">
				<h2>나는 A학점</h2>
			</c:when>
			<c:when test="${grade=='B'}">
				<h2>나는 B학점</h2>
			</c:when>
			<c:when test="${grade=='C'}">
				<h2>나는 C학점</h2>
			</c:when>
			<c:when test="${grade=='D'}">
				<h2>나는 D학점</h2>
			</c:when>
			<c:otherwise>
				<h2>나는 F학점 ㅜ_ㅜ</h2>
			</c:otherwise>
		</c:choose>
	</body>
</html>