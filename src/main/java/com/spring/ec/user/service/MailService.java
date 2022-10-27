package com.spring.ec.user.service;

public interface MailService {
	
	public void makeRandomNum();
	
	public void sendMail(String setFrom, String toMail, String title, String content);
	
	public String joinEmail(String email);

}
