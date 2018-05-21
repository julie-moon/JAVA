<%@page import="com.jbm.model1.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.jbm.model1.util.PaginateUtil"%>
<%@page import="com.jbm.model1.vo.PageVO"%>
<%@page import="com.jbm.model1.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 현재 페이지 번호
	int pageNo = 1;

	//넘어온 파라미터
	String pageStr = request.getParameter("now");
	
	// 넘어온 파라미터가 있으면 그 번호로
	if(pageStr != null) {
		pageNo = Integer.parseInt(pageStr);
	} // if end
	
	// 한 페이지 당 보여질 게시물 수
	int numPage = 5;
	
	// numBlock : 한 페이지에 보여질 페이징 블록 수
	int numBlock = 5;
	
	// url : 주소 
	String url = "index.jsp";
	
	// param : 파라미터
	String param = "now=";
	
	PageVO pageVO = new PageVO(pageNo, numPage);
	List<Board> list = BoardDAO.boardList(pageVO);
	
	// total : 전체 게시물 수
	int total = BoardDAO.boardCount();
	
	// 페이징 마크업
	String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);
%>
<!doctype html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <title>모델1 게시판</title>
		<%@ include file="/WEB-INF/template/link.jsp" %>
		<link rel="stylesheet" href="css/index.css" />
	</head>
	<body>
	    <%@ include file="/WEB-INF/template/header.jsp" %>
			<h2>게시글 목록</h2>
			<table border="0" id="boardList">
				<!--caption요소는 테이블의 제목 -->
				<caption class="screen_out">게시물 표</caption>
				<thead>
					<tr>
						<!-- th요소에는 적용범위를 scope로 지정 -->
						<th id="no" scope="col">번 호</th>
						<th id="title" scope="col">제 목</th>
						<th id="writer" scope="col">작성자</th>
						<th id="regdate" scope="col">등록일</th>
						<th id="hit" scope="col">조회수</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan="5" class="row_paginate">
							<%=paginate%>
						</td>
					</tr>
					<%-- 로그인 되었을 때만 --%>
					<% if(loginUser != null) { %>
					<tr>
						<td colspan="5">
							<a class="btn" href="write.jsp">글쓰기</a>
						</td>
					</tr>
					<% } %>
				</tfoot>
				<tbody>
					<% for(Board board : list) { %>
					<tr>
						<td><%=board.getNo()%></td>
						<th scope="row"><a href="contents.jsp?no=<%=board.getNo()%>"><%=board.getTitle()%></a></th>
						<td><%=board.getWriter()%></td>
						<td><%=board.getFormatRegdate(Board.SIMPLE)%></td>
						<td><%=board.getHit()%></td>
					</tr>
					<% } %>
				</tbody>
			</table>
	    <%@ include file="/WEB-INF/template/footer.jsp" %>
	</body>
</html>
    
    
    