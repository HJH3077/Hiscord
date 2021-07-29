package com.ict.email;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
 
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.ict.vo.MailVO;

@Service
public class EmailServiceImpl implements EmailService{
		@Inject
	    JavaMailSender mailSender;
	 
	    @Override
	    public void sendMail(MailVO mailvo) {
	        try { 
	            // 이메일 객체 
	            MimeMessage msg = mailSender.createMimeMessage();
	 
	            // 받는 사람을 설정 (수신자, 받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
	            msg.addRecipient(RecipientType.TO, new InternetAddress(mailvo.getReceiveMail()));
	 
	            // 보내는 사람(이메일주소+이름)
	            // (발신자, 보내는 사람의 이메일 주소와 이름을 담음)
	            // 이메일 발신자
	            msg.addFrom(new InternetAddress[] { new InternetAddress(mailvo.getSenderMail(), mailvo.getSenderName()) });
	 
	            // 이메일 제목 (인코딩을 해야 한글이 깨지지 않음)
	            msg.setSubject(mailvo.getSubject(), "utf-8");
	            // 이메일 본문 (인코딩을 해야 한글이 깨지지 않음)
	            msg.setText(mailvo.getMessage(), "utf-8");
	 
	            // 이메일 보내기
	            mailSender.send(msg);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}
