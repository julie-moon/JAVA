<%@page import="com.jbm.model1.dao.UsersDAO"%>
<%@page import="com.jbm.model1.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 파라미터 받기
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	// User 객체 생성
	User user = new User(id, password);
	
	// 로그인 처리
	User loginUser = UsersDAO.loginUser(user);
	
	// 세션에 로그인 유저 객체 담기
	session.setAttribute("loginUser", loginUser);
	
	// 이전 페이지
	String referer = request.getHeader("referer");
	
	// 이전 페이지로 이동
	response.sendRedirect(referer);
%>
<%-- 리다이렉트 하기 전에 로그인 유저 객체 넘어오는지 확인 --%>
<%=loginUser%>