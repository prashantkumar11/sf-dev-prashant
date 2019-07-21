trigger NumberOfContactPerAcctId on Contact (after insert, after delete) {
Set<ID> setOfAccId = new Set<ID>();
Map<ID, List<Contact>> mapIdToContact = new Map<ID, List<Contact>>();
Map<ID, Account> mapIdToAccount = new Map<ID,Account>();
  
  if(trigger.IsInsert && trigger.isafter) {
   for(Contact obj: trigger.new) {
      
      if(obj.AccountId!= null) {
         setOfAccId.add(obj.AccountId);
      }      
    }
  
  }
  
  if(trigger.isdelete && trigger.isafter) {
  
    for(Contact ct:trigger.old) {
      setOfAccId.add(ct.AccountId);     
    }
  
  }
  
  for(Contact ct: [select ID, Name , AccountId from contact where AccountId IN:setOfAccId]) {
    if(mapIdToContact.get(ct.AccountId) == null) {
      mapIdToContact.put(ct.AccountId, new List<Contact>());
      
    }
    mapIdToContact.get(ct.AccountId).add(ct);
   
  }
  
  for(Account ac: [Select ID from Account where ID IN:setOfAccId]) {
  
     mapIdToAccount.put(ac.ID, ac);
  
  }
  
  List<Account>  updateAccountList = new List<Account>();
  for(ID eachID: mapIdToContact.keySet()) {
   
   Account ac = mapIdToAccount.get(eachID);
   List<Contact> listOfContact = mapIdToContact.get(eachID);
   ac.TotalContactCount__c = listOfContact.size();
   updateAccountList.add(ac);
    System.debug('ADDED LIST ' + updateAccountList.size());
  }
  
  if(updateAccountList != null && updateAccountList.size() > 0) {
      update updateAccountList ;
   }

}