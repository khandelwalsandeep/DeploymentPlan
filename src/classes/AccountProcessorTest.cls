@isTest
private class AccountProcessorTest {

    static testMethod void myUnitTest() {
        Account acc = new Account(Name='AccountTest');
        insert acc;
        List<Contact> conList = new List<Contact>();
        for(Integer i=1 ; i<10 ; i++){
        	Contact c = new Contact(LastName = 'Sandeep '+i,AccountId = acc.Id);
        	conList.add(c);
        }
        insert conList;
        List<Id> accountId = new List<Id>();
        accountId.add(acc.Id);
        Test.startTest();
        AccountProcessor.countContacts(accountId);
        Test.stopTest();
    }
}