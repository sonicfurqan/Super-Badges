public class MaintenanceRequestHelper {
    
    public static void updateWorkOrders(List<Case> cases){
        list<case> insertCaseList = new list<case>();
        Map<Id,case> maintenanceCycle = new Map<Id,case>([SELECT Id,Equipment__r.Maintenance_Cycle__c FROM Case WHERE ID IN:cases]);
        for(case c:cases){
            Case newCase = new Case();
            newCase.Type = 'Routine Maintenance';
            newCase.Status = 'New';
            newCase.Vehicle__c = c.Vehicle__c;
            newCase.Subject =  c.Subject;
            newCase.Date_Reported__c = Date.today();
            newCase.Date_Due__c = Date.today()+Integer.valueOf(maintenanceCycle.get(c.Id).Equipment__r.Maintenance_Cycle__c);
            newCase.Equipment__c = c.Equipment__c;
            insertCaseList.add(newCase);
        }
        insert insertCaseList;
    }        
    
}