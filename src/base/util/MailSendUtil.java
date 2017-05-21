package base.util;

import base.SystemGlobal;
import sun.misc.BASE64Encoder;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Date;
import java.util.Properties;

/**
 * 邮件工具类
 * User: liuwentao@kongzhong.com
 * Time: 12-6-26 下午3:08
 */
public class MailSendUtil {

	/**
	 * 发送快速邮件(不含附件).
	 * 使用该方法需要在项目的SystemGlobal.properties文件中配上
	 * mail.from=Eservice@koolearn.com
	 * mail.fromName=新东方
	 * mail.host=192.168.122.12
	 *
	 * @param toAddr String 接收邮件地址
	 * @param title String 邮件标题
	 * @param sendtext the sendtext
	 * @throws Exception the exception
	 */
	public static void SendMailQM( String toAddr,String title,String sendtext) throws Exception{
		SendMailDSI(toAddr, title, null, null, sendtext);
	}

	
	/**
	 * 用默认发送邮件人信息.
	 * 使用该方法需要在项目的SystemGlobal.properties文件中配上
	 * mail.from=Eservice@koolearn.com
	 * mail.fromName=新东方
	 * mail.host=192.168.122.12
	 *
	 * @param toAddr String 接收邮件地址
	 * @param title String 邮件标题
	 * @param attachPath String 邮件附件路径
	 * @param attachName String 邮件附件名
	 * @param sendText String 邮件内容
	 * @throws Exception the exception
	 */
	public static void SendMailDSI( String toAddr,String title,String attachPath,String attachName,
										String sendText) throws Exception{
		String fromAddr = SystemGlobal.getPreference("mail.from");
		String fromName = SystemGlobal.getPreference("mail.fromName");
		sendMailDS(fromAddr,fromName,toAddr,title,attachPath,attachName,sendText);
	}

	/**
	 * 用默认服务器设置发送邮件.
	 * 使用该方法需要在项目的SystemGlobal.properties文件中配上
	 * mail.host=192.168.122.12
	 *
	 * @param fromAddr String 发送邮件地址
	 * @param fromName String 发件人姓名
	 * @param toAddr String 接收邮件地址
	 * @param title String 邮件标题
	 * @param attachPath String 邮件附件路径
	 * @param attachName String 邮件附件名
	 * @param sendtext the sendtext
	 * @throws Exception the exception
	 */
	public static void sendMailDS( String fromAddr,String fromName,String toAddr,String title,String attachPath,
										String attachName,String sendtext) throws Exception{
		String host = SystemGlobal.getPreference("mail.host");
		String username = SystemGlobal.getPreference("mail.username");
		String password = SystemGlobal.getPreference("mail.password");
		sendMail(host,username,password,fromAddr,fromName,toAddr,title,attachPath,attachName,sendtext);
	}

	/**
	 * 自定义邮件服务器邮件发送.
	 *
	 * @param host String 邮件服务器（SMTP服务器名）
	 * @param username String 发送邮件用户名
	 * @param password String 发送邮件密码
	 * @param fromAddr String 发送邮件地址
	 * @param fromName String 发件人姓名
	 * @param toAddr String 接收邮件地址
	 * @param title String 邮件标题
	 * @param attachPath String 邮件附件路径
	 * @param attachName String 邮件附件名
	 * @param sendtext the sendtext
	 * @throws Exception the exception
	 */
	public static void sendMail( String host,String username,String password,String fromAddr,String fromName,
				String toAddr,String title,String attachPath,String attachName,String sendtext) throws Exception{
		Properties props = new Properties();
		//设置smtp服务器地址
		props.put("mail.smtp.host", host);
		
		if( username!=null && password!=null ){
			//设置服务器smtp需要验证
			props.put("mail.smtp.auth", "true");
		}
		
		//5秒抛出	
		props.put("mail.smtp.timeout","5000");	
		//创建新邮件
		//Session session = Session.getInstance(props, null);
		Session session = Session.getDefaultInstance(props,null);
		//session.setDebug(true);
		
		//创建过程对象
		MimeMessage message = new MimeMessage(session);
		
		if (fromName != null && !"".equals(fromName)) {
			message.setFrom(new InternetAddress(fromAddr,fromName));		
		}else {
			message.setFrom(new InternetAddress(fromAddr));
		}
		message.addRecipient(Message.RecipientType.TO,new InternetAddress(toAddr));
		//设置主题
		message.setSubject(title);
		
		//如果非附件发送，则只要简单设置内容
		if( attachPath == null || attachName == null ){
			message.setContent(sendtext,"text/html;charset=UTF-8");
		}else{
			Multipart multipart = new MimeMultipart();
			// 向multipart对象中添加邮件的各个部分内容，包括文本内容和附件
			MimeBodyPart contentPart = new MimeBodyPart();
			contentPart.setText(sendtext);//设置信件内容
			multipart.addBodyPart(contentPart);
			// 添加附件mailBody.isAffixFlag()
			BodyPart attachmentPart= new MimeBodyPart();
			DataSource source = new FileDataSource(attachPath);
			// 添加附件的内容
			attachmentPart.setDataHandler(new DataHandler(source));
	        // 添加附件的标题，通过下面的Base64编码的转换可以保证
	        // 中文附件标题名在发送时不会变成乱码		
			BASE64Encoder enc = new BASE64Encoder();
			attachmentPart.setFileName("=?UTF-8?B?"+enc.encode(attachName.getBytes())+"?=");
			multipart.addBodyPart(attachmentPart);
			message.setContent(multipart);
		}
		message.setSentDate( new Date() );
		message.saveChanges();
		if( username!=null && password!=null ){
			Transport transport = session.getTransport("smtp");
			transport.connect(host, username, password);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		}else{
			Transport.send(message, message.getAllRecipients());
		}
	}
	
	
}
