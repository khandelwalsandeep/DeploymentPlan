public with sharing class CreateChildOpportunitiesController {
	
	private final Account acct;
	
	public CreateChildOpportunitiesController(ApexPages.StandardController stdController){
		this.acct = (Account)stdController.getRecord();
	}
	
	public PageReference bulkOpportunity(){
		Id accId = ApexPages.currentPage().getParameters().get('id');
		BulkOpportunity bOpp = new BulkOpportunity(accId);
		Database.executeBatch(bOpp,20);
		return returnToAccount();
	}
	
	public PageReference returnToAccount(){
		PageReference pageRef = new PageReference('https://ap2.salesforce.com/001/o');
	    return pageRef;
	}
}