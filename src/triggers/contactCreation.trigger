trigger contactCreation on Account (after insert) {

 List<Contact> lstContact = new List<Contact>();
 for(Account act : trigger.new) {
   
   Contact cnt = new Contact();
   cnt.lastName = act.Name;
   cnt.phone = act.phone;
   cnt.accountId = act.Id;
   lstContact.add(cnt);
 }
 
 insert lstContact ;

}