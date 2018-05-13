<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="dao.GroupsDAO"%>
<%@page import="vo.Group"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Group> list = GroupsDAO.selectList();	

	ObjectMapper om = new ObjectMapper();
	String json = om.writeValueAsString(list);
%>
<%=json%>