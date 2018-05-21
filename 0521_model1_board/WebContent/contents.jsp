<%@page import="com.jbm.model1.dao.BoardDAO"%>
<%@page import="com.jbm.model1.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 기본 값
	String url = null;
	
	// 요청의 header에서 referer를 얻어옴
	String referer = request.getHeader("referer");
	
	// 만약 referer가 있으면 url을 변경
	if(referer != null) {
		url = referer;
	} // if end
	
	if(referer.contains("index")) {
		// System.out.println("있음");
		// referer에 index가 포함되었다는 건 이 referer가 진짜 이전 페이지. 그래서 세션에 저장함
		session.setAttribute("referer", referer);
	} else {
		// System.out.println("없음");
		// 이전 페이지가 잘못되었음. 기존의 것으로 교체
		url = (String)session.getAttribute("referer");
	} // if ~ else end
	
	if(url == null) {
		url = "index.jsp";
	} // if() end
	
	// 테스트용
	// System.out.println(url);
	
	// 넘어온 파라미터 
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	
	// 조회수 증가
	BoardDAO.updateHit(no);
	
	// 번호에 해당하는 게시물 얻기
	Board content = BoardDAO.selectContent(no);
%>
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모델1 게시판</title>
		<%@ include file="/WEB-INF/template/link.jsp"%>
		<link rel="stylesheet" href="css/contents.css" />
	</head>
	<body>
		<%@ include file="/WEB-INF/template/header.jsp"%>
		<h2>게시물 보기</h2>
		<div id="contentsBox">
			<div class="box">
				<span class="title">번 호</span>
				<!--
				 -->
				<em id="no"><%=content.getNo()%></em>
				<!-- 
				 -->
				<span class="title">제 목</span>
				<!-- 
				 -->
				<strong id="title"><%=content.getTitle()%></strong>
			</div>
			<div class="box">
				<span class="title">작성자</span>
				<!--
				 -->
				<em id="writer"><%=content.getWriter()%></em>
				<!-- 
				 -->
				<span class="title">작성일</span>
				<!-- 
				 -->
				<em id="regdate"><%=content.getFormatRegdate(Board.DETAIL)%></em>
				<!--
				 -->
				<span class="title">조회수</span>
				<!-- 
				 -->
				<em id="hit"><%=content.getHit()%></em>
			</div>
			<p id="contents"><%=content.getContents()%></p>
			<p class="btn_box">
				<%-- --%>  
				<% if(loginUser != null && loginUser.getNo() == content.getWriterNo()) { %>				
	                <a href="edit.jsp?no=<%=content.getNo()%>" class="btn" id="modifyBtn">수 정</a>
	                <a href="delete.jsp?no=<%=content.getNo()%>" class="btn" id="deleteBtn">삭 제</a>
	        	<% } %>
				<a href="<%=url%>" class="btn">게시판으로</a>
			</p>
		</div>
		<%@ include file="/WEB-INF/template/footer.jsp"%>
	</body>
</html>