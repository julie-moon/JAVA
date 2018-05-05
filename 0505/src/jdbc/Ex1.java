package jdbc;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Ex1 {

	public static void main(String[] args) {
		
		// 0) Connection, Statement, ResultSet 등을 지역 변수로 선언 
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		// 클래스가 없을 경우 예외 발생하므로 try ~ catch문 사용
		try {
			
			// 1) ojdbc 클래스를 메모리에 로딩 시켜줌
			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("드라이버 로딩 완료!");
			
			// 1.5) 연결할 때 필요한 데이터를 세팅
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "test";
			String password = "1111";
			
			// 2) Connection을 연결(오라클과 연동)
			con = DriverManager.getConnection(url, user, password);
			System.out.println("연결 성공!");
			
			// 3) Statement 객체 생성
			stmt = con.createStatement();
			
			// 4) SQL 구문 작성
			String sql = "SELECT * FROM idols";
			
			// 5) 수행(executeQuery()) 후 결과 객체 얻기
			rs = stmt.executeQuery(sql);
			System.out.println("결과 얻기 완료!");
			
			// 6) while문을 이용하여 출력
			while(rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				int height = rs.getInt("height");
				int weight = rs.getInt("weight");
				Date birthDate = rs.getDate("birth_date");
				int groupNo = rs.getInt("group_no");
				
				System.out.print("번호 : " + no);
				System.out.print(" / 이름 : " + name);
				System.out.print(" / 키 : " + height);
				System.out.print(" / 몸무게 : " + weight);
				System.out.print(" / 생년월일 : " + birthDate);
				System.out.println(" / 그룹번호 : " + groupNo);
			} // while end
			
		} catch(Exception e) {
			// printStackTrace() : 에러가 어디서 났는지 확인하기 위해 사용
			e.printStackTrace(); 
		} finally {
			
			try {
				if(rs!=null) {
					rs.close();
				} // if end
			} catch(Exception e2) {
				
			} //  try ~ catch end
			try {
				if(stmt!=null) {
					stmt.close();
				} // if end
			} catch(Exception e2) {
				
			} //  try ~ catch end
			try {
				if(con!=null) {
					con.close();
				} // if end
			} catch(Exception e2) {
				
			} //  try~catch end
			
		} // try~catch~finally end
		
	} // main() end
	
} // Ex1 class end
