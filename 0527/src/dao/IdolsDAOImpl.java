package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.Idol;

public class IdolsDAOImpl implements IdolsDAO {

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<Idol> selectIdolList() {
		return session.selectList("idols.idolList");
	} // selectIdolList() end
	
} // IdolsDAOImpl end
