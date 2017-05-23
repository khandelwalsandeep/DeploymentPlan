public class MasterChild{
    public List<Master__c> masterList {get;set;}
    public List<Child__c> childList {get;set;}
    
    public MasterChild(){
        masterList = new List<Master__c>();
        masterList = [SELECT ID,Name,Master_Number__c from Master__c];
        
    }
    
    public void displayChild(){
        String masterId= ApexPages.currentPage().getParameters().get('childDisp');
        childList = new List<Child__c>();
        childList = [SELECT ID,Name from Child__c WHERE Master__r.Id =: masterId];
    }
}