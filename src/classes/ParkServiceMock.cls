@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        ParkService.byCountryResponse response_x = 
            new ParkService.byCountryResponse();
        String[] countries = new String[3]; 
        countries[0] = 'Hamburg Wadden Sea National Park';
        countries[1] = 'Hainich National Park';
        countries[2] = 'Bavarian Forest National Park';
        response_x.return_x = countries;
        // end
        response.put('response_x', response_x); 
   }
}