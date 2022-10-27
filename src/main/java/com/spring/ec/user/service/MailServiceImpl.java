package com.spring.ec.user.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("mailService")
public class MailServiceImpl implements MailService {
	//servlet-context.xml에서 설정한 빈을 자동으로 주입한다.
	@Autowired
	private JavaMailSender mailSender;
	private int authNum;
//	@Autowired
//	private SimpleMailMessage preConfiguredMessage;
//	
//	
	@Override // 인증번호(난수) 생성
	public void makeRandomNum() {   
				Random random = new Random();
				int checkNum = random.nextInt(888888) + 111111;
				System.out.println("인증번호 : " + checkNum);
				authNum = checkNum;

	}
	
	@Override //이메일 보낼 양식
	public String joinEmail(String user_email) {
		makeRandomNum();
		String setFrom = "ec_test@naver.com";
		String toMail = user_email;
		String title = "비밀번호 찾기 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." +
		"<br><br>" +
				"인증번호는 " + authNum + "입니다." +
		"<br>" +
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		sendMail(setFrom,toMail,title, content );
		
		return Integer.toString(authNum);
			
		}
	
	@Override //이메일 전송 메서드
	public void sendMail(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			//메일을 보내기 위해 MimeMessageHelper 객체를 생성합니다.
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			//메일 수신 시 지정한 이름으로 표시되게 한다. 지정하지않으면 송신 이메일주소표시
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		}catch(MessagingException e) {
			e.printStackTrace();
		}
		
	}
	
	}
//	@Override
//	public void sendMail(String to, String subject, String body) {
//		MimeMessage message = mailSender.createMimeMessage();
//		try {
//			//메일을 보내기 위해 MimeMessageHelper 객체를 생성합니다.
//			MimeMessageHelper messageHelper =
//					new MimeMessageHelper(message,true,"UTF-8");
//			//메일 수신 시 지정한 이름으로 표시되게 한다. 지정하지않으면 송신 이메일주소표시
//			messageHelper.setFrom("ec_test@naver.com","양성웅");
//			messageHelper.setSubject(subject);
//			messageHelper.setTo(to);
//			messageHelper.setText(body);
//			mailSender.send(message);
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//	}
	
//	@Override
//	//servlet-context.xml에서 미리 설정한 수신주소로 메일 내용을 보낸다.
//	public void sendPreConfiguredMail(String message) {
//		SimpleMailMessage mailMessage = new SimpleMailMessage(preConfiguredMessage);
//		mailMessage.setText(message);
//		mailSender.send(mailMessage);
//	}

