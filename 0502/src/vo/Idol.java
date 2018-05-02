package vo;

public class Idol {
	
	// 이름, 키, 몸무게, 그룹명
	private String name;
	private double height;
	private double weight;
	private String groupName;
	
	/*
	 	접근제한자
	 	public : 외부에서 접근 가능
	 	protected : 같은 패키지나 상속 관계에서 접근 가능
	 	default : 같은 패키지에서 접근 가능
	 	private : 같은 클래스 내부(멤버끼리)에서 접근 가능
	*/
	
	// 기본 생성자(control + space 누르면 만들어짐)
	public Idol() {
		// TODO Auto-generated constructor stub
	}
	
	// 인자가 4개인 생성자
	public Idol(String name, double height, double weight, String groupName) {
		this.name = name;
		this.height = height;
		this.weight = weight;
		this.groupName = groupName;
	}
	
	// 이름에 대한 getter
	public String getName() {
		return name; // 같은 클래스 내에서 인스턴스 멤버들끼리 접근 시 this. 생략 가능
	}
	// 이름에 대한 setter
	public void setName(String name) {
		this.name = name;
	}
	public double getHeight() {
		return this.height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public double getWeight() {
		return this.weight;
	}
	public void setWeight(double weight) {
		this.weight = weight; 
	}
	public String getGroupName() {
		return this.groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
} // Idol class end
