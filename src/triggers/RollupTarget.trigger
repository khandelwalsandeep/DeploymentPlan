trigger RollupTarget on Value__c (after insert,after update,after delete) {
    public List<Value__c> allRecords=Trigger.new;
    
    if(Trigger.isInsert){
    for(Value__c value:Trigger.new){
        List<Programme__c> prog=[Select Id,Target__c from Programme__c where Id=:value.Programme__c];
        Programme__c program=prog.get(0);
        if(program.Target__c==null){
            program.Target__c=value.Amount__c;
        }
        else
            program.Target__c=program.Target__c+value.Amount__c;
        
        update program;
            
    	}
    }
    else if(Trigger.isDelete){
        
        for(Value__c value:Trigger.old){
        List<Programme__c> prog=[Select Id,Target__c from Programme__c where Id=:value.Programme__c];
        Programme__c program=prog.get(0);
        //List<Value__c> allValues=Trigger.new;
            program.Target__c=program.Target__c-value.Amount__c;
        
        update program;
            
    	}
    }
    else if (Trigger.isUpdate){
        Value__c[] oldVal=Trigger.old;
        List<Programme__c> progObj=[Select Id,Target__c from Programme__c where Id=:oldVal.get(0).Programme__c];
        Programme__c prog=progObj.get(0);
        prog.Target__c=prog.Target__c-oldVal.get(0).Amount__c;
        
        Value__c[] newVal=Trigger.new;
        List<Programme__c> progObj1=[Select Id,Target__c from Programme__c where Id=:newVal.get(0).Programme__c];
        Programme__c prog1=progObj1.get(0);
        prog1.Target__c=prog.Target__c+newVal.get(0).Amount__c;
        
        update prog1;
        
    }
}