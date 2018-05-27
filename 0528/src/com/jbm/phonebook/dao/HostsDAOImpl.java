package com.jbm.phonebook.dao;

import org.apache.ibatis.session.SqlSession;

import com.jbm.phonebook.vo.Host;

public class HostsDAOImpl implements HostsDAO{

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public Host selectLoginUser(Host host) {
		return session.selectOne("hosts.selectLoginUser", host);
	} // selectLoginUser() end
	
}
