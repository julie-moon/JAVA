package util;

import vo.Actor;

public class ActorPrinterJP implements ActorPrinter {

	private Actor actor;
	
	public void setActor(Actor actor) {
		this.actor = actor;
	}
	
	public void printActor() {
		
		System.out.println("名前 : " + actor.getName());
		System.out.println("身長 : " + actor.getHeight());
		System.out.println("体重 : " + actor.getWeight());
		
	} // printActor() end
	
} // ActorPrinterKO end
