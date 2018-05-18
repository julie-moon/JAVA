<%@page import="org.jbm.guestbook.dao.GuestbookDAO"%>
<%@page import="org.jbm.guestbook.vo.Guest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	// System.out.println("글쓰기");

	// post 방식의 한글처리
	request.setCharacterEncoding("UTF-8");
	
	// 넘어온 파라미터 처리
	String writer = request.getParameter("writer");
	String contents = request.getParameter("contents");
	
	// 유저의 아이피 얻기
	String ip = request.getRemoteAddr();
	
	// 얻어온 정보를 guest 객체에 담아줌
	Guest guest = new Guest(writer, contents, ip);
	
	// 정보를 담아준 guest 객체를 insert()메소드 인자값으로 넘겨줘서 insert해줌
	GuestbookDAO.insert(guest);
	
	// index.jsp로 리다이렉트
	response.sendRedirect("index.jsp");
%>
<%-- 
작성자 : <%=writer %> / 
내용 : <%=contents %>
--%>