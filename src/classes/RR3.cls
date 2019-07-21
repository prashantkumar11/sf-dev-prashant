/*****************************************
************** Created By Prashant *******
*/
@RestResource(urlMapping='/RR3/Account/*')
global class RR3 {


 @HttpGet
 global static myDataType doGet () {
   RestRequest req = RestContext.request;
   RestResponse res = RestContext.response;
   myDataType response = new myDataType ();
   
   String s = req.requestURI.subString(req.requestURI.lastIndexOf('/')+1);
   
   if(checkURI(s)) {
     searchAccount( req  ,res , response ); 
   } else {
     findAccount(res ,response ,s);
   }
   
   return response;
 }
 
 
 private static boolean checkURI(String s) {
   if(s == 'Account') {
    return true;
   }
   return false;
 }
 
 private static void searchAccount( RestRequest req, RestResponse res, myDataType response) {
 //Method for searching account by Account Name
 
 String param_value = req.params.get('Name');
 
  if(param_value == null || param_value =='') {
    response.message = 'Please provide a Name for search' ;
  } else {
  
     String searchText = '%'+param_value+'%';
     List<Account> searchResult = [Select Name, Type , Industry , Phone  from Account Where Name like :searchText];
     
     if(searchResult != null && searchResult.size() > 0) {
      response.acctList = searchResult;
      response.message = searchResult.size() + 'Account found';
     } else {
      response.message = 'No Account record found with this name';
     }
  }
 
 }
 
 private static void findAccount(RestResponse res, myDataType response,  String s) {
 //Method for finding account by account id
  if( s != null && s !='') {
   List<Account> findResults = [Select Name, Type , Industry , Phone  from Account Where ID= :s]; 
   if(findResults != null && findResults.size() > 0) {
        response.acctList.add(findResults[0]);
        response.message = 'Account found' ;

   } else {
   
           response.message = 'No Account found, Please provide a valid ID' ;

   }
  } else {
                   response.message = 'You must supply an Account ID'; 

  }
 }
 
 
 
 
 global class myDataType {
    public List<Account> acctList;
    public String message;
    
    public myDataType() {
      acctList = new List<Account>();
    }
 
 }








}