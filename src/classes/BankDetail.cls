public with sharing class BankDetail{
    List<Bank__c> banks;
 
    public List<Bank__C> getBanks() {
        if(banks == null)
            banks = [Select  ID ,Name, City__c,Address__c, IFSC_Code__c from Bank__c ];
        return banks;
    }
}