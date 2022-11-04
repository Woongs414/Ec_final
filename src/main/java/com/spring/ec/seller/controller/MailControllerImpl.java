package com.spring.ec.seller.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.ec.seller.service.MailService;

@Controller("s_mailController")
public class MailControllerImpl implements MailController {
	
	@Autowired
	private MailService mailSerivce;
	
	@Override
	@RequestMapping(value = "/seller/mailCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email, HttpServletRequest request)throws Exception{
		System.out.println("이메일 인증 요청이 들어옴!");
		String seller_email = request.getParameter("email");
		System.out.println("이메일 인증 이메일 : " + seller_email);
		
		return mailSerivce.joinEmail(seller_email);
	}

}
