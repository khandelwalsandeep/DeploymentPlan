trigger DifferenceMonth on Programme__c (after insert,after update) {
	//List<Programme__c> newObject=Trigger.new;
    for(Programme__c newObject:Trigger.new){
        
    }
}