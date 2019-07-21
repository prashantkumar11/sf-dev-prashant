/**
* @Author : Rishi and Priynaka
* @Creation Date : Today
* @Class : Updateing last name into contact
* @User Story : US123456
* @Next User Story : US34567
**/
global class batchContactLastName implements Database.Batchable<sObject>{


public List<contact> lstOfUpdatedLastName = new list<contact>();

     global Database.QueryLocator start(Database.BatchableContext BC) {
         return Database.getQueryLocator('SELECT Id, LastName from Contact');
    }
    
    global void execute(Database.BatchableContext BC, List<Contact> lstofContact) {
         for(Contact c : lstofContact)   
         {
             if(c.LastName != null)
             {
                 c.LastName = c.LastName + 'RishiPriyanka';
                 lstOfUpdatedLastName.add(c);
                 System.debug('lst of Updated Last Name(((('+lstOfUpdatedLastName .size());
             }
         }
         
         if(lstOfUpdatedLastName != null && lstOfUpdatedLastName .size()>0)
         {
           update lstOfUpdatedLastName ;
         }
         
         }

     global void finish(Database.BatchableContext BC) {
    }











}