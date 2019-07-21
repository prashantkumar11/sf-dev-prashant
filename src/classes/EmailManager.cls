public class EmailManager {

    public static void sendMail(string Address,string subject, string body)
    {
    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
    string [] toaddress = new string[]{address};
    email.setToAddresses(toaddress);
    email.setSubject(subject);
    email.setPlainTextBody(body);
    Messaging.sendEmail( new Messaging.SingleEmailMessage[] { email } );
    }
}