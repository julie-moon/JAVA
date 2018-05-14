<%@page import="dao.MembersDAO"%>
<%@page import="vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	/*
		HttpSession 객체
		1) 브라우저 기준
		2) 기본 30분 유지
		3) attribute(속성)

		로그인할 때 세팅
		session.setAttribute(,);
		session.getAttribute();
	*/
	
	request.setCharacterEncoding("UTF-8");
	
	// 넘어온 파라미터 받기 
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// Member 객체 생성 후 setting
	Member member = new Member(id, password);
	
	Member loginMember = MembersDAO.selectLogin(member);
	
	// 세션에 세팅
	session.setAttribute("loginUser", loginMember);
	// System.out.println(loginMember);
	
	// 로그인이 되지 않았을 때 
	if(loginMember == null) {
		
		// 아이디 혹은 비밀번호가 맞지 않음
		session.setAttribute("msg", "아이디 혹은 비밀번호가 맞지 않습니다.");
		
	} // if end
	
	// index로 리다이렉트
	response.sendRedirect("index.jsp");
%>
