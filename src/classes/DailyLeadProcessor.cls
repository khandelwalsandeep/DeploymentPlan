public with sharing class DailyLeadProcessor implements Schedulable{
    public void execute(SchedulableContext sc){
    	List<Lead> leadListToUpdate = new List<Lead>();
    	for(Lead leadRecord : [SELECT ID, LeadSource from Lead WHERE LeadSource='' LIMIT 200]){
    		leadRecord.LeadSource = 'Dreamforce';
    		leadListToUpdate.add(leadRecord);
    	}
    	update leadListToUpdate;
    }
}