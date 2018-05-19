package com.jbm.mms.vo;

import java.sql.Date;
import java.text.DecimalFormat;
import java.util.Calendar;

public class Movie {
	
	private int no, audienceNum, genre;
	private String name, director, rating, genreName; // genreName은 join용
	private Date releaseDate;
	private Calendar release;
	
	public Movie() {
		release = Calendar.getInstance();
	}
	
	// 등급 클래스를 얻어오는 메소드
	public String getRatingClass() {
		String className = "rating_";
		
		switch(rating) {
		case "A" : className += "all"; break;
		case "B" : className += "12"; break;
		case "C" : className += "15"; break;
		case "D" : className += "19"; break;
		}
		
		return className;
	} // getRatingClass() end
	
	// 콤마 찍어 관객수 얻는 메소드
	public String getCommaAudience() {
		DecimalFormat df = new DecimalFormat("#,###");
		
		return df.format(audienceNum);
	}
	
	// 년도 얻어오는 메소드(updateForm.jsp에서 필요함)
	public int getReleaseYear() {
		return release.get(Calendar.YEAR);
	}
	
	// 월 얻어오는 메소드(updateForm.jsp에서 필요함)
	public int getReleaseMonth() {
		return release.get(Calendar.MONTH)+1;
	}
	
	// 일 얻어오는 메소드(updateForm.jsp에서 필요함)
	public int getReleaseDay() {
		return release.get(Calendar.DATE);
	}
	
	// 년, 월, 일 얻어오는 메소드
	public String getFormatReleaseDate() {
		String full = getReleaseYear()+"년 "+getReleaseMonth()+"월 "+getReleaseDay()+"일";
		return full;
	}
	
	public String getGenreName() {
		return genreName;
	}

	public void setGenreName(String genreName) {
		this.genreName = genreName;
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

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
		// 여기에서 release의 setTime()을 해줘야 함
		release.setTime(releaseDate);
	}
	
} // Movie class end
