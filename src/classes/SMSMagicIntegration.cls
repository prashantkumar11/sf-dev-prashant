public class SMSMagicIntegration {




  public static void sendRequest(){
  
     
     String apiKey = 'cc6c4ea6fee139b1b6d461a1291262cf';
     String accountId = '80013069';
     String userName = 'hitmprashant@gmail.com';
     String password = '9560682173';
     String mobileNumber = '9560682173';
     Blob targetBlob = Blob.valueOf(userName + password + accountId + 'SMSMAG' + mobileNumber + 'test message prashant' );
     Blob hash = Crypto.generateDigest('MD5', targetBlob);
     //String hsh = hash.toString();
     String haskKey  = EncodingUtil.base64Encode(hash );
     System.debug('HASH KEY ==== ' + haskKey  );
     String url = 'https://sms-magic.in/smapi/get?userid=hitmprashant@gmail.com&accountid=80013069&to=919560682173&senderid=SMSMAG&hashkey=haskKey&msg=Welcome+to+Screenmagic';
     //String portfolio= JSON.serialize(new sObject();
     HttpRequest req = new HttpRequest();
     req.setMethod('GET');
     req.setEndPoint(url);
     //req.setBody(portfolio);
     Http http = new Http();
     HttpResponse response = http.send(req);
     
     if(response.getStatus() == 'OK' && response.getStatusCode() == 200) {
        
     
     }
     
    
  
  }
  
  
  
  public class Wrapper {
    public String Id {get;set;}
    public String firstName {get;set;}
    public String template {get;set;}
    
  
  
  }




}