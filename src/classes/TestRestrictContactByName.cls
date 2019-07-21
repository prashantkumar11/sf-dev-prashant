// Testing trigger exception
@IsTest
public class TestRestrictContactByName {
    static testmethod void test1() {
        try {
            Contact c = new Contact(lastname = 'INVALIDNAME ');
            insert c;        
        } catch (Exception e) {
            Boolean expectedExceptionThrown =  e.getMessage().contains('The Last Name "'+ 'INVALIDNAME' +'" is not allowed for DML') ? true : false;
            System.assertEquals(true, expectedExceptionThrown);
        }
        Contact c = new Contact(lastname = 'VALIDNAME ');
        insert c;
    }
}