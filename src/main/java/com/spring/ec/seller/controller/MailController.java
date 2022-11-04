package com.spring.ec.seller.controller;

import javax.servlet.http.HttpServletRequest;

public interface MailController {
	public String mailCheckGET(String email, HttpServletRequest request)throws Exception;
}
