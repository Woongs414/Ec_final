package com.spring.ec.seller.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface NoticeController {
	public ModelAndView s_listNotice(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView s_viewNotice(@RequestParam("list_num") int list_num, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
}
