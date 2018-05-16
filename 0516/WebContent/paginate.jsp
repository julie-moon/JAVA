<%@page import="util.PaginateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// pageNo : 현재 페이지
	int pageNo = 1;
	// total : 전체 게시물 수
	int total = 100;
	// numPage : 한 페이지에 보여질 게시물 수 
	int numPage = 5;
	// numBlock : 한 페이지에 보여질 블록 수
	int numBlock = 7;
	// url : 주소 
	String url = "pagenate.jsp";
	// param : 파라미터
	String param = "page=";
	
	String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>페이징 처리 연습</title>
		<link rel="stylesheet" href="css/paginate.css" />
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
	</head>
	<body>
	<%=paginate%>
	</body>
</html>