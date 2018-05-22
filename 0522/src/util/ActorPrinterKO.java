package util;

import vo.Actor;

public class ActorPrinterKO implements ActorPrinter {

	private Actor actor;
	
	public void setActor(Actor actor) {
		this.actor = actor;
	}
	
	public void printActor() {
		
		System.out.println("이름 : " + actor.getName());
		System.out.println("키 : " + actor.getHeight());
		System.out.println("몸무게 : " + actor.getWeight());
		
	} // printActor() end
	
} // ActorPrinterKO end
