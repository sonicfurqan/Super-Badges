@isTest
global class WarehouseCalloutServiceMock implements HttpCalloutMock {

    private static final String RESPONSE_BODY = '[{"_id":"55d66226726b611100aaf741","replacement":true,"quantity":5,"name":"Generator 1000 kW","maintenanceperiod":365,"lifespan":120,"cost":5000,"sku":"100003"},{"_id":"55d66226726b611100aaf744","replacement":true,"quantity":5,"name":"Generator 2000 kW","maintenanceperiod":365,"lifespan":120,"cost":5000,"sku":"100004"}]';
    public static final String RESPONSE_HEADER_PARAM_NAME = 'Content-Type';
    public static final String RESPONSE_HEADER_CONTENT_TYPE = 'application/json';

    global HTTPResponse respond(HTTPRequest request) {
        HttpResponse response = new HttpResponse();
        response.setHeader(RESPONSE_HEADER_PARAM_NAME, RESPONSE_HEADER_CONTENT_TYPE);
        response.setBody(RESPONSE_BODY);
        response.setStatusCode(200);
        return response; 
    }
}