trigger LockAccount on Account (after update) {
    Account lock=[SELECT ID,Name,AccountNumber from Account Where Name=:'Washington Industries'][0];
    String accountNum1='Sandeep';
    lock.AccountNumber=accountNum1;
    //lock.AccountNumber='Sandeep';
    //Contact contact1=[SELECT ID,Name from Contact WHERE Id=:lock.Contacts.Id][0];
    
    //system.debug('Contact Name'+lock.Contact.Id);
    system.debug('Account Name----->'+lock.Name);
    update lock;
}