@isTest
private class WarehouseCalloutServiceTest {

    private static final Boolean expectedReplacement = true;
    private static final String expectedName = 'Generator 1000 kW';
    private static final String expectedSku = '100003';
    private static final Integer expectedMaintenanceperiod = 365;
    private static final Integer expectedLifespan = 120;
    private static final Integer expectedCost = 5000;
    private static final Integer expectedQuantity = 5;

    @isTest static void testWarehouse() {
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock()); 
        Test.startTest();
        WarehouseCalloutService.runWarehouseEquipmentSync();
        insert new Product2(name='asdf',Warehouse_SKU__c='100004');
        Test.stopTest();
        Product2 equipment = [SELECT Id, Current_Inventory__c, Replacement_Part__c, Name, Maintenance_Cycle__c, Lifespan_Months__c, Cost__c, Warehouse_SKU__c
                              FROM Product2 WHERE Warehouse_SKU__c='100003'];
        System.assertEquals(equipment.Current_Inventory__c, expectedQuantity);                
        System.assertEquals(equipment.Replacement_Part__c, expectedReplacement);
        System.assertEquals(equipment.Name, expectedName);
        System.assertEquals(equipment.Maintenance_Cycle__c, expectedMaintenanceperiod);
        System.assertEquals(equipment.Lifespan_Months__c, expectedLifespan);
        System.assertEquals(equipment.Cost__c, expectedCost);
        System.assertEquals(equipment.Warehouse_SKU__c, expectedSku);
    }
    @isTest  
    static void testWarehouseSync() {
        String CRON_EXP = '0 0 1 * * ?';
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
        Test.startTest();
        String jobId = System.schedule('WarehouseSyncSchedule',
                                       CRON_EXP, 
                                       new WarehouseSyncSchedule());   
        CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime
                          FROM CronTrigger
                          WHERE id = :jobId];
        
        System.assertEquals(CRON_EXP, ct.CronExpression);
        System.assertEquals(0, ct.TimesTriggered);
        Test.stopTest();
    }  
         private static final String RESPONSE_BODY = '[{"_id":"55d66226726b611100aaf741","replacement":true,"quantity":5,"name":"Generator 1000 kW","maintenanceperiod":365,"lifespan":120,"cost":5000,"sku":"100003"}]';
  
    @isTest
    static void repairCase(){
        Product2 p= new Product2(
            Name='Generator',
            Replacement_Part__c=true,
            Current_Inventory__c   = 5,
            Maintenance_Cycle__c =5,
            Lifespan_Months__c =5,
            Cost__c=5,
            Warehouse_SKU__c='1001'
        );
        insert p;
        Vehicle__c Vehicle=new Vehicle__c(Name='suv');
        Case c = new Case();
        c.Type = 'Routine Maintenance';
        c.Status = 'New';
        c.Vehicle__c = Vehicle.id;
        c.Subject =  'Routine Maintenance';
        c.Date_Reported__c = Date.today();
        c.Date_Due__c = Date.today()+10;
        c.Equipment__c = p.Id;
        insert c;
        
        insert new Work_Part__c(Equipment__c=p.id,Maintenance_Request__c=c.id,Quantity__c =5);
        c.Status='Closed';
        update c;
        
    }
}