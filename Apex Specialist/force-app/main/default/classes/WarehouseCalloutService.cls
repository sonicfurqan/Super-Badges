public with sharing class WarehouseCalloutService {
    
    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    // complete this method to make the callout (using @future) to the
    // REST endpoint and update equipment on hand.
    @future (callout=true)
    public static void runWarehouseEquipmentSync(){
        HttpRequest request=new HttpRequest();
        request.setEndpoint(WAREHOUSE_URL);
        request.setMethod('GET');
        HttpResponse res=new Http().send(request);
        List<WarehouseEquipment> data=(List<WarehouseEquipment>) JSON.deserialize(res.getBody(), List<WarehouseEquipment>.Class);
        List<String> skus=new List<String>();
        for(WarehouseEquipment sku:data){
            skus.add(sku.sku);
        }
        Map<String,Product2> equipments=new Map<String,Product2>();
        for(Product2 equipment:[SELECT Id, Cost__c, Current_Inventory__c, Lifespan_Months__c, 
                                Maintenance_Cycle__c, Replacement_Part__c, Warehouse_SKU__c, Name, IsActive 
                                FROM Product2 
                                WHERE Warehouse_SKU__c IN:skus])
        {
            equipments.put(equipment.Warehouse_SKU__c,equipment);
        }
        
        List<Product2> products=new List<Product2>();
        for(WarehouseEquipment equipment:data){
            if(equipments.containsKey(equipment.sku)){
                Product2 prod= equipments.get(equipment.sku);
                prod.Name=equipment.name;
                prod.Replacement_Part__c=equipment.replacement;
                prod.Current_Inventory__c   =equipment.quantity;
                prod.Maintenance_Cycle__c =equipment.maintenanceperiod;
                prod.Lifespan_Months__c =equipment.lifespan;
                prod.Cost__c=equipment.cost;
                prod.Warehouse_SKU__c=equipment.sku;
                products.add(prod);
            }
            else{
                products.add(new Product2(
                    Name=equipment.name,
                    Replacement_Part__c=equipment.replacement,
                    Current_Inventory__c   =equipment.quantity,
                    Maintenance_Cycle__c =equipment.maintenanceperiod,
                    Lifespan_Months__c =equipment.lifespan,
                    Cost__c=equipment.cost,
                    Warehouse_SKU__c=equipment.sku
                ));
            }
        }
        upsert products;
        
        
    }
    
    private class WarehouseEquipment{
        Boolean replacement{set;get;}
        Double quantity{set;get;}
        String name{set;get;}
        Double maintenanceperiod{set;get;}
        Double lifespan{set;get;}
        Double cost{set;get;}
        String sku{set;get;}
    }
    
}