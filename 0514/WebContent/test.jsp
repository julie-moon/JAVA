<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	/*
		페이지당 한 개의 객체가 생성됨.
		그렇기 때문에 페이지 안에 상태(state)를 저장해서는 안됨(stateless)
	*/
	private String name; 
%>
<% 
	String name = request.getParameter("name");
	if(name != null) {
		this.name = name;
	} // if end
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메인페이지</title>
	</head>
	<body>
		<h1>안녕하세요 <%=name%>님-!</h1>	
	</body>
</html>