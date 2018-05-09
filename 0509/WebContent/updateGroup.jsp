<%@page import="dao.GroupsDAO"%>
<%@page import="vo.Group"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 방식의 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	// 넘어온 파라미터 처리
	String name = request.getParameter("name");
	String noStr = request.getParameter("no");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String date = request.getParameter("date");
	
	// 필요한 자료형변환
	int no = Integer.parseInt(noStr);
	Date debutDate = Date.valueOf(year+"-"+month+"-"+date);
	
	// Group객체 생성
	Group group = new Group();
	
	// setter 호출하여 값 세팅
	group.setName(name);
	group.setDebutDate(debutDate);
	group.setNo(no);
	
	// GroupsDAO.updateGroup() 호출하여 수정
	GroupsDAO.updateGroup(group);
	
	// listGroup.jsp로 이동
	response.sendRedirect("listGroup.jsp");
%>