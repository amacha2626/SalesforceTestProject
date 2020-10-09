public class TestSearchFlowController {
    public Flow.Interview.SearchWeddingFlow searchflow {get;set;}
    public List<Wedding__c> weddings;
    public List<Wedding__c> getWeddings() {
        if(searchflow == null) {
            return null;
        }else{
        	return searchflow.Weddings;   
        }
    }
}