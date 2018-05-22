package ver1;

import util.ActorPrinter;
import util.ActorPrinterKO;
import vo.Actor;

public class ActorApp {

	public static void main(String[] args) {
		
		// Actor는 데이터에 의존
		Actor actor = new Actor("현빈", 185, 74);
		
		ActorPrinter ap = new ActorPrinterKO(); // ActorPrinter 객체는 Actor에 의존함(DAO는 SqlSession에 의존적)
		// ap.setActor(actor);
		ap.printActor();
		
	} // main() end
	
} // ActorApp end
