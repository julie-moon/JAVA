<%@page import="util.PaginateUtil"%>
<%@page import="vo.PageVO"%>
<%@page import="dao.BooksDAO"%>
<%@page import="vo.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 넘어온 파라미터 
	String pageStr = request.getParameter("page");
	
	// 페이지 번호
	int pageNo = 1;
	
	// 한 페이지 당 보여질 게시물 수
	int numPage = 5;
	
	// numBlock : 한 페이지에 보여질 블록 수
	int numBlock = 5;
	
	// total : 전체 게시물 수
	int total = BooksDAO.bookCount();
	
	// url : 주소 
	String url = "index.jsp";
	
	// param : 파라미터
	String param = "page=";
	
	// 넘어온 페이지가 있으면
	if(pageStr != null) {
		pageNo = Integer.parseInt(pageStr);
	} // if end
	
	String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);
	
	PageVO pageVO = new PageVO(pageNo, numPage);
	
	List<Book> list = BooksDAO.bookList(pageVO);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>도서 목록</title>
		<style type="text/css">
			table{
				border-collapse:collapse;
				width:700px;
			}
			table th, table td{
				border:1px solid #424242;
				padding:5px 10px;
				text-align:center;
			}
			table th{
				background-color:#EEEEEE;
			}
			tfoot a{
				color:#424242;
				text-decoration:none;
			}
		</style>
		<link rel="stylesheet" href="css/paginate.css" />
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
	</head>
	<body>
		<h1>책 목록</h1>
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>저자</th>
					<th>출판일</th>
				</tr>
			</thead>
			<tbody>
				<% for(Book book : list) { %>
				<tr>
					<td><%=book.getNo()%></td>
					<td><%=book.getTitle()%></td>
					<td><%=book.getAuthor()%></td>
					<td><%=book.getPubdate()%></td>
				</tr>
				<% } %>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<div class="">
							<%=paginate%>
						</div>
					</td>
				</tr>
			</tfoot>
		</table>
	</body>
</html>