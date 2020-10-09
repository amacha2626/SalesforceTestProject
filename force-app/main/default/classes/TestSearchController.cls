public class TestSearchController {
  public List<Wedding__c> results {get;set;} 
  public Wedding__c weddings {get;set;} 
    
    public Wedding__c GetWeddings(){
        return weddings;
    }

  public TestSearchController (){
     this.results = new List<Wedding__c>();
     this.weddings = new Wedding__c();
  }
    
  public void search(){
      String weddingSql = this.getWhere();
      String soql = 
          'SELECT Id,Name,Field1__c,Schedule__c FROM Wedding__c ' + weddingSql;
            this.results = database.query(soql);
  }
  private String getWhere() {
     List<String> param = new List<String>();
     if (this.weddings.Name != null) {
         param.add('Name LIKE \'%' + this.weddings.Name + '%\'');
     }
     if (this.weddings.Field1__c != null) {
         param.add('Field1__c = \'' + this.weddings.Field1__c + '\'');
     }
     if (this.weddings.Schedule__c != null) {
         param.add('Schedule__c > ' + String.valueOf(this.weddings.Schedule__c) + ' AND ' + 'Schedule__c < ' + String.valueOf(this.weddings.Schedule__c+30) );
     }
     if (param.isEmpty()) {
         return '';
     }
     return 'WHERE ' + String.join(param, ' AND ');
    }
}