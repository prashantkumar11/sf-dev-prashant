public class TestSomething {


 public void getValue(sObject sObj){
 
   if(sObj instanceof Account) {
    system.debug('Print the Account value ================ ');
   } 
   
   if(sObj instanceof Contact) {
    system.debug('Print the Contact value --------------------------------- ');
   } 
 
 }




}