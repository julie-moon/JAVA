package com.jbm.phonebook.service;

import java.util.List;

import com.jbm.phonebook.dao.PhonebookDAO;
import com.jbm.phonebook.vo.Phone;

public class PhonebookServiceImpl implements PhonebookService{

	private PhonebookDAO phonebookDAO;
	
	public void setPhonebookDAO(PhonebookDAO phonebookDAO) {
		this.phonebookDAO = phonebookDAO;
	}

	@Override
	public List<Phone> phonebookList(int hostNo) {
		return phonebookDAO.selectList(hostNo);
	} // phonebookList() end

	@Override
	public int addPhonebook(Phone phone) {
		return phonebookDAO.insertPhonebook(phone);
	} // addPhonebook() end

	@Override
	public int deletePhonebook(int no) {
		return phonebookDAO.deletePhonebook(no);
	} // deletePhonebook() end
	
}
