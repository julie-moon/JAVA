package service;

import java.util.List;

import vo.Idol;

public interface IdolsService {

	// service의 메소드명은 SQL 구문을 몰라도 사용할 수 있도록 현실적이게 만들어야 함. 
	public int addIdol(Idol idol);
	
	public List<Idol> idolList();	
	
	public int deleteIdol(int no);
	
}
