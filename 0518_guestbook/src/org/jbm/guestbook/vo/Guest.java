package org.jbm.guestbook.vo;

import java.sql.Timestamp;

public class Guest {
	
	private int no;
	private String writer, contents, ip;
	private Timestamp regdate;
	
	public Guest() {
		
	}
	
	public Guest(int no, String contents) {
		this.no = no;
		this.contents = contents;
	}
	
	public Guest(String writer, String contents, String ip) {
		this.writer = writer;
		this.contents = contents;
		this.ip = ip;
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
} // Guest class end
