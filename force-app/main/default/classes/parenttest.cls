@isTest
public class parenttest {
@isTest
    static void testTrigger(){
       List<Parent__c> pList = new List<Parent__c>();
        for(Integer i=1; i<200; i++){
        	Parent__c p = new Parent__c(Name = 'Test'+i);
        	pList.add(p);       
        }
        insert pList;
        
        for(Parent__c p:pList){
        	p.Address_Line_1__c = 'test street';
        	p.State_City__c = 'test city';
        	p.Country__c = 'test country';
        	p.Phone__c = '123456';
            pList.add(p);
        }
        update pList; 
       
    }
}