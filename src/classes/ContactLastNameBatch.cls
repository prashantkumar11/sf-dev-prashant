/**
* @Author : 
* @Creation Date : Today
* @Class : Updateing last name into contact
* @User Story : US123456
* @Next User Story : US34567
**/
global class ContactLastNameBatch implements Database.Batchable<sObject>{


public List<contact> lstOfUpdatedLastName = new list<contact>();

     global Database.QueryLocator start(Database.BatchableContext BC) {
         return Database.getQueryLocator('SELECT Id, LastName from Contact');
    }
    
    global void execute(Database.BatchableContext BC, List<Contact> lstofContact) {
         integer i = 0;
         for(Contact c : lstofContact)   
         {
             if(c.LastName != null)
             {
                 c.LastName = 'Prashant New' + i;
                 lstOfUpdatedLastName.add(c);
                 System.debug('lst of Updated Last Name(((('+lstOfUpdatedLastName .size());
             }
             i++;
         }
         
         System.debug('LIST SIZE ========= ' + lstOfUpdatedLastName.size());
         
         if(lstOfUpdatedLastName != null && lstOfUpdatedLastName.size()>0)
         {
           update lstOfUpdatedLastName ;
         }
         
         }

     global void finish(Database.BatchableContext BC) {
    }



}