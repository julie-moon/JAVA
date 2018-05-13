package vo;

import java.sql.Date;

public class Group {
	
	private int no;
	private String name;
	private Date debutDate;
	
	// 기본 생성자
	public Group() {
		
	}
	
	// 번호, 이름을 받는 생성자
	public Group(int no, String name) {
		this.no = no;
		this.name = name;
	}
	
	// 이름, 데뷔일을 받는 생성자
	public Group(String name, Date debutDate) {
		this.name = name;
		this.debutDate = debutDate;
	}
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Date getDebutDate() {
		return debutDate;
	}
	
	public void setDebutDate(Date debutDate) {
		this.debutDate = debutDate;
	}
	
}
