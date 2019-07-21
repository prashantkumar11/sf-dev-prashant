@isTest
private class TestSetUp{

 @testSetup static void setUp(){
  //create common test accounts
  List<Account> listOfAccount = new List<Account>();
  for(Integer i=0 ; i < 2 ; i++) {
   listOfAccount.add(new Account(Name = 'TestAcct' + i));
  
  }
   insert listOfAccount;
 }

 @isTest static void testMethod1() {
  //Get first test account by using SOQL query
  Account acct = [Select ID From Account Where Name='TestAcct10' LIMIT 1];
  //Modify First Account
  acct.Phone='555-1212';
  //This update is local to this test method only
  update acct;
  
  //Delete Second Account
  Account delAcct = [Select ID From Account Where Name='TestAcct1' LIMIT 1];
  //This deletion is local to this test method only
  delete delAcct;
 }

  



}