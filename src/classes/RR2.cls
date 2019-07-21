/****************************************************
**************** Created By Prashant ****************
*/
@RestResource(urlMapping='/RR2/Account')
global class RR2 {

 @HttpPost
 global static Account doPost(Account acct) {
  RestRequest rst = RestContext.request;
  RestResponse rsp = RestContext.response;
  insert acct;
  return acct;
  }

}