trigger fillDetail on Finance__c (before insert, before update) {

for(Finance__c fc: trigger.new) {

  if(fc.Name != null) {
    
    fc.Description__c = fc.Name;
  
  }
  
}

}