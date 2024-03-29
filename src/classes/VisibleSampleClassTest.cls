// Test class for VisibleSampleClass
@isTest
private class VisibleSampleClassTest {

    // This test method can access private members of another class 
    // that are annotated with @TestVisible.
    static testmethod void test1() {
        VisibleSampleClass sample = new VisibleSampleClass ();

        // Access private data members and update their values
        sample.recordNumber = 100;
        sample.areaCode = '(510)';
        
        // Access private inner class
        VisibleSampleClass.Employee emp = 
            new VisibleSampleClass.Employee('Joe Smith', '555-1212');
        
        // Call private method
        String s = sample.privateMethod(emp);
        
        // Verify result
        System.assert(
            s.contains('(510)') &&
            s.contains('Joe Smith') &&
            s.contains('555-1212'));
    }
    
    // This test method can throw private exception defined in another class
    static testmethod void test2() {
        // Throw private exception.
        try {
            throw new VisibleSampleClass.MyException('Thrown from a test.');
        } catch(VisibleSampleClass.MyException e) {
            // Handle exception 
        }
    }
    
    static testmethod void test3() {
        // Access public method.
        // No @TestVisible is used.
        VisibleSampleClass sample = new VisibleSampleClass ();
        sample.publicMethod();
    }   

}