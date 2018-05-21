<%@page import="com.jbm.model1.dao.UsersDAO"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 넘어온 id 파라미터의 값을 얻음
	String id = request.getParameter("id");

	// 해당 아이디가 몇 개 있는지 확인
	int count = UsersDAO.checkId(id);
%>
{"count":<%=count%>}