public class TestPickListController{
    public Opportunity opp{get;set;}
    public TestPickListController(ApexPages.StandardController controller){
        opp = new Opportunity();
    }
    
    public pageReference goToPage(){
        //if(opp.Ty)
        system.debug('opp type value->'+opp.Type);
        return null;
    }
}