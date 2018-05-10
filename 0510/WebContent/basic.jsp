<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 스크립트릿 : _jspService() 메소드 안에 코딩되는 지역변수들 
	
	// list = new ArrayList();
	List list = new Vector();
	
	String name = "워너원";
	name = "박지훈";
	this.test(); // 클래스 영역에 선언된 메소드 호출
%>
<%! 
	// 선언문 : 클래스 영역(멤버(필드, 메소드) 자리)
	String name = "박지훈";

	void test() {
		System.out.println("후후후");
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jsp의 기본 문법</title>
	</head>
	<body>
		<%-- include 지시어 : 해당 페이지를 복사 붙여넣기 --%>
		<%@ include file="test.jsp" %>
		<h2>basic.jsp</h2>
	</body>
</html>