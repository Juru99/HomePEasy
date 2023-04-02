package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {
	
	protected PasswordAuthentication getPasswordAuthentication() {
		
		String mail_id = "gugudndn@naver.com";
		String mail_pw = "zkskep12iop1212";
		
		return new PasswordAuthentication(mail_id, mail_pw);
		
	}

}
