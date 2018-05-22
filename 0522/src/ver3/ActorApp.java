package ver3;

import factory.ActorPrintFactory;
import util.ActorPrinter;
import util.ActorPrinterEN;
import util.ActorPrinterJP;
import vo.Actor;

public class ActorApp {

public static void main(String[] args) {
		
		Actor actor = new Actor("현빈", 185, 74);
		
		ActorPrinter ap = ActorPrintFactory.getActorPrint("KO"); 
		// ap.printActor(actor);
		
	} // main() end
	
} // ActorApp end
