// This class is verifying the account billing address is filled or not this class called in Account 
// Trigger

public class Account_TriggerHandlerHelperClass {
 
    //Handler for after insert methods
    public void onAfterInsert(list<Account> lstofAccount) {
      UpdateLatandLogOnInsertion (lstofAccount);
     
    }
   
    //Handler for after Update methods
    public void onAfterUpdate(list<Account> lstofAccount, map<id, Account> triggerOldMap) {
        UpdateLatandLogOnUpdation (lstofAccount , triggerOldMap) ;
       
    }


    private void UpdateLatandLogOnUpdation (list<Account> lstofAccount, map<id, Account> triggerOldMap ) {

        if (lstofAccount != null && lstofAccount.size()>0 ) {
            for (Account objAcc : lstofAccount ) {
                if (!String.isBlank(objAcc.BillingStreet)
                        && !String.isBlank(objAcc.BillingCity)
                        && !String.isBlank(objAcc.BillingState)
                        && !String.isBlank(objAcc.BillingPostalCode)
                        && !String.isBlank(objAcc.BillingCountry)
                        && (objAcc.BillingStreet != triggerOldMap.get(objAcc.Id).BillingStreet || objAcc.BillingCity != triggerOldMap.get(objAcc.Id).BillingCity ||   objAcc.BillingState  != triggerOldMap.get(objAcc.Id).BillingState || objAcc.BillingPostalCode != triggerOldMap.get(objAcc.Id).BillingPostalCode ||  objAcc.BillingCountry != triggerOldMap.get(objAcc.Id).BillingCountry) ) {

                   AccountGetBillingAdress.populateLatandLongCode(objAcc.Id);
                }
            }
        }
    }
    private void UpdateLatandLogOnInsertion (list<Account> lstofAccount ) {

        if (lstofAccount !=null && lstofAccount.size()>0 ) {
            for (Account objAcc : lstofAccount ) {
                if (!String.isBlank(objAcc.BillingStreet)
                        && !String.isBlank(objAcc.BillingCity)
                        && !String.isBlank(objAcc.BillingState)
                        && !String.isBlank(objAcc.BillingPostalCode)
                        && !String.isBlank(objAcc.BillingCountry)) {

                    AccountGetBillingAdress.populateLatandLongCode(objAcc.Id);
                }
            }
        }
    }


}