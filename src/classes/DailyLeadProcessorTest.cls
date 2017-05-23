@isTest
private class DailyLeadProcessorTest {
	
	// Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
	
    static testMethod void myUnitTest() {
    
       List<Lead> leadToInsert = new List<Lead>();
       for(Integer i=1; i<=200; i++){
       		leadToInsert.add(new Lead(LastName='Khandelwal', Company='ABC Inc'));
       }
       insert leadToInsert;
       
       Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());         
        
        Test.stopTest();
    }
}