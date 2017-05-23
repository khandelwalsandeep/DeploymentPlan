public class LockTest {
    public static void runTest(){
    List<Opportunity> accts = [SELECT Id from Opportunity WHERE Name Like 'TestLock'];
// Lock the accounts
system.debug('Opp SIze-- >'+accts.size());
Approval.LockResult[] lrList = Approval.lock(accts, true);

// Iterate through each returned result

}
}