global class BatchDelete implements Database.Batchable<sObject> {
   

   global Database.QueryLocator start(Database.BatchableContext BC){
      String query='Select Id from Market__c';
      return Database.getQueryLocator(query);
   }

   global void execute(Database.BatchableContext BC, List<Market__c> scope){
      delete scope;
      DataBase.emptyRecycleBin(scope);
   }

   global void finish(Database.BatchableContext BC){
   }
}