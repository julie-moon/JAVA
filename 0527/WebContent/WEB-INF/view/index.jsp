<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>인덱스</title>
	</head>
	<body>
		<h1>웹서비스</h1>
		<c:choose>
			<c:when test="${loginUser==null}">
				<h2>로그인</h2>
				<form action="login.jbm" method="post">
					<fieldset>
						<legend>로그인 폼</legend>
						<input name="id" placeholder="아이디" />
						<input type="password" name="password"  placeholder="비밀번호" />
						<button>로그인</button>
					</fieldset>
				</form>
				<a href="join.jbm">회원가입</a>
			</c:when>
			<c:otherwise>
				<h2>${loginUser.nickname}님 환영합니다-!</h2>
				<a href="logout.jbm">로그아웃</a>
				<h3>아이돌 목록</h3>
					<ul>
						<c:forEach items="${list}" var="idol">
						<li>
							번호 : ${idol.no} /
							이름 : ${idol.name} / 
							키 : ${idol.height} /
							몸무게 ${idol.weight} /
							생년월일 : <fmt:formatDate pattern="YYYY년 M월 d일" value="${idol.birthDate}" />  / 
							그룹 번호 : ${idol.groupNo}
						</li>
						</c:forEach>
					</ul>
			</c:otherwise>
		</c:choose>
	</body>
</html>