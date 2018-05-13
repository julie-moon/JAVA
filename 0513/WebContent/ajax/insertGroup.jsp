<%@page import="dao.GroupsDAO"%>
<%@page import="vo.Group"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request.setCharacterEncoding("UTF-8");
	// 1) 넘어오는 파라미터 
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String date = request.getParameter("date");
	
	// 2) 필요한 형 변환
	Date debutDate = Date.valueOf(year + "-" +  month + "-" + date);

	// 3) Group 객체 생성 후 세팅
	Group group = new Group(name, debutDate);

	// 4) insert 구문 수행
	int result = GroupsDAO.insertGroup(group);
%>
<%=result%>