trigger createContact on Account (after insert) {

  
   List<Contact> cnt = new List<Contact>();
   
   for(Account aact : trigger.new) {
      
      Contact c = new Contact();
      
      c.lastName = aact.Name;
      c.phone = aact.phone;
      c.accountId = aact.Id;
      cnt.add(c);
   }
   
   insert cnt;


}