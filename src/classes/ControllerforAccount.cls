public class ControllerforAccount {
    
    //  string when you select an accound this variable will fill from account Id
    
    public string selectedAccountId {get;set;}
    public Boolean isshow{get;set;}
    public boolean isactive;  
      public string strMessage{get;set;}   
    public List<selectoption> lstSelectOption{get;set;}
    public List<Contact> lstContact {get;set;}
    
    public ControllerforAccount (){
        lstContact  = new List<Contact>();
        isshow =false;
        lstSelectOption = new List<selectoption>();
        ShowAccountRecord();
        isactive = true;
        
        
    }
    
// This method will return list of selectoption and will be bind in VF page in select list
   /* public List<selectoption> getlstAccount(){        
        List<selectoption> lstSelectOption= new List<selectoption>();
        lstSelectOption.add(new selectOption('None','-None-'));        // adding first value in list as None
        for(Account acc : [select Id,Name from Account]){
            lstSelectOption.add(new selectoption(acc.Id,acc.name));
        }
        return lstSelectOption;                
    }*/
    
  public void ShowAccountRecord()
  {
   
      lstSelectOption.add(new selectOption('None','-None-')); 
      
      for(Account acc : [select Id,Name from Account]){
            lstSelectOption.add(new selectoption(acc.Id,acc.name));
        }
      
      
  } 
  
  
//This method is calling from actionsupport action in VF page
    public void AllContact(){
    
         system.debug('selectedAccountId3333******** '+selectedAccountId);
        lstContact  = [select Id,Name,email from Contact where AccountId=:selectedAccountId ]; 
        if(lstContact.size()>0 && lstContact!=null)
        {
          isshow = true;
          strMessage  ='';
        }
        else
        {
         isshow =false;
        strMessage ='No Record found!!!';
        }   
    }

}