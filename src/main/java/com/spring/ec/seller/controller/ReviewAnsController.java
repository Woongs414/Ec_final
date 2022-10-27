package com.spring.ec.seller.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

public interface ReviewAnsController {
	public ModelAndView reviewManageList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity addNewAnswer(HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	public ResponseEntity removeAnswer(HttpServletRequest request, HttpServletResponse response)throws Exception;
}
