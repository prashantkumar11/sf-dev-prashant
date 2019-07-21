global class batchContactRevertLastName implements Database.Batchable<sObject>{


public List<contact> lstOfRevertBackTheUpdatedLastName = new list<contact>();

 global Database.QueryLocator start(Database.BatchableContext BC) {
    
      
       String query = 'SELECT Id, LastName from Contact';
        return Database.getQueryLocator(query);
    }
    
     global void execute(Database.BatchableContext BC, List<Contact> lstofContact) {
         for(Contact c : lstofContact)   
         {
         
             if(c.LastName != null && c.LastName.contains('XYZ'))
             {
                 Integer i= c.LastName.length();
                 
                 c.LastName = c.LastName.substring(0, i-3 ) ;
                 lstOfRevertBackTheUpdatedLastName.add(c);
                 System.debug('lst of Revert Back Updated Last Name(((('+lstOfRevertBackTheUpdatedLastName.size());
             }
                    
         }
         
         if(lstOfRevertBackTheUpdatedLastName != null && lstOfRevertBackTheUpdatedLastName.size()>0)
         {
           update lstOfRevertBackTheUpdatedLastName;
         }
         
         }




global void finish(Database.BatchableContext BC) {
    }











}