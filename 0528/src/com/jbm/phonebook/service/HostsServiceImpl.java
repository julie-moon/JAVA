package com.jbm.phonebook.service;

import com.jbm.phonebook.dao.HostsDAO;
import com.jbm.phonebook.vo.Host;

public class HostsServiceImpl implements HostsService{

	private HostsDAO hostsDAO;
	
	public void setHostsDAO(HostsDAO hostsDAO) {
		this.hostsDAO = hostsDAO;
	}

	@Override
	public Host loginUser(Host host) {
		return hostsDAO.selectLoginUser(host);
	} // loginUser() end
	
}
