public class TestAnimal {

 public void testLegsCount(){
  Animal a = new Cow();
  Animal a1 = new Lion();
  Animal a2 = new Whale();
  Water a3 = new Whale();
  
  System.debug('COW LEGS ======= ' + a.legsCount() + ' LION LEGS ====== ' + a1.legsCount() + ' WHALE LEGS ====== ' + a2.legsCount() + 'WHALE FINS ====== ' + a3.numberOfFins());
 }

}