global class UpdateAccountFields implements Database.Batchable<sObject> {


global final String Query;
global final String Entity;
global final String Field;
global final String Value;

global UpdateAccountFields(String q, String e, String f, String v) {
 Query = q;
 Entity = e;
 Field = f;
 Value = v;

}


 global Database.QueryLocator start(Database.BatchableContext BC) {
  return Database.getQueryLocator(query);
 }
 
 global void execute(Database.BatchableContext BC, List<sObject> scope) {
  
  for(sObject updated : scope) {
   updated.put(Field,Value);
   update scope;
  }
  
  }
  
  global void finish(Database.BatchableContext BC) {
   
  }
 }