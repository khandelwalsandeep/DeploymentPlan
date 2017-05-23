@isTest
private class TestVerifyDate {
	@isTest static void testCheckDate1() {
       	Date d1=Date.today();
        
        Date d2=d1.addDays(5);
        
        Date d=VerifyDate.CheckDates(d1, d2);
        Date d3=d2;
        System.assertEquals(d3, d);
   }
   
    @isTest static void testCheckDate2() {
       	Date d1=Date.today();
        
        Date d2=d1.addDays(31);
        
        Date d=VerifyDate.CheckDates(d1, d2);
        Integer totalDays = Date.daysInMonth(d1.year(), d1.month());
		Date lastDay = Date.newInstance(d1.year(), d1.month(), totalDays);
        System.assertEquals(lastDay, d);
   }
        

}