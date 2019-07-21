public class TestDemo {

public list<Teacher__c> listOfTeacher{get;set;}

public TestDemo(ApexPages.StandardController controller) {
listOfTeacher = new List<Teacher__c>();
listOfTeacher = [select id,name,salary__c,status__c from Teacher__c];
system.debug('listOfTeacher*****' + listOfTeacher);
system.debug('list size' + listOfTeacher);
}





}