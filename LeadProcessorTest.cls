@isTest
private class LeadProcessorTest {

    @TestSetup
    static void setup(){
        List<Lead> leads = new List<Lead>();

        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(LastName='Lead ' + i, Company='Company ' + i, Status='Working-connected', Country='USA'));
            }
       insert leads;
          }

    static testMethod void test() {  
        Test.startTest();
        LeadProcessor LP = new LeadProcessor();
        Id batchId = Database.executeBatch(LP);
        Test.stopTest();        
        
        System.assertEquals(200, [select count() from lead where LeadSource ='Web' AND Rating='Hot']);
    }
}