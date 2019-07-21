@isTest
public class TestVisibleTest{


  @isTest static void test1() {
// Access private variable annotated with TestVisible
 String i = TestVisibleExample.name;
System.assertEquals('Prashant', i);
// Access private method annotated with TestVisible
TestVisibleExample.getVal();
// Perform some verification
}





}