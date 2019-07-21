public with sharing class CustomSettingsCountryIsoCode{

 public String selectedIso {get;set;}

 public List<SelectOption> isoCodes{
      get{
       List<SelectOption> options= new List<SelectOption>();
       
       for(CounrtyISD__c iso : CounrtyISD__c.getAll().values()) {
           options.add(new SelectOption(iso.ISD_Code__c, iso.Name + '-' +iso.ISD_Code__c));
       }
       return options;
      }
      
      set;
  }




}