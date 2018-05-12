<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Group"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 우선 테스트용 List<Group> 생성
	List<Group> list = new ArrayList();
	list.add(new Group(1, "워너원"));
	list.add(new Group(2, "트와이스"));
	list.add(new Group(3, "방탄소년단"));
	list.add(new Group(4, "레드벨벳"));
	list.add(new Group(5, "EXO"));
	
	// ObjectMapper 객체 생성
	ObjectMapper om = new ObjectMapper();
	
	// json 문자열로 받기
	String json = om.writeValueAsString(list);
%>
<%-- 출력 --%>
<%=json%>