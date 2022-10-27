package com.spring.ec.seller.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public interface BookingController {
	public ModelAndView bookingStatus(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView bookingSign(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView groupBookSignOn(@RequestParam("bookCheck") String order_ids,  RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView groupBookSignOff(@RequestParam("bookCheck") String order_ids,  RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView bookingSignOn(@RequestParam("order_id") String order_id, RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView bookingSignOff(@RequestParam("order_id") String order_id, RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception;
}
