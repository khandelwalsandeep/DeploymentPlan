public class CampaignManagementController {
    //Private Variables.
    private integer LimitSize= 3;
    private integer OffsetSize = 0;
    private integer totalRecs = 0;
    //Public Variables.
    public List<Campaign> campTemp= new List<Campaign>();
    public String selectedCamp{get;set;}
    
    public Boolean showBlock {get;set;}
    public CampaignManagementController(){
        
        showBlock = false;
    }
    
    public List<SelectOption> campaignList 
    {
        get
        {
            campTemp = [Select Id,Name from Campaign];
            
            campaignList = new List<SelectOption>();
            
            for(Campaign temp : campTemp)
            {
                campaignList.add(new SelectOption(temp.id,temp.Name));
            }
            return campaignList;
        }
        set;
    }
    public void Submit(){
         totalRecs = [select count() from Opportunity WHERE CampaignId =: selectedCamp];
         OffsetSize = 0;
         showBlock = true;
    }
    
    public List<Opportunity> getopportunityList(){
        
        system.debug('getopportunityList called');
        List<Opportunity> opp = [SELECT ID,Name,ExpectedRevenue,Amount from Opportunity WHERE CampaignId =: selectedCamp LIMIT : LimitSize OFFSET :OffsetSize];
        return opp;
    
    } 
    
    public void firstPage(){
        OffsetSize = 0;
    }
    
    public void lastPage(){
        OffsetSize = totalrecs - math.mod(totalRecs,LimitSize);
    }
    
    public boolean getprev(){
        if(OffsetSize == 0)
            return true;
        else
            return false;
    }
    public boolean getnxt(){
        if((OffsetSize + LimitSize) > totalRecs)
            return true;
        else
            return false;
    }
    
    public void previous(){
        OffsetSize = OffsetSize - LimitSize;
    }
        
    public void next(){
        OffsetSize = OffsetSize + LimitSize;
    }     
}