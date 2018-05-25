<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% 
	User loginUser = (User)session.getAttribute("loginUser");
%>
<%--

	JSTL(Java Standard Tag Library) : if, if ~ else, for 등을 태그로
	
	JSTL 사용 방법
	1) lib에 jar 등록
	2) taglib 지시어 선언
	 
 --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>웹서비스</title>
	</head>
	<body>
		<h1>웹서비스</h1>
		<c:choose>
			<c:when test="${loginUser==null}">
				<h2>로그인</h2>
				<form action="login.jsp">
					<fieldset>
						<input placeholder="아이디 입력" />
						<input placeholder="비밀번호 입력" />
						<button>로그인</button>
					</fieldset>
				</form>
			</c:when>
			<c:otherwise>
				<h2>${loginUser.nickname}님 환영합니다-!</h2>
				<a href="logout.jsp">로그아웃</a>
			</c:otherwise>
		</c:choose>
	</body>
</html>