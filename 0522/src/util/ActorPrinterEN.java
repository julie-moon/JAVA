package util;

import vo.Actor;

public class ActorPrinterEN implements ActorPrinter{

	private Actor actor;
	
	public void setActor(Actor actor) {
		this.actor = actor;
	}
	
	public void printActor() {
		
		System.out.println("name : " + actor.getName());
		System.out.println("height : " + actor.getHeight());
		System.out.println("weight : " + actor.getWeight());
		
	} // printEnglishActor() end
	
} // ActorPrinterEN end
