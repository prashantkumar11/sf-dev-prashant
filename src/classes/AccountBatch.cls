global class AccountBatch implements Database.Batchable<sObject>{

   

   global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator('Select Name,Phone from Account');
   }

   global void execute(Database.BatchableContext BC, List<Account> scope){
      system.debug('HHHHHHHHHHHHHHHHHHHHHHHH');
      
     List<Account> act = new List<Account>();
     integer i = 0;
     for(Account s : scope){
         Account ac = new Account();
         ac.Name = 'test' + i++;
         ac.Phone = '1111111111';
         act.add(ac);
     }
     system.debug('PRINT THE VALUE ==== ' + act.size());
     update act;
    }

   global void finish(Database.BatchableContext BC){
   }
}
