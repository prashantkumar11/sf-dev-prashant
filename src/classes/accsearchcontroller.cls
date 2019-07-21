public with sharing class accsearchcontroller {  
   public list <account> acc {get;set;} 
      public list <contact> cntct {get;set;}  
 
   public string searchActstring {get;set;}  
      public string name {get;set;}  
            public string accountnumber {get;set;}  


   public accsearchcontroller(ApexPages.StandardController controller) {  
   }  
   public void search(){ 
   string searchquery = null ; 
     if(name == null && accountnumber == null ) {
       searchquery='select name,id from account where name like \'%'+searchActstring +'%\' Limit 20'; 
     } else {
       searchquery='select name,id,accountnumber from account where name:=name and accountnumber :=accountnumber  Limit 20' ; 
     }
     acc= Database.query(searchquery);  
   }  
   public void clear(){  
   acc.clear();  
   }  
 }