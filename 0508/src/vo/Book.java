package vo;

import java.sql.Date;

public class Book {
	
	private int no;
	private String title, author;
	private Date pubdate;
	
	public Book() {
		
	}
	
	public Book(String title, String author, Date pubdate) {
		this.title = title;
		this.author = author;
		this.pubdate = pubdate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Date getPubdate() {
		return pubdate;
	}

	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}
	
}
