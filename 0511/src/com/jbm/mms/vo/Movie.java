package com.jbm.mms.vo;

import java.sql.Date;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;

public class Movie {

	private int no, audienceNum, genre;
	private String name, director, genreName, audienceNumStr, releaseDateStr;
	private Date releaseDate;
	private char rating;
	
	public Movie() {
		
	}
	
	public Movie(String name, String director, Date releaseDate, int audienceNum, int genre, char rating) {
		this.name = name;
		this.director = director;
		this.releaseDate = releaseDate;
		this.audienceNum = audienceNum;
		this.genre = genre;
		this.rating = rating;
	}
	
	public Movie(int no, Date releaseDate, int genre, char rating) {
		this.no = no;
		this.releaseDate = releaseDate;
		this.genre = genre;
		this.rating = rating;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getAudienceNum() {
		return audienceNum;
	}

	public void setAudienceNum(int audienceNum) {
		this.audienceNum = audienceNum;
	}
	
	public String getAudienceNumStr() {
		NumberFormat nf = NumberFormat.getInstance();
		audienceNumStr = nf.format(getAudienceNum());
		return audienceNumStr;
	}

	public int getGenre() {
		return genre;
	}

	public void setGenre(int genre) {
		this.genre = genre;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}
	
	public String getGenreName() {
		return genreName;
	}

	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	
	public String getRealeaseDateStr() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		releaseDateStr = sdf.format(getReleaseDate());
		return releaseDateStr;
	}

	public char getRating() {
		return rating;
	}

	public void setRating(char rating) {
		this.rating = rating;
	}
	
}
