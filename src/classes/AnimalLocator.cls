public class AnimalLocator {
    public static String getAnimalNameById(Integer num){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String URL = 'https://th-apex-http-callout.herokuapp.com/animals/'+num;
        request.setEndpoint(URL);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String animalName;
        if(response.getStatusCode() == 200){
			// Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
            Map<String, Object> result1 = (Map<String, Object>) results.get('animal');
            //List<Object> animals = (List<Object>) result1.get('name');
            System.debug('Received the following animals:');
 			animalName = (String) result1.get('name');
            system.debug('Animal name is'+animalName);
            /*for (Object animalObj: animals) {
                //System.debug('Animal Name ->'+animalObj.name);
                System.debug('Animal Obj ->'+animalObj);
            }*/
    
        }
        
        return animalName;
    }
}