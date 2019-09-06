public with sharing class BoatSearchResults {
    
    @AuraEnabled
    public static List<Boat__c> getBoats( String boatTypeId ) {
        if (boatTypeId == null || boatTypeId == '') {
            return [ SELECT Name, Picture__c  FROM Boat__c ];            
        }
        return [ SELECT Name, Picture__c,Geolocation__Latitude__s,Geolocation__Longitude__s  FROM Boat__c WHERE BoatType__c =: boatTypeId ];
    }
    
}