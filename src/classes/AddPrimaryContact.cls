public with sharing class AddPrimaryContact implements Queueable{
	private Contact conObj;
	private String state;
	
	public AddPrimaryContact(Contact conObj, String state){
		this.state = state;
		this.conObj = conObj;
	}
	
	public void execute(QueueableContext context) { 
       List<Contact> insertContactList = new List<Contact>();
       Contact clonedContact;
       for(Account acc : [SELECT ID, (SELECT ID from Contacts), BillingState
       				      FROM Account 
       				      WHERE BillingState =: state
       				      LIMIT 200]){
       		clonedContact = conObj.Clone();
       		clonedContact.Account = acc;
       		insertContactList.add(clonedContact);
       }
       insert insertContactList;
       
       
    }
    
    
         
}