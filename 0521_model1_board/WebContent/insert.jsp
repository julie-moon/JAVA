<%@page import="com.jbm.model1.dao.BoardDAO"%>
<%@page import="com.jbm.model1.vo.Board"%>
<%@page import="com.jbm.model1.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		유저의 닉네임, 번호 얻는 두 가지 방법
		
		1) 파라미터에 같이
		2) 세션에서 **
	*/
	request.setCharacterEncoding("UTF-8");
	
	User loginUser = (User)session.getAttribute("loginUser");
	
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");
	String writer = loginUser.getNickname();
	int writerNo = loginUser.getNo();
	
	Board board = new Board(title, contents, writer, writerNo);
	
	// System.out.println("전 : " + board.getNo()); // 결과값 0
	
	BoardDAO.insertContent(board);
	
	// System.out.println("후 : " + board.getNo()); 
	
	// 리다이렉트(글 상세 페이지로)
	response.sendRedirect("contents.jsp?no="+board.getNo());
		
%>
<%=title%>
<%=contents%>
<%=loginUser.getNickname()%>
<%=loginUser.getNo()%>