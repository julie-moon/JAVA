package ver2;

import util.ActorPrinter;
import util.ActorPrinterEN;
import util.ActorPrinterJP;
import vo.Actor;

public class ActorApp {

public static void main(String[] args) {
		
		Actor actor = new Actor("현빈", 185, 74);
		
		ActorPrinter ap = new ActorPrinterJP(); 
		// ap.printActor(actor);
		
	} // main() end
	
} // ActorApp end
