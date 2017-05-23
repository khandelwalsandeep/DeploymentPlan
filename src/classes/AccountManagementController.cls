public class AccountManagementController{
    public List<AccountWrapper> accWrapper{get;set;}
    public List<Opportunity> oppList{get;set;}
    public List<Contact> contactList{get;set;}
    public ID accountId{get;set;}
    public Boolean showOpp{get;set;}
    public Boolean showContact{get;set;}
    
    public AccountManagementController(){
        showOpp = false;
        showContact = false;
        List<Account> accList = [SELECT Id,Name,AccountNumber FROM Account];
        List<AccountWrapper> accWrapperList = new List<AccountWrapper>();
        
        for(Account acc : accList){
            Integer contactCount = [SELECT count() from Contact WHERE AccountId =: acc.Id];
            Integer oppCount = [SELECT count() from Opportunity WHERE AccountId =: acc.Id];
            AccountWrapper accObj = new AccountWrapper (acc,contactCount,oppCount);
            accWrapperList.add(accObj);
        }
        accWrapper = new List<AccountWrapper>();
        accWrapper.addAll(accWrapperList);
    }
    
    public class AccountWrapper{
        public Account account{get;set;}
        public Integer contactCount{get;set;}
        public Integer oppCount{get;set;}
        
        public AccountWrapper(Account a, Integer contactCount, Integer oppCount){
            account = a;
            this.contactCount = contactCount;
            this.oppCount = oppCount;
            
        }
    }
    
    public void contactDisplay(){
        String accountId= ApexPages.currentPage().getParameters().get('contactDisp');
        contactList= new List<Contact>();
        contactList= [SELECT ID,FirstName,LastName from Contact WHERE AccountId =: accountId];
        showOpp = false;
        showContact = true;
    }
    
    public void opportunityDisplay(){
        String accountId= ApexPages.currentPage().getParameters().get('oppDisp');
        oppList = new List<Opportunity>();
        oppList = [SELECT ID,Name,Amount from Opportunity WHERE AccountId =: accountId];
        showOpp = true;
        showContact = false;
    }
}