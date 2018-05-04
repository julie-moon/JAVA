package overriding;

public class Ex3 {
	public static void main(String[] args) {
		
		Object o = "Test";
		String s = new String("Test");
		// String s = (String)o;
		
		System.out.println(o==s);
		System.out.println(o.equals(s));
		
	} // main() end
} // Ex3 class end
