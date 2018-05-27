package com.jbm.phonebook.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Phone {

	private int no, hostNo, year, month, date; 
	private String name, phone, phone1, phone2, phone3, genderChar;
	private char gender;
	private Date birthDate;
	private Timestamp regdate;
	
	public Phone() {
		
	}

	public String getChangeGender(char gender) {
		if(gender == 'M') {
			genderChar = "남자";
		} else if(gender == 'F') {
			genderChar = "여자";
		} // if ~ else end
		return genderChar;
	} // getChangeGender(); 
	
	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}
	
	public int getDate() {
		return date;
	}

	public void setDate(int date) {
		this.date = date;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getHostNo() {
		return hostNo;
	}

	public void setHostNo(int hostNo) {
		this.hostNo = hostNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		if(phone == null) {
			phone = phone1 + phone2 + phone3; 
		} // if end
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public Date getBirthDate() {
		if(birthDate == null) {
			birthDate = Date.valueOf(year + "-" + month + "-" + date);
		} // if end
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
