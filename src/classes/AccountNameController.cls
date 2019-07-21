public class AccountNameController {

    public String selectedAccountName { get; set; }

   /* public String account { get; set; }
    public String selectedAccId{get;set;}
    public String selectedConId{get;set;}
    public List<SelectContact> selectContact {get;set;}*/
    
    public List<Account> acctTemp = new List<Account>();
    public String selectedAccountNm {get;set;}
    public AccountNameController()
    {
       selectedAccountNm = '';
    }
    
    public List<SelectOption> NameList
    {
        get
        {
            acctTemp = [Select act.Name, act.Id From Account act];
            
            NameList = new List<SelectOption>();
            NameList.add(new SelectOption( ' ' ,'---Select---'));

            for(Account temp : acctTemp)
            {
                NameList.add(new SelectOption(temp.Id, temp.Name));
            }
            return NameList;
        }
        set;
    }
    
   

     /*     public List<SelectOption> getAccountNames() {
                  List<SelectOption> accOptions= new List<SelectOption>();
                  accOptions.add( new SelectOption('','--Select--'));
                  for( Account acc : [select Id,name from Account ] ) {
                          accOptions.add( new SelectOption(acc.Id,acc.name));
                  }
                 return accOptions;
           }

           public List<SelectContact> getContactNames()
           {
                  System.debug('Entered ContactNames account id...........'+selectedAccId );

                    if(selectContact != null)

                        contact con = [select name from contact where accountid=:selectedAccId ];

                        return con;


           }*/
    
}