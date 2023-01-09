@isTest
public class StudentTriggerTest {

 @isTest
    static void reportCardTest(){
        Parent__c p = new Parent__c();
        p.Name='TestParent';
        insert p;
        
        List<Student__c> stList = new List<Student__c>();
        for(Integer i=1; i<200; i++){
            Student__c st = new Student__c();
        		st.Name = 'Test';
        		st.Parent__c = p.Id;
            	st.isActive__c = true;
            	
                stList.add(st);   
        }
        
        insert stList;
        delete stList;
    }
    
    
}