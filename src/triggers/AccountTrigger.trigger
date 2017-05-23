trigger AccountTrigger on Account (before update) {
        //Map<Id,Account> oldAccount = Trigger.oldMap();
        Schema.DescribeSObjectResult r = Account.sObjectType.getDescribe();
        Schema.DescribeFieldResult dfr = Account.Description.getDescribe();
        //Schema.DescribeFieldResult TestField = obj.Fields.getMap().get('AccountId').getDescribe();
        //Map<String, Schema.SObjectField> fieldMap = r.getDescribe().fields.getMap();
        
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType leadSchema = schemaMap.get('Account');
        Map<String, Schema.SObjectField> fieldMap = leadSchema.getDescribe().fields.getMap();
                
        
        for(Account acc : Trigger.new){
            if(acc.Type == 'Prospect'){
                for(String apiName : r.fields.getMap().keySet()){
                    if(apiName != 'Phone'){
                        if(Trigger.newMap.get(acc.Id).get(apiName) != Trigger.oldMap.get(acc.Id).get(apiName)){
                            system.debug('This field changed ' +apiName );
                            String label = fieldMap.get(apiName).getDescribe().getLabel();

                            acc.addError('This field cannot be changed '+ label);                         
                        }    
                    }
                 }
             }    
         }
}