package app;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.SqlSessionUtil;
import vo.Idol;

public class Ex8 {

	public static void main(String[] args) {

		SqlSession session = SqlSessionUtil.getSession();
		
		List<Idol> list = session.selectList("idols.selectList");
		
		for(Idol idol : list) {
			System.out.println(idol.getName());
		} // for end
		
	} // main() end

} // Ex8 class end
