trigger insertAndUpdate on Lead (before insert, before update) {

for( Lead l : trigger.new) {
  
  if(l.company != null && l.lastName !=null) {
    
    l.title = l.lastname + '-' + l.company;
  }
  
  
  if(l.email ==null || l.Email =='')
  {
    l.Email.addError('Please fill Email adress');
  }
}

}