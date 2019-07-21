public class TestDemo3Controller {


    public list<Teacher__c> lstofTeacher{get;set;}

    public TestDemo3Controller(ApexPages.StandardController controller) {
    
        lstofTeacher = new List<Teacher__c>();
        
        lstofTeacher = [Select id ,name ,Salary__c,Status__c from Teacher__c where Salary__c>4000 ];
        
        system.debug('lstofTeacher*****'+lstofTeacher);
        system.debug('lstofTeacher*****'+lstofTeacher.size());

    }

}