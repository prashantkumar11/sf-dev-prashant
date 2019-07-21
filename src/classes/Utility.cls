/******************************************************************************************************************************
 Author       : Prashant Kumar
 Created Date : 16-December-2016
 Description  : This method is used to insert the errors in Error Log Object in Salesforce, This is used to get the errors from 
 Database.saveResult.
 ******************************************************************************************************************************/
 
 public class Utility {
 
 
  public static void insertDMLError(Database.saveResult[] saveResultList, List<sObject> sObjectList ,String objectName , String methodName, String
   actionType) {
    
    String errors='';
    List<Error_Handler__c> errorList = new List<Error_Handler__c>();
    
    for(Database.SaveResult sr: saveResultList) {
    
     if(sr.isSuccess()) {
      system.debug(' ID ' + sr.getId());
     } else {
        //Operation failed so get all errors
        for(Database.Error err : sr.getErrors()) {
        
         system.debug('The following erros information');
         system.debug('Status Code ' + err.getStatusCode() + ' Error Message ' + err.getMessage());
         system.debug('Fields that are affected ' + err.getFields());
         errorList.add(insertErrorLog(actionType , methodName, err.getMessage(), objectName) );
        }
     
     }
    
    
    }
   
   
   }
 
 
  public static Error_Handler__c  insertErrorLog(String actionType , String classMethod, String message , String ObjectName ) {
   
   Error_Handler__c  errorHand = new Error_Handler__c  ();
   errorHand.Name = actionType;
   errorHand.Class_Method__c = classMethod;
   errorHand.Message__c = message;
   errorHand.Object_Name__c = ObjectName ;
   return errorHand;
  
  }
 
 
 
 }