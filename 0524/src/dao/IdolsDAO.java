package dao;

import java.util.List;

import vo.Idol;

public interface IdolsDAO {
	
	// insert, update, delete, select로 시작
	public int insertIdol(Idol idol);
	
	public List<Idol> selectList();
	
	public int deleteIdol(int no);
	
}
