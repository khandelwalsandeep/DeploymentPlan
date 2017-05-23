public class SObjectDesc {
    public void test(){
    Schema.DescribeSObjectResult r = Account.sObjectType.getDescribe();
    //List<String>apiNames =  new list<String>();
for(string apiName : r.fields.getMap().keySet()){
  System.debug(apiName);}
         
 }
}