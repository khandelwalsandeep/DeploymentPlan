trigger checkAttachment on Programme__c (after insert, after update) {
    //Programme__c[] prog=Trigger.New;
    for(Programme__c prog:Trigger.New){
    	List<Attachment> att=[Select ID from Attachment where ParentID=:prog.Id];
    	if((att.size()==0 || att.size()==null) && prog.Project_Phase__c=='Operate'){
        	prog.addError('NO Attachments');
    	}
    }
        
}