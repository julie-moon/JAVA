<%@page import="org.jbm.guestbook.vo.Guest"%>
<%@page import="org.jbm.guestbook.dao.GuestbookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//System.out.println("글 수정");
	request.setCharacterEncoding("UTF-8");

	// 넘어온 파라미터 값 받음 
	String noStr = request.getParameter("no");
	String contents = request.getParameter("contents");
	
	// 필요에 따라 형변환 해줌
	int no = Integer.parseInt(noStr);
	
	// 얻어온 값을 guest 객체에 저장
	Guest guest = new Guest(no, contents);
	
	// guest 객체에 저장된 값을 update()메소드 인자로 넘겨줘서 update 구문 실행
	GuestbookDAO.update(guest);
	
	// index.jsp로 리다이렉트
	response.sendRedirect("index.jsp");
%>