// Send a business proposal to each new Contact
trigger EmailToOwner on Opportunity (after insert, after update) {
  // Step 0: Create a master list to hold the emails we'll send
  List<Messaging.SingleEmailMessage> mails = 
  new List<Messaging.SingleEmailMessage>();
  Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
  for (Opportunity opp : Trigger.new) {
    if (opp.StageName!= null && opp.StageName== 'Closed Won' && opp.StageName!= Trigger.oldMap.get(opp.Id).StageName) {
      // Step 1: Create a new Email
      
    
      // Step 2: Set list of people who should get the email
      String toAddress =  opp.Owner.manager.email;
      String[] toAddresses = new String[] {'xyz@gmail.com'}; 
      mail.setToAddresses(toAddresses); 
     
      mail.setSubject('Enter Subject');
      String body = 'Hi ' + opp.StageName+ ', ';
      body += 'Enter Body';
      
      mail.setHtmlBody(body);
    
      
      mails.add(mail);
    }
  }
  // Step 6: Send all emails in the master list
  Messaging.sendEmail(mails);
}