package com.spring.ec.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller("adminController")
public class MainControllerImpl implements MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainControllerImpl.class);
	
	@Override
	@RequestMapping(value = "/admin/main", method = {RequestMethod.POST,RequestMethod.GET} )
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
}
