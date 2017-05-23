@isTest
private class AccountManagerTest{
    
    @isTest static void testGetAccount(){
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://ap2.salesforce.com/services/apexrest/Accounts/'
            + recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        //System.assertEquals('Test record', thisCase.Subject);
    }
    
    // Helper method
    static Id createTestRecord() {
        // Create test record
        Account acc = new Account(Name='TestGetMethod');
        insert acc;
        Contact con = new Contact(LastName='Khandelwal',AccountId=acc.Id);
        insert con;
        Contact con1 = new Contact(LastName='Khandelwal1',AccountId=acc.Id);
        insert con1;
        
        return acc.Id;
    }          

}