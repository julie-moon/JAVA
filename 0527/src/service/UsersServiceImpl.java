package service;

import dao.UsersDAO;
import vo.User;

public class UsersServiceImpl implements UsersService{

	private UsersDAO usersDAO;
	
	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}

	@Override
	public User loginUser(User user) {
		return usersDAO.selectLoginUser(user);
	}
	
}
