package com.spring.ec.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ec.user.vo.ReviewVO;

public interface CateController {
	public ModelAndView searchcategory(@RequestParam(value = "search") String search,@RequestParam(value = "kind") String kind,@RequestParam(value = "area") String area, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView category(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView storeInfo(@RequestParam(value = "seller_id") String seller_id, HttpServletRequest request,HttpServletResponse response) throws Exception;
	
	public @ResponseBody String reviewlike(@RequestParam(value = "review_num") int reviewnum, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public @ResponseBody String addwish(@RequestParam(value = "seller_id") String seller_id, @RequestParam(value = "user_id") String user_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public @ResponseBody String delwish(@RequestParam(value = "seller_id") String seller_id, @RequestParam(value = "user_id") String user_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView addreview(@ModelAttribute("review") ReviewVO review, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView reservation(@RequestParam(value = "seller_id") String seller_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView unreservCheck(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	/*
	 * public ModelAndView reservCheck(@RequestParam(value = "seller_id") String
	 * seller_id, HttpServletRequest request, HttpServletResponse response) throws
	 * Exception;
	 */
}
