<%@page import="com.jbm.model1.dao.UsersDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 넘어온 id 파라미터의 값을 얻음
	String nickname = request.getParameter("nickname");

	// 해당 닉네임이 몇 개 있는지 확인
	int count = UsersDAO.checkNickname(nickname);
%>
{"count":<%=count%>}