public class CountryRestIntegration {


 public static void sendRequest(){
   Http http = new Http();
   HttpRequest request = new HttpRequest();
   String countryCode = 'USA';
   request.setMethod('GET');
   //request.setEndPoint('http://services.groupkt.com/state/get/' +'{' +countryCode +'}' + '/all');
   request.setEndPoint('http://services.groupkt.com/country/get/all');
   HttpResponse response = http.send(request);
   if(response.getStatus() == 'OK' && response.getStatusCode() == 200) {
   
     System.debug('Print the list of country ========= ' + response.getBody());
   }
 
 }
 
}