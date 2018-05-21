package com.jbm.model1.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Board {

	private int no, writerNo, hit, likes;
	private String title, contents, writer;
	private Timestamp regdate;
	
	// 상수
	public static final int SIMPLE = 1;
	public static final int DETAIL = 2;
	
	// SimpleDateFormat 필요함
	private SimpleDateFormat sdf, ddf;
	
	// 생성자 : 멤버필드 초기화
	public Board() {
		sdf = new SimpleDateFormat("YYYY년 MM월 dd일");
		ddf = new SimpleDateFormat("YYYY년 MM월 dd일 H시 m분 s초");
	}
	
	public String getFormatRegdate(int type) {
		if(type == 1) {
			return sdf.format(regdate);
		} else if(type == 2){
			return ddf.format(regdate);
		} // if ~ else end
		
		return null;
	}
	
	public Board(String title, String contents, String writer, int writerNo) {
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.writerNo = writerNo;
	}
	
	public Board(int no, String title, String contents) {
		this.no = no;
		this.title = title;
		this.contents = contents;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getWriterNo() {
		return writerNo;
	}

	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
