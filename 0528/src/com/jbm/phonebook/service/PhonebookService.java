package com.jbm.phonebook.service;

import java.util.List;

import com.jbm.phonebook.vo.Phone;

public interface PhonebookService {

	public List<Phone> phonebookList(int hostNo);
	
	public int addPhonebook(Phone phone);
	
	public int deletePhonebook(int no);
	
}
