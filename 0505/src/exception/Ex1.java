package exception;

import javax.management.RuntimeErrorException;

public class Ex1 {

	/*
		예외 처리 방법
		1) try ~ catch (~ finally)
		2) throws(예외 처리 위임)
	*/
	static void test() throws Exception {
		throw new Exception();
	} // test() end
	
	static void test(int i) {
		try {
			throw new Exception();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		
		Ex1.test(3);
		
		try {
			Ex1.test();
		} catch(Exception e) {
			
		} // try~catch end
		
		//System.out.println(5/0); // 0으로 나누면 Exception 발생
		
		/*
			RuntimeException을 상속받은 Exception들은 
			예외처리(try ~ catch할 필요가 없음
			
			반대로 말하면 , RuntimeException을 제외하면 나머지 모든 Exception은
			반드시 try~catch를 해줘야 함
			
			아닐 경우 throws를 이용해서 다른 곳으로 예외처리를 위임할 수는 있음.
		*/
		
		int[] i = new int[4];
		System.out.println(1);
		try {
			System.out.println(2);
			System.out.println(i[4]);
			System.out.println(3);
		} catch(ArithmeticException e) {
			System.out.println(4);
		} catch(RuntimeException e) {
			System.out.println(5);
		} catch(Exception e){
			System.out.println(6);
		}finally{
			System.out.println(7);
		} // try~catch~finally end
		System.out.println(8);
		
	} // main() end
	
} // Ex1 class end
