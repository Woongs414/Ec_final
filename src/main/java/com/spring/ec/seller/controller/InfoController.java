package com.spring.ec.seller.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ec.seller.vo.ProductVO;

public interface InfoController {
	public ModelAndView error(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception; 
	public ModelAndView searchmenu(@RequestParam("search") String search,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deletemenu(@RequestParam("menucheck") String params,  RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ProductVO menudetail(@RequestParam("pro_num") String pro_num,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView delonemenu(@RequestParam("seller_id") String seller_id, @RequestParam("pro_num") String pro_num, RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity menumod(@ModelAttribute("menu") ProductVO menu,MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ResponseEntity menumadd(@ModelAttribute("menu") ProductVO menu,MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
}