@isTest
private class AddPrimaryContactTest {

    static testMethod void myUnitTest() {
        
        List<Account> insertAccount = new List<Account>();
        for(Integer i=1; i<=50; i++){
        	insertAccount.add(new Account(Name='Account '+i, BillingState='NY'));
        }
        
        for(Integer i=1; i<=50; i++){
        	insertAccount.add(new Account(Name='Account '+50+i, BillingState='CA'));
        }
        
        insert insertAccount;
        
        Contact con = new Contact(LastName = 'Dummy Contact');
        // Create our Queueable instance
        AddPrimaryContact updater = new AddPrimaryContact(con, 'CA');
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        System.enqueueJob(updater);
        Test.stopTest(); 
    }
}