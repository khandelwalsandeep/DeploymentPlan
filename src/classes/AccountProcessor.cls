global class AccountProcessor{
    @future
    public static void countContacts(List<Id> AccountIDs){
        Map<Id,Integer> contactsPerAccountMap = new Map<Id,Integer>();
        system.debug('Call Started');
        List<Account> accountList = [Select ID from Account WHERE ID IN : AccountIDs];
        List<Contact> contactList = [SELECT ID, AccountId from Contact WHERE AccountId IN : AccountIDs];
        Integer count=0;
        system.debug('Account SIze '+ accountList.size());
        system.debug('Contact Size '+ contactList.size());
        List<Account> newAccount = new List<Account>();
        for(Account acc : accountList){
            count=0;
            for(Contact con : contactList){
                if(acc.Id == con.AccountId){
                    count++;
                }
            }
            system.debug(count);
            acc.Number_of_Contacts__c=count;
            newAccount.add(acc);
        }
        update newAccount;
    }
}