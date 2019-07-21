public class InTheArea {
    @AuraEnabled
    public static String getLocal (String searchTerm, Decimal lat, Decimal lon) {
        String url = 'http://svcs.ebay.com/services/search/FindingService/v1'
            		+ '?OPERATION-NAME=findItemsByKeywords'
            		+ '&SERVICE-VERSION=1.0.0'
            		+ '&SECURITY-APPNAME=Himanshu-Develope-PRD-48bb074f4-6588dbe6&paginationInput.entriesPerPage=5'
            		+ '&GLOBAL-ID=EBAY-US&RESPONSE-DATA-FORMAT=JSON&callback=_cb_findItemsByKeywords&REST-PAYLOAD&keywords=harry%20potter';
        HttpRequest req = new HttpRequest();
        Http http = new Http();
        req.setMethod('GET');    
        req.setEndpoint(url);
        HTTPResponse res = http.send(req);
        return res.getBody();   
    }
}