package factory;

import util.ActorPrinter;
import util.ActorPrinterEN;
import util.ActorPrinterJP;
import util.ActorPrinterKO;

public class ActorPrintFactory {
	
	public static ActorPrinter getActorPrint(String cmd) {
		
		ActorPrinter ap = null;
		
		switch(cmd) {
		
			case "KO" :
				ap = new ActorPrinterKO();
				break;
				
			case "EN" :
				ap = new ActorPrinterEN();
				break;
				
			case "JP" :
				ap = new ActorPrinterJP();
				break;	
		
		} // switch() end
		
		return ap;
		
	} // getActorPrint() end
	
}
