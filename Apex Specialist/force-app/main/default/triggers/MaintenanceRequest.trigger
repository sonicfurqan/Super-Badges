trigger MaintenanceRequest on Case (before update, after update) {
    List<Case> newRoutines=new List<Case>();
    if(trigger.isUpdate && trigger.isAfter){
        for(Case cases:trigger.new){
            if((cases.Type =='Repair' || cases.Type =='Routine Maintenance') && cases.Status=='Closed'){
                newRoutines.add(cases);
            }
        }
        MaintenanceRequestHelper.updateWorkOrders(newRoutines);
    }
    
}