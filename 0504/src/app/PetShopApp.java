package app;

import animal.Animal;
import animal.Cat;
import animal.Dog;
import animal.Fox;
import animal.Rabbit;

public class PetShopApp {

	public static void main(String[] args) {
		
		// 모든 동물을 담기 위해 객체 자료형 Animal로 배열 만들어줌
		Animal[] rooms = new Animal[2];
		
		Cat c = new Cat();
		c.name = "라이언";
		c.age = 10;
		rooms[0] = c;
		
		Dog d = new Dog();
		d.name = "고양이";
		d.age = 4;
		rooms[1] = d;
		
		for(Animal animal : rooms) {
			System.out.println(animal.name);
			animal.cry();
		} // for end
		
		Fox f = new Fox();
		f.name = "어린왕자";
		f.age = 7;
		
		Rabbit r = new Rabbit();
		r.name = "토끼";
		r.age = 3;
		
		
		
	} // main() end

} // PetShopApp class end
