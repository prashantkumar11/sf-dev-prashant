global class SearchAndReplace implements Database.Batchable<sObject>, Database.AllowsCallouts{

 global final String Query;
 global final String Entity;
 global final String Field;
 global final String Value;
 
 global SearchAndReplace(String q, String e, String f, String v) {
   this.Query = q;
   this.Entity = e;
   this.Field = f;
   this.Value = v;
 }
 
 global Database.QueryLocator start(Database.BatchableContext BC) {
   return Database.getQueryLocator(query);
 }
 
 global void execute(Database.BatchableContext BC, List<sObject> scope) {
   for(sObject obj: scope) {
    obj.put(Field, Value);
   }
   update scope;
 }

global void finish(Database.BatchableContext BC) {
 
  AsyncApexJob a = [Select Id , status , NumberOfErrors, JobItemsProcessed,  TotalJobItems, CreatedBy.Email
      FROM AsyncApexJob WHERE Id =
      :BC.getJobId()];
      
      Messaging.SingleEmailMessage m1 = new Messaging.SingleEmailMessage();
      String[] toAddresses = new String[] {a.CreatedBy.Email};
      m1.setToAddresses(toAddresses);
      m1.setSubject('Apex Sharing Recalculation ' + a.status);
      m1.setPlainTextBody('The batch Apex job processed ' + a.TotalJobItems +
      ' batches with '+ a.NumberOfErrors + ' failures.');
      Messaging.sendEmail(new Messaging.SingleEmailMessage[]{m1});
  
}








}