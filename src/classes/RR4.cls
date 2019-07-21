/****************************************************
**************** Created By Prashant ****************
*/
@RestResource(urlMapping='/RR4/Account')
global class RR4 {

 @HttpPost
 global static myDataType doPost(Account acct) {
  RestRequest rst = RestContext.request;
  RestResponse rsp = RestContext.response;
  
  myDataType response = new myDataType();
  
  try {
  insert acct;
  response.acctList.add(acct);
  response.status = 'SUCCESS';
  response.error_msg = 'NO ERROR';
  } catch(DMLException e) {
     response.status = 'ERROR';
     response.error_msg = 'Account record could not be created due to following Error ' + e.getMessage();
  }
  
  return response;
  }
  
  
  global class myDataType {
   List<Account> acctList;
   String status;
   String error_msg;
   
   public myDataType() {
    acctList = new List<Account>();
   
   }
  
  
  }

}