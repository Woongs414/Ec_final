package com.spring.ec.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ec.user.service.MailService;

@Controller("mailController")
public class MailControllerImpl implements MailController {

//	private MailService mailService;
	
	@Autowired
	private MailService mailService;

	@Override
	@RequestMapping(value = "/user/mailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email, HttpServletRequest request) throws Exception {
		System.out.println("이메일 인증 요청이 들어옴!");
		String user_email = request.getParameter("email");
		System.out.println("이메일 인증 이메일 : " + user_email);
		
		return mailService.joinEmail(user_email);
		
	}
	
}

	// MimeMessage 객체를 직접 생성하여 메일을 발송하는 방법
	/*
	 * @Override
	 * 
	 * @RequestMapping(value="/sendMail.do", method = RequestMethod.GET) public void
	 * sendMailTest() throws Exception{
	 * 
	 * String subject = "test 메일"; String content = "메일 테스트 내용" +
	 * "<img src='C:/test/ec-master/src/main/webapp/resources/image/logo.png'>";
	 * String from = "ec_test@naver.com"; String to = "ec_test@naver.com";
	 * 
	 * try { MimeMessage mail = mailSender.createMimeMessage(); MimeMessageHelper
	 * mailHelper = new MimeMessageHelper(mail,true,"UTF-8"); // true는 멀티파트 메세지를
	 * 사용하겠다는 의미
	 * 
	 * 
	 * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 MimeMessageHelper mailHelper = new
	 * MimeMessageHelper(mail,"UTF-8");
	 * 
	 * 
	 * mailHelper.setFrom(from); // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서
	 * 보내는이(setFrom())반드시 필요 // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면
	 * 됩니다. //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>"); mailHelper.setTo(to);
	 * mailHelper.setSubject(subject); mailHelper.setText(content, true); // true는
	 * html을 사용하겠다는 의미입니다. // html을 사용하게되면 이미지를 첨부 할 수 있는 <img>태그를 사용 할 수 있습니다.
	 * 
	 * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
	 * 
	 * // 업로드 된 파일을 전송하기 위해선 아래내용의 클래스 import가 필요로합니다. FileSystemResource file = new
	 * FileSystemResource(new
	 * File("C:/test/ec-master/src/main/webapp/resources/image/logo.png"));
	 * mailHelper.addAttachment("logo.png", file);
	 * 
	 * mailSender.send(mail);
	 * 
	 * } catch(Exception e) { e.printStackTrace(); }
	 * 
	 * }
	 */



/*
 * @Override
 * 
 * @RequestMapping(value="/sendMail.do", method = RequestMethod.GET) public void
 * sendSimpleMail(HttpServletRequest request, HttpServletResponse
 * response)throws Exception{ request.setCharacterEncoding("utf-8");
 * response.setContentType("text/html;charset=utf-8"); PrintWriter out =
 * response.getWriter(); //mailService의 sendMail()메서드로 메일관련값(주소,제목,내용)을 전달합니다.
 * mailService.sendMail("ec_test@naver.com", "테스트 메일", "안녕하세요.보낸 메일 내용입니다.");
 * //servlet=context.xml에서 자주보냄설정한 메일주소로 xml에서 지정한내용을 보냅니다.
 * mailService.sendPreConfiguredMail("테스트 메일입니다."); out.print("메일을 보냈습니다."); }
 * 
 * }
 */
