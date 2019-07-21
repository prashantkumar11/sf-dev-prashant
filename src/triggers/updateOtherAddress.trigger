trigger updateOtherAddress on Contact (before insert, before update) {

    for(Contact objCon:trigger.new)
    {
      if(objCon.Mailingstreet != null)
      {
       objCon.Otherstreet = objCon.Mailingstreet;
      }
      
      if(objCon.MailingCity != null)
      {
       objCon.Othercity = objCon.MailingCity;
      }
      
    }

}