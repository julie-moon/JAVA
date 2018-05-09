<%@page import="dao.GroupsDAO"%>
<%@page import="vo.Group"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//get 방식일 때는 파라미터로 얻어온 값 한글 안깨짐. post 방식일 때 한글 깨짐(막아주기 위한 코드)
	request.setCharacterEncoding("UTF-8"); 

	//넘어오는 파라미터 값 얻어오기
	String name = request.getParameter("name");
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	String dateStr = request.getParameter("date");
	
	// 파라미터로 넘어온 값들은 String형이기 때문에 필요에 따라 형변환 해줘야 함
	Date debutDate = Date.valueOf(yearStr+"-"+monthStr+"-"+dateStr); 
	
	// Group 객체 생성 후 세팅
	Group group = new Group(name, debutDate);
	
	// 그룹 입력
	GroupsDAO.insertGroup(group);
	
	// listGroup으로 이동(리다이렉트)
	response.sendRedirect("listGroup.jsp");
	
%>
<%-- 파라미터가 잘 넘어오는지 확인 --%>
<%-- 
그룹명 : <%=name%> /  
데뷔일 : <%=debutDate%>
--%>