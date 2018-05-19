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
	String audienceNumStr = request.getParameter("audience");
	String genreStr = request.getParameter("genre");
	String rating = request.getParameter("rating");
	
	Date releaseDate = Date.valueOf(year+"-"+month+"-"+date);
	int audience = Integer.parseInt(audienceNumStr);
	int genre = Integer.parseInt(genreStr);
	
	Movie movie = new Movie();
	movie.setName(name);
	movie.setDirector(director);
	movie.setReleaseDate(releaseDate);
	movie.setAudienceNum(audience);
	movie.setGenre(genre);
	movie.setRating(rating);
	
	MoviesDAO.insertMovie(movie);
	
	response.sendRedirect("movies.jsp");
%>