package org.lanqiao.utils;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class MailUtils {
	private static final String smtpPort = "465";
	private static final String sslSocketFactory = "javax.net.ssl.SSLSocketFactory";
	private static final String from = "1476196459@qq.com";
	private static final String password = "qsgtexlepootieii";
	private static final String sendProtocol = "smtp";
	private static final String smtpServer = "smtp.qq.com";
	public static boolean sendMail(String email, String emailMsg) {
		// 1.创建一个程序与邮件服务器会话对象 Session

		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", sendProtocol);
		props.setProperty("mail.smtp.host", smtpServer);
		props.setProperty("mail.smtp.auth", "true");// 指定验证为true
		 //ssl安全认证
        props.setProperty("mail.smtp.port", smtpPort);
        //设置socketfactory									
        props.setProperty("mail.smtp.socketFactory.class", sslSocketFactory);
        //只处理SSL,对于非SSL不做处理
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.socketFactory.port", smtpPort);
		

		Session session = Session.getInstance(props);

		// 2.创建一个Message，它相当于是邮件内容
		Message message = new MimeMessage(session);
		Transport transport = null;
		try {
			message.setFrom(new InternetAddress(from)); // 设置发送者

			message.setRecipient(RecipientType.TO, new InternetAddress(email)); // 设置发送方式与接收者

			message.setSubject("用户激活");
			//message.setText("这是一封激活邮件，请<a href='#'>点击</a>");

			message.setContent(emailMsg, "text/html;charset=utf-8");

			// 3.创建 Transport用于将邮件发送
			transport = session.getTransport();
			transport.connect(from, password);
   
		    transport.sendMessage(message, message.getAllRecipients());
			return true;
		} catch (AddressException e) {
			
			e.printStackTrace();
			return  false;
		} catch (MessagingException e) {
			
			e.printStackTrace();
			return false;
		} finally {
			if(transport != null) {
				try {
					transport.close();
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
}
