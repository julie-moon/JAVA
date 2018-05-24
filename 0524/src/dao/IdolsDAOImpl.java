package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.Idol;

public class IdolsDAOImpl implements IdolsDAO {

	private SqlSession session;
	
	// Spring DI(의존성 주입) setter 주입
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	// 기본 생성자
	public IdolsDAOImpl() {
		// TODO Auto-generated constructor stub
	}
	
	public IdolsDAOImpl(SqlSession session) {
		// TODO Auto-generated constructor stub
		this.session = session;
	}

	@Override
	public int insertIdol(Idol idol) {
		return session.insert("idols.insertIdol", idol);
	} // insertIdol() end

	@Override
	public List<Idol> selectList() {
		// TODO Auto-generated method stub
		return session.selectList("idols.IdolList");
	} // selectList() end
	
	@Override
	public int deleteIdol(int no) {
		return session.delete("idols.deleteIdol", no);
	} // deleteIdol() end
	
}
