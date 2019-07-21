/*
This class is using for quering Billing address and call Google Map api and find the lattitue and long from API

*/

public  class AccountGetBillingAdress {

  // toCheckFutueCall varibale is a boolean variable if it has alreday exist
    private static Boolean toCheckFutueCall = false;
   

   
    public static void populateLatandLongCode(id accountId) {
        if  (toCheckFutueCall || System.isFuture()) {
            System.debug(LoggingLevel.WARN, '***Show the Waring!!!!!!!!');
            return;
        }
        toCheckFutueCall = true;
        callBillingAdresss(accountId);
    }



   // Future Call out
    @future (callout = true)
   static private void callBillingAdresss(id accountId) {
   
        //  This is key of Geocoding API for Google Maps
        String  keyofgeoCode = 'AIzaSyA32dZ7q_a7xlz8VPsU6vxkAHIoZ4XzgVs';
       
        Account objAccountGeo = [SELECT BillingStreet, BillingCity, BillingState,  BillingCountry, BillingPostalCode, Latitude__c, Longitude__c FROM Account WHERE  id = :accountId];
       
    
      
        if  ((objAccountGeo.BillingStreet == null) || (objAccountGeo.BillingCity == null)) {
            System.debug(LoggingLevel.WARN, 'Insufficient Data to Geocode Address');
            return;
        }

        String strBillingAddres = '';
        if (objAccountGeo.BillingStreet != null)
            strBillingAddres += objAccountGeo.BillingStreet + ', ';
        if (objAccountGeo.BillingCity != null)
            strBillingAddres += objAccountGeo.BillingCity + ', ';
        if (objAccountGeo.BillingState != null)
            strBillingAddres += objAccountGeo.BillingState + ', ';
        if (objAccountGeo.BillingCountry != null)
            strBillingAddres += objAccountGeo.BillingCountry + ', ';
        if (objAccountGeo.BillingPostalCode != null)
            strBillingAddres += objAccountGeo.BillingPostalCode;

        //  encode the string so we can pass it as part of URL
        system.debug('strBillingAddres ...'+strBillingAddres);
        strBillingAddres    = EncodingUtil.urlEncode(strBillingAddres, 'UTF-8');

        //  build and make the callout to the Geocoding API
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://maps.googleapis.com/maps/api/geocode/json?address=' + strBillingAddres + '&key=' + keyofgeoCode + '&sensor=false');
        request.setMethod('GET');
        request.setTimeout(120000);
        try {
        
            HttpResponse   response = http.send(request);
            JSONParser responseParser = JSON.createParser(response.getBody());
           
            double  latitude = null;
            double  longitude = null;
            while (responseParser.nextToken() != null) {
                if ((responseParser.getCurrentToken() == JSONToken.FIELD_NAME) && (responseParser.getText() == 'location')) {
                    responseParser.nextToken();
                    while (responseParser.nextToken() != JSONToken.END_OBJECT) {

                        String locationText = responseParser.getText();

                        responseParser.nextToken();

                        if (locationText == 'lat')

                            latitude = responseParser.getDoubleValue();

                        else if (locationText == 'lng')

                            longitude = responseParser.getDoubleValue();
                    }
                }
            }
            system.debug('latitude::::::::'+latitude);
            system.debug('longitude ::::::::'+longitude);
            // Update Lat and Long on Account
            if(latitude != null) {
                      objAccountGeo.Latitude__c = String.ValueOf(latitude);
                    objAccountGeo.Longitude__c = String.ValueOf(longitude);
                    update objAccountGeo; // update account with lat and long
                }
        } catch
            (Exception e) {
            System.debug(LoggingLevel.ERROR,  'get if any error- ' + e.getMessage());
        }
    }
}