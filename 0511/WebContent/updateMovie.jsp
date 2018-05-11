<%@page import="com.jbm.mms.dao.MoviesDAO"%>
<%@page import="com.jbm.mms.vo.Movie"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String noStr = request.getParameter("no");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String date = request.getParameter("date");
	String genreStr = request.getParameter("genre");
	String ratingStr = request.getParameter("rating");
	
	int no = Integer.parseInt(noStr);
	Date releaseDate = Date.valueOf(year+"-"+month+"-"+date);
	int genre = Integer.parseInt(genreStr);
	char rating = ratingStr.charAt(0);
	
	Movie movie = new Movie(no, releaseDate, genre, rating);
	
	MoviesDAO.updateMovie(movie);
	
	response.sendRedirect("movies.jsp");
	
%>
<%-- 
번호 : <%=no%> / 
개봉일 : <%=releaseDate%> / 
장르 : <%=genreStr%> / 
등급 : <%=ratingStr%>
--%>