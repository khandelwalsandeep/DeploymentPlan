trigger deleteValue on Programme__c (after update) {
    List<Account> newRecords=[Select ID from Account];
    system.debug(newRecords[0].Name);
}