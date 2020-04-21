global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {

    
    global Integer recordsProcessed = 0;

    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT ID,Rating, LeadSource FROM Lead Where Country ='USA']);
    }

    
    global void execute(Database.BatchableContext bc, List<Lead> scope) {
       List<lead> Leads = new List<lead>();
       
        for (Lead lead : scope) {
            lead.LeadSource = 'Web';
            lead.Rating = 'Hot';
             Leads.add(lead);
            recordsProcessed = recordsProcessed + 1;
           
        }
        update Leads;
    }

    
    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Shazam!');
    }
}