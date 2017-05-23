@isTest
private class TestRestrictContactByName{

    
    static testMethod void testContactName() {
        // TO DO: implement unit test
        Contact cont=new Contact(LastName='INVALIDNAME');
        
        try{
            insert cont;
        }
        catch(Exception e){
            Boolean expectedMessage = e.getMessage().contains('The Last Name') ? true : false;
            system.assertEquals(expectedMessage, true);
        }
        
        
        
    }
}