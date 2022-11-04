package com.spring.ec.seller.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ec.seller.vo.SellerVO;

public interface MemberController {
	
	
	public ModelAndView loginform(HttpServletRequest request, HttpServletResponse response) throws Exception ;
	
	public ModelAndView memberform_sdetail(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView regadmin(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity addMember(MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
	public ModelAndView login(@ModelAttribute("member") SellerVO sellerVO, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView find_id(HttpServletRequest request, HttpServletResponse response) throws Exception;
	/* public String emailCheck(HttpServletRequest request) throws Exception ; */
	public ModelAndView find_pw(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView find_id_result( HttpServletRequest request,HttpServletResponse response) throws Exception ;
	
	public ModelAndView find_pwd_result(HttpServletRequest request,HttpServletResponse response) throws Exception;
	
}