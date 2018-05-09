<%@page import="dao.IdolsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	// 1. listIdol에서 넘어온 파라미터인 no를 얻음 
	String noStr = request.getParameter("no");

	// 2. 파라미터로 얻어온 값은 String형이기 때문에 int형으로 변환해줘야함 
	int no = Integer.parseInt(noStr);
	
	// 3. delete 구문 수행
	IdolsDAO.deleteIdol(no);

	// 4. listIdol.jsp로 리다이렉트
	response.sendRedirect("listIdol.jsp");
	
%>