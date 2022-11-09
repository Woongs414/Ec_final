package com.spring.ec.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ec.admin.vo.MemberVO;
import com.spring.ec.seller.vo.SellerVO;

public interface MemberController {
	public ModelAndView loginform(HttpServletRequest request, HttpServletResponse response) throws Exception ;
	public ModelAndView login(@ModelAttribute("member") MemberVO admin, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;	
	public ModelAndView deletadmin(@RequestParam("admincheck") String params, RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
