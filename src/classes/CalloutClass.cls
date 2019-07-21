public class CalloutClass{

 @future(callout=true)
 public static void makeCallout() {
    
  HttpRequest rq = new HttpRequest();
  String endpoint = 'http://yourHost/yourService';
  rq.setEndPoint(endpoint);
  rq.setMethod('GET');
  HttpResponse  rs = new Http().send(rq);
 
 }






}