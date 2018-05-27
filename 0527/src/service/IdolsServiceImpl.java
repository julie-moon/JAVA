package service;

import java.util.List;

import dao.IdolsDAO;
import vo.Idol;

public class IdolsServiceImpl implements IdolsService {

	private IdolsDAO idolsDAO;
	
	public void setIdolsDAO(IdolsDAO idolsDAO) {
		this.idolsDAO = idolsDAO;
	}

	@Override
	public List<Idol> idolList() {
		return idolsDAO.selectIdolList();
	} // idolList() end
	
} // IdolsServiceImpl end
