public class Fb_Info {

  public String json_response {set; get;}
  public fbuser fbu{get;set;}  

  public void showData() {
    Http http = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndPoint('https://graph.facebook.com/v2.8/100002382602684?access_token=EAACEdEose0cBAOpO0vupiVOknXCA7a2jPjjlaHu9etBgSjGg94mpj8bAg7tEt9KyqdHFhyZBeEFFw1tiKB66s0dSdxJCJfPOQQOLJR19Jolu5SXp3WdmVO95Km9iwZBmzKJpQTvGGhLoDKdyPaqXuwFkkKZB7ODz5MuvaiUBpwfmsSvjpZCj1XDpuUIM7LIZD');
    req.setMethod('GET');
    
    HttpResponse resp = http.send(req);
    json_response = resp.getBody();
    fbu = (fbuser)JSON.deserialize(resp.getBody(), fbuser.class); 
  }

  



  public class fbuser{
    
    String id;
    String name;
    
    public fbuser(String id , String name) {
     this.id = id;
     this.name = name;
    }
  
  }





}