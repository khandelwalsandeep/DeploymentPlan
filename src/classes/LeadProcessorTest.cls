@isTest
private class LeadProcessorTest {

   
    static void setup() {
        List<Lead> leads = new List<Lead>();
        
        // insert 10 accounts
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(LastName='Lead Name '+i, Company='Lead Company'+i));
        }
        insert leads;
        
    }

    static testmethod void test() {        
        setup();
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();

        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from Lead]);
    }
}