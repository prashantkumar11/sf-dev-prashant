public class Accounthandler {

   public list<account> lstofacc1{get;set;}

    public Accounthandler(ApexPages.StandardSetController controller) {
    
       lstofacc1= new list<account>();
       lstofacc1= [Select id ,name, fax, accountnumber from account ];

    }
    
    
    

}