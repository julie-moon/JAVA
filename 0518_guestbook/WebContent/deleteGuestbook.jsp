<%@page import="org.jbm.guestbook.dao.GuestbookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 삭제
	//System.out.println("삭제할 예정");
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);

	// 파라미터로 넘어온 번호를 delete() 메소드에 넘겨줌
	GuestbookDAO.delete(no);
	
	// index.jsp로 리다이렉트
	response.sendRedirect("index.jsp");
%>
<%-- 
no : <%=no%>
--%>