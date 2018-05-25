<%@page import="vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>el의 이해</title>
	</head>
	<body>
		<%--  
			el(Expression Language) : 표현 언어
			
			문법 : ${속성}
			
			자바의 표현식보다 편리함. (자바 언어를 몰라도 이해가 가능)
			페이지, 리퀘스트, 세션, 컨텍스트 등의 속성이나 파라미터, 헤더 등의 출력이 가능 
		--%>
		<% 
			request.setAttribute("msg", "안녕하세요-!");
			// 순수 자바에서는 얻어와서 변수에 담고, 표현식으로 출력해야 함 
			String msg = (String)request.getAttribute("msg");
			
			User user = new User();
			user.setId("wingging");
			user.setPassword("19990529");
			user.setNickname("윙깅2");
			
			request.setAttribute("user", user);
			User user2 = (User)request.getAttribute("user");
			
			// el에서는 그럴 필요가 없음
			%>
		<h1>msg 출력</h1>
			1) JSP 문법(자바) : <%=msg%> <br />
			2) el : ${msg} <br />
		<h1>유저 출력</h1>
		<%-- JSP 문법 --%>
			아이디 : <%=user2.getId()%> <br />
			비밀번호 : <%=user2.getPassword()%> <br /> 
			닉네임 : <%=user2.getNickname()%> <br />
		<h1>el로 출력</h1>
			아이디 : ${user.id} <br />
			비밀번호 : ${user.password} <br />
			닉네임 : ${user.nickname} <br />
	</body>
</html>