@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager{
    
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String accountId = request.requestURI.substringBetween('Accounts/', '/contacts');
        Account result =  [SELECT Id,Name,
                                (SELECT Id,Name FROM Contacts WHERE AccountId =: accountId)
                           FROM Account
                           WHERE Id = :accountId];
        List<Contact> con = result.Contacts;
        system.debug('Contacts associated with Account :-'+con.size());
        return result;
    }
}