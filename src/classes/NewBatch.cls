global class NewBatch implements Database.Batchable<sObject>{

   
   //Database.QueryLocator = 50 million records
   global Database.QueryLocator start(Database.BatchableContext BC){
     
      return Database.getQueryLocator('Select Name,Phone from Account');
   }

   global void execute(Database.BatchableContext BC, List<Account> scope){
     List<Account> act = new List<Account>();
     integer i = 0;
     for(Account s : scope){
         Account ac = new Account();
         ac.Id = s.Id;
         ac.Name = 'Prashant' + i++;
         ac.Phone = '8888888';
         act.add(ac);
     }
     system.debug('PRINT THE VALUE ==== ' + act.size());
     update act;
    }

   global void finish(Database.BatchableContext BC){
   }
}