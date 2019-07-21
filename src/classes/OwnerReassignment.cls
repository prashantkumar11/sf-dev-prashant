global class OwnerReassignment implements Database.Batchable<sObject> {

List<Account> reassignedOwner = new List<Account>();
 String email='hitmprashant@gmail.com';
 Id toUserId='005280000036417';
 Id fromUserId='00528000002mHgd';


 
 global Database.QueryLocator start(Database.BatchableContext BC) {
   String query='SELECT Id, Name, Ownerid FROM Account';
   return Database.getQueryLocator(query);
 }
 
 global void execute(Database.BatchableContext BC, List<Account> scope) {
  for(Account a : scope) {
   if (a.OwnerId == fromUserId) {
    a.OwnerId = toUserId;
    reassignedOwner.add(a);
    
    System.debug('Updated the user id ================ ==== ' + reassignedOwner.size());
   }
  }
  
  update reassignedOwner;
 }
 
 global void finish(Database.BatchableContext BC) {
  Messaging.SingleEmailMessage m1 = new Messaging.SingleEmailMessage();
  String[] toAddresses = new String[] {email};
  m1.setToAddresses(toAddresses);
  m1.setReplyTo('hitmprashant@gmail.com');
  m1.setSenderDisplayName('Batch Processing');
  m1.setSubject('Batch Process Completed');
  m1.setPlainTextBody('Batch Process has completed');
  Messaging.sendEmail(new Messaging.SingleEmailMessage[]{m1});
 }



}