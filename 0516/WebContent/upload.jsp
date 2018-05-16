<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.catalina.servlet4preview.ServletContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*	
		multipart/form-data는
		String name = request.getParameter("name"); 안됨
		MultipartRequest 사용함-! 
	*/
	
	
	/*
		ServletContext sc = request.getServletContext();
		String root = sc.getRealPath("/");
		String uploadPath = root + "upload" + File.separator();
	*/
	
	// 1) 실제 경로
	String uploadPath = request.getServletContext().getRealPath("/upload") + File.separator;
	
	// 2) 파일 아름 중복 처리
	FileRenamePolicy frp = new DefaultFileRenamePolicy(); // 기본은 중복 시 이름 끝에 1, 2, 3... 붙여줌
	
	// 3) MultipartRequest 객체 생성        // request 객체, upload 경로, 업로드 최대 값, 인코딩, 파일 리네임 정책 객체 
 	MultipartRequest mr = new MultipartRequest(request, uploadPath, 1024*1024*100, "UTF-8", frp); // 1024*1024 = 1mb
 	
 	// 넘어온 파라미터 얻기
 	String name = mr.getParameter("name");
	
 	// 넘어온 파일의 이름 얻기
 	String profile = mr.getFilesystemName("profile");
%>
이름 : <%=name%>
<img src="upload/<%=profile%>" />