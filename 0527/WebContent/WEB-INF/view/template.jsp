<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>예제</title>
		<c:import url="/WEB-INF/view/template/link.jsp" /> 
	</head>
	<body>
		<c:import url="/WEB-INF/view/template/header.jsp" />
			<ul>
				<%-- 1 ~ 10까지 for문 반복 --%>
				<c:forEach var="i" begin="1" end="10">
					<li>${i}</li>
				</c:forEach>
			</ul>
		<c:import url="/WEB-INF/view/template/footer.jsp" />
	</body>
</html>