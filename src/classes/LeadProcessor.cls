global class LeadProcessor implements Database.Batchable<sObject> {

    global Integer recordsProcessed = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
    	return Database.getQueryLocator('SELECT ID, LeadSource from LEAD');
    }

    global void execute(Database.BatchableContext bc, List<Lead> records){
        // process each batch of records
        List<Lead> leadList = new List<Lead>();
        for(Lead l : records){
        	l.LeadSource = 'Dreamforce';
        	leadList.add(l);
        	recordsProcessed = recordsProcessed + 1;
        }
        update leadList;
    }    

    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        System.debug(recordsProcessed + ' records processed. Shazam!');
    }    

}