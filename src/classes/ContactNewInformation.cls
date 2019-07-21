/**File Name: 
*  Description 
*  Copyright : XYZTechnologies Limited Copyright (c) 2019 
*  @author : 
*  Modification Log :
*/ 
@RestResource (urlMapping = '/contactNewInfo/*')
global with sharing class ContactNewInformation {

  
  @HttpGet
  global static Contact getContactInfo() {
    RestRequest req = RestContext.request;
    //0030K00001iUjxL
    Contact result = null;
    String contactId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
    if(String.isNotBlank(contactId)) {
       result = [select Name, Phone, MailingAddress from Contact Where Id= :contactId limit 1];
    }
    return result;
  }
  
}