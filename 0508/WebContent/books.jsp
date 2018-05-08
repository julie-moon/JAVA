<%@page import="vo.Book"%>
<%@page import="java.util.List"%>
<%@page import="util.SqlSessionUtil"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSP 주석 --%>
<%
	// JSP : HTML에 자바 코드를 삽입하는 것 
	String title = "책 목록"; // title은 지역 변수
	
	SqlSession sqlSession = SqlSessionUtil.getSession();
	List<Book> list = sqlSession.selectList("books.selectList");
%>
<%-- 
	JSP 문법 
	1) 스크립트릿( <% %> ) : 자바 코드를 작성(_jspService() 메소드 안의 코딩)
	2) 표현식( <%= %> ) : HTML에 출력
--%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>책 목록</title>
	</head>
	<body>
		<h1><%= title %></h1>
		<ul>
			<% for(Book book : list) {%> 
				<li> 번호 : <%= book.getNo() %> / 이름 : <%= book.getTitle() %> / 저자 : <%= book.getAuthor() %> / 출판일 : <%= book.getPubdate() %>
			<% } %>	
		</ul>
	</body>
</html>

