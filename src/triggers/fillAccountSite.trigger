trigger fillAccountSite on Account (before insert, before update) {

for(Account ac: trigger.new) {
  
  if(ac.name !=null ) {
  
    ac.site = ac.name;
  } else if(ac.name == null && ac.name!='') {
     ac.name.addError('Please fill the account name');
  }
 
}

}