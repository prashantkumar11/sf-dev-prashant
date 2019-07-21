@RestResource(urlMapping='/Account/*')
global with sharing class MyRestResource{

 @HttpDelete
 global static void doDelete(){
  RestRequest req = RestContext.request;
  RestResponse res = RestContext.response;
  String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/'+1));
  Account acct = [Select ID from Account Where ID = :accountId];
  delete acct;
 }
 
 @HttpGet
 global static Account doGet(){
  RestRequest req = RestContext.request;
  RestResponse res = RestContext.response;
  String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/'+1));
  Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :accountId];
  return result;
 }

 @HttpPost
 global static String doPost(String name, String phone, String website) {
 Account act = new Account();
 act.Name = name;
 act.phone = phone;
 act.website = website;
 insert act;
 return act.Id;
 }








}