@isTest
public class Animal_Test {
    @isTest static void test1(){
        HttpResponse responseGet = AnimalsCallouts.makeGetCallout(); 
        HttpResponse responsePut = AnimalsCallouts.makePostCallout(); 
    }
}