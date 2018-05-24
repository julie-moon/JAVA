package service;

import java.util.List;

import dao.IdolsDAO;
import vo.Idol;

public class IdolsServiceImpl implements IdolsService {

	// 필요한 DAO를 주입받음(여러 개의 DAO를 주입 받는 경우도 있음)
	private IdolsDAO idolsDAO;
	
	public void setIdolsDAO(IdolsDAO idolsDAO) {
		this.idolsDAO = idolsDAO;
	}

	@Override
	public int addIdol(Idol idol) {
		// TODO Auto-generated method stub
		return idolsDAO.insertIdol(idol);
	} // addIdol() end

	@Override
	public List<Idol> idolList() {
		// TODO Auto-generated method stub
		return idolsDAO.selectList();
	} // idolList() end
	
	@Override
	public int deleteIdol(int no) {
		// TODO Auto-generated method stub
		return idolsDAO.deleteIdol(no);
	} // deleteIdol() end

}
