package service;

import java.util.List;

import dao.MembersDAO;
import vo.Member;

public class MembersServiceImpl implements MembersService{

	private MembersDAO membersDAO;
	
	public void setMembersDAO(MembersDAO membersDAO) {
		this.membersDAO = membersDAO;
	} // setMembersDAO() end

	@Override
	public List<Member> memberList() {
		return membersDAO.selectList();
	} // memberList() end
	
} // MembersServiceImpl end
