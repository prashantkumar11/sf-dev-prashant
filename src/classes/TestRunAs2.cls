@isTest
private class TestRunAs2 {

   public static testMethod void test2() { 

      Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
      User u2 = new User(Alias = 'newUser', Email='newuser@testorg.com', 
         EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
         LocaleSidKey='en_US', ProfileId = p.Id, 
         TimeZoneSidKey='America/Los_Angeles', UserName='newuser@testorg.com');

      System.runAs(u2) {
         // The following code runs as user u2. 
         System.debug('Current User: ' + UserInfo.getUserName());
         System.debug('Current Profile: ' + UserInfo.getProfileId()); 

         // The following code runs as user u3. 
         User u3 = [SELECT Id FROM User WHERE UserName='hitmprashant@gmail.com'];
         System.runAs(u3) {
            System.debug('Current User: ' + UserInfo.getUserName());
            System.debug('Current Profile: ' + UserInfo.getProfileId()); 
         }

         // Any additional code here would run as user u2.
      }
   }
}