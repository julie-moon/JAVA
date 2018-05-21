<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그인 유저만 제거
	session.removeAttribute("loginUser");

	// 이전 페이지
	String referer = request.getHeader("referer");

	// index.jsp로 리다이렉트
	response.sendRedirect(referer);
%>