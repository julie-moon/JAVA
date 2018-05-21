<%@page import="com.jbm.model1.dao.UsersDAO"%>
<%@page import="com.jbm.model1.vo.User"%>
<%@page import="java.sql.Date"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		enctype="multipart/form-data" 이기 때문에 일반적인 방식으로 파라미터 값 얻을 수 없음. 
		// 7개의 파라미터
		String id = request.getParameter("id"); // id값 얻을 수 없음
	*/

	// 인코딩 
	String encoding = "UTF-8";

	// 경로
	int size = 1024*1024*100;
	
	// 파일 리네임 정책
	FileRenamePolicy frp = new DefaultFileRenamePolicy();
	
	// 경로
	String path = request.getServletContext().getRealPath("profile");
	
	// 멀티파트 리퀘스트 객체
	MultipartRequest mr = new MultipartRequest(request, path, size, encoding, frp);
	
	// 파라미터 6개 + 파일 이름 1개
	String id = mr.getParameter("id");
	String nickname = mr.getParameter("nickname");
	String password = mr.getParameter("password");
	String year = mr.getParameter("year");
	String month = mr.getParameter("month");
	String date = mr.getParameter("date");
	String profile = mr.getFilesystemName("profile");
	
	Date birthDate = Date.valueOf(year+"-"+month+"-"+date);
	
	// 회원가입(users 테이블에 INSERT)
	User user = new User(id, password, nickname, profile, birthDate);
	
	UsersDAO.insertUser(user);
	
	response.sendRedirect("index.jsp");
	
%>
<%=id%>
<%=nickname%>
<%=password%>
<%=year%>
<%=month%>
<%=date%>
<%=birthDate %>
<%=profile%>