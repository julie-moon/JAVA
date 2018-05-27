package com.jbm.phonebook.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jbm.phonebook.vo.Phone;

public class PhonebookDAOImpl implements PhonebookDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Phone> selectList(int hostNo) {
		return session.selectList("phonebook.phonebookList", hostNo);
	}

	@Override
	public int insertPhonebook(Phone phone) {
		return session.insert("phonebook.insertPhonebook", phone);
	}

	@Override
	public int deletePhonebook(int no) {
		return session.delete("phonebook.deletePhonebook", no);
	}
	
}
