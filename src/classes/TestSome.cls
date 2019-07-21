@isTest
public class TestSome{

@isTest
static void getTest() {

Marker obj1, obj2;
obj1 = new Marker();
// This outputs 'Writing some text.'
obj1.write();
obj2 = new YellowMarker();
// This outputs 'Writing some text using the yellow marker.'
obj2.write();
// We get the discount method for free
// and can call it from the YellowMarker instance.
Double d = obj2.discount();

}




}