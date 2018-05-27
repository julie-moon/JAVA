package com.jbm.phonebook.dao;

import java.util.List;

import com.jbm.phonebook.vo.Phone;

public interface PhonebookDAO {

	public List<Phone> selectList(int hostNo);
	
	public int insertPhonebook(Phone phone);
	
	public int deletePhonebook(int no);
	
}
