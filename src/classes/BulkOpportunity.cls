global class BulkOpportunity implements Database.Batchable<sObject> {

    global Integer recordsProcessed = 0;
    Account acc;
    Id accId;
    global BulkOpportunity(Id accId){
        this.accId = accId;
    }
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        
        return Database.getQueryLocator('SELECT ID FROM Account where SystemModStamp = TODAY');
    }

    global void execute(Database.BatchableContext bc, List<Account> records){
        // process each batch of records
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc : records){
	        for(Integer i=1; i<=1000; i++){
	            oppList.add(new Opportunity(Name='Child Opp '+i, CloseDate=date.today(), StageName='Prospecting', AccountId=acc.Id));
	            recordsProcessed += 1;
	        }
        }
        insert oppList;
    }    

    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        System.debug(recordsProcessed + ' records processed. Shazam!');
    }    

}