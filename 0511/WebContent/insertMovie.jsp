<%@page import="com.jbm.mms.dao.MoviesDAO"%>
<%@page import="com.jbm.mms.vo.Movie"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String director = request.getParameter("director");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String date = request.getParameter("date");
	String audienceNumStr = request.getParameter("audienceNum");
	String genreStr = request.getParameter("genre");
	String ratingStr = request.getParameter("rating");
	
	Date releaseDate = Date.valueOf(year+"-"+month+"-"+date);
	int audienceNum = Integer.parseInt(audienceNumStr);
	int genre = Integer.parseInt(genreStr);
	char rating = ratingStr.charAt(0);
	
	Movie movie = new Movie(name, director, releaseDate, audienceNum, genre, rating);
	
	MoviesDAO.insertMovie(movie);
	
	response.sendRedirect("movies.jsp");
	
%>
<%-- 
영화 제목 : <%=name%> / 
감독 : <%=director%> / 
개봉일 : <%=releaseDate%> / 
관객 수 : <%=audienceNum%> / 
장르 : <%=genre%> / 
등급 : <%=rating%>
--%>