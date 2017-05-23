public class ContactSearch{
    public static List<Contact> searchForContacts(String lName,String postalCode){
        Contact[] contactArray=[Select Id,Name from Contact where (Lastname=:lName AND MailingPostalCode=:postalCode)];
        List<Contact> contactlist=new List<Contact>();
        for(Integer i=0;i<contactArray.size();i++){
            contactList.add(contactArray[i]);
        }
            return contactList;
    }
}