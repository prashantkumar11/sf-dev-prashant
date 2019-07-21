public without sharing class CompanyDetailsharingExmaple1 {


    public list<Company__c> lstofcom{get;set;}
    
    public CompanyDetailsharingExmaple1 ()
    {
    
    
     lstofcom = new List<Company__c>();
     
     lstofcom  = [select Name from Company__C];
    
    }
}