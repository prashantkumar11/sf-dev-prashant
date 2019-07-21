public with sharing class ContactMultipleSearchWithPagenationCLS {
    public Contact con{get;set;}
    public List<Contact> ContactList {get;set;}
    // create a list of strings to hold the conditions
    List<string> conditions = new List<string>();
    private integer totalRecs = 0;
    private integer OffsetSize = 0;
    private integer LimitSize= 10;

    public ContactMultipleSearchWithPagenationCLS(){
    system.debug('==>ContactMultipleSearchWithPagenationCLS  is calling==>');
     con = new Contact();
     //ContactList  = new List<Contact>();
    }

    public void searchcon(){
        totalRecs = 0;
        OffsetSize = 0;
        if(ContactList !=null && ContactList.size()>0){
            ContactList=null;
        }
        
        searchContacts ();
        conditions.clear();
    }


    public Void searchContacts(){

        System.debug('Total Records is ==>'+totalRecs);
        System.debug('OffsetSize is ==>'+OffsetSize);

        if(ContactList != null && !ContactList.isEmpty()){
          ContactList.clear();
        }
         String strQuery ='SELECT Id,Name,LastName,MobilePhone,Email From Contact';
         


        if(con.LastName !=null && con.LastName !=''){
            conditions.add('LastName Like \'%' +con.LastName +'%\' ');
        }
        
        if(con.MobilePhone !=null && con.MobilePhone !=''){
            conditions.add('MobilePhone Like\'%' +con.MobilePhone +'%\' ');
        }

        if (conditions.size() > 0) {
            strQuery += '  WHERE ' + conditions[0];
            for (Integer i = 1; i < conditions.size(); i++)
                    strQuery += '  AND ' + conditions[i];
        }
        
        if(totalRecs !=null && totalRecs ==0){
            List<Contact> conTemp = Database.query(strQuery);
            totalRecs = (conTemp !=null &&conTemp.size()>0)?conTemp.size():0;
        }

        system.debug('strQuery ==>'+strQuery );
        // add sort and limits at the end  
        strQuery += ' ORDER BY Name  ASC, CreatedDate DESC LIMIT :LimitSize OFFSET :OffsetSize';

        ContactList  =Database.query(strQuery);
          
           

          //conditions.clear();
          //return ContactList.size();
    }

    public void FirstPage()
    {
        OffsetSize = 0;
        searchContacts();
    }
    public void previous()
    {
        OffsetSize = (OffsetSize-LimitSize);
        searchContacts();
    }
    public void next()
    {
        OffsetSize = OffsetSize + LimitSize;
        searchContacts();
    }
    public void LastPage()
    {
        OffsetSize = totalrecs - math.mod(totalRecs,LimitSize);
        searchContacts();
    }
    public boolean getprev()
    {

        if(OffsetSize == 0){

            return true;
        }
        else {

            return false;
        }
    }
    public boolean getnxt()
    {
        if((OffsetSize + LimitSize) > totalRecs){

            return true;
        }
        else {

            return false;
        }
    }


}