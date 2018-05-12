<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="dao.IdolsDAO"%>
<%@page import="vo.Idol"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Idol> list = IdolsDAO.selectList();

	// jackson json 라이브러리 활용해서 json으로 변경
	ObjectMapper om = new ObjectMapper();
	String json = om.writeValueAsString(list);
%>
<%=json%>