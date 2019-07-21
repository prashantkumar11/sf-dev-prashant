/****************************************************
 ************** Created By Prashant *****************
 */
 
 @RestResource(urlMapping='/RR1/Account')
 global without sharing class RR1 {
 
 
  @HttpPOst
  global static Account doPost(String name, String phone , String industry) {
   
   RestRequest req = RestContext.request;
   RestResponse res = RestContext.response;
   
   Account act = new Account();
   act.name = name;
   act.phone = phone;
   act.industry = industry;
   
   insert act;
   
   return act;
  
  
  }
 
 
 
 
 
 }