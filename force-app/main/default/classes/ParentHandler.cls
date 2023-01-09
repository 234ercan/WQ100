public class ParentHandler {
    public static void updatePhoneAddres(List<Parent__c> pList){  
        Set<Id> pSet = new Set<Id>();
        for(Parent__c p:pList){
            pSet.add(p.Id);
        }
       
        
     	Map<Id, Parent__c> pMap = new Map<Id, Parent__c>([SELECT Id, Name, Phone__c, Email__c, Country__c, State_City__c, Address_Line_1__c FROM Parent__c WHERE Parent__c.Id IN:pSet]) ;
                                                         
        
        List<Student__c> stList = new List<Student__c>();
       		for(Student__c st:[SELECT Id, Name, Phone__c, Email__c, Country__c, State_City__c, Address_Line_1__c, student__c.parent__c FROM Student__c  WHERE student__c.parent__c In:pList]){                             
                   			 st.Phone__c=pMap.get(st.Parent__c).Phone__c; 
                             st.Email__c=pMap.get(st.Parent__c).Email__c;
                             st.Address_Line_1__c=pMap.get(st.Parent__c).Address_Line_1__c;
                             st.State_City__c=pMap.get(st.Parent__c).State_City__c;
                             st.Country__c=pMap.get(st.Parent__c).Country__c; 
                              stList.add(st); 
               
                          }
        		update stList;
    }       
}