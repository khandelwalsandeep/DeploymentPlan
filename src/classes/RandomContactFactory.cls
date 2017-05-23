public with sharing class RandomContactFactory {
	public static List<Contact> generateRandomContacts(Integer noOfContacts, String lastName){
		List<Contact> returnList = new List<Contact>();
		Contact cont;
		for(Integer i=0;i<noOfContacts;i++){
			cont=new Contact(LastName=lastName, FirstName='First '+i);
			returnList.add(cont);
		}
		return returnList;
	}
}