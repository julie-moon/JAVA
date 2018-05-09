<%@page import="dao.GroupsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	/*
		기능 페이지 : 지우고, 입력하고, 수정하는 페이지는 
					  유저 눈에 보이는 페이지가 아님(HTML이 필요 없음)
		이런 페이지들을 none view 페이지라고 함. 
	*/

	// listGroup.jsp에서 넘어온 파라미터인 no를 얻음 
	// 파라미터 값은 String으로 넘어옴
	String noStr = request.getParameter("no");

	// int형으로 변경
	int no = Integer.parseInt(noStr);
	
	// delete 구문 수행
	GroupsDAO.deleteGroup(no);
	
	// listGroup.jsp로 이동(리다이렉트)
	response.sendRedirect("listGroup.jsp");
	
%>
<%-- 
	<%=noStr%>
--%>