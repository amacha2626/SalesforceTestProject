public class SearchWeddingController {
    public String branch{get; set;}
	String searchText;
    List<Wedding__c> results;
    
    public String getSearchText() {
        return searchText;
    }
    
    public void setSearchText(String s) {
        searchText = s;
    }
    
    public List<String> getSearchBranch() {
        List<String> searchBranch;
		searchBranch.add('Test');        
        return searchBranch;
    }

    public SearchWeddingController() {
        branch = 'Test';
    }
    
    public List<Wedding__c> getResults() {
        return results;
    }
    
    public PageReference doSearch() {
        results = (List<Wedding__c>)[FIND :searchText RETURNING Wedding__c(Name,Field1__c, Schedule__c, Quote__c )][0];
        return null;
    }
}