trigger AccountAddressTrigger on Account (before insert,before update) {
    for(Account a:Trigger.New){
        String b=a.BillingPostalCode;
        if(b!=null && a.Match_Billing_Address__c==true){
            a.ShippingPostalCode=a.BillingPostalCode;
        }
    }
        
}