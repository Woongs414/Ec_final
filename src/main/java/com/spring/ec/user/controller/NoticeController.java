package com.spring.ec.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface NoticeController {
	// 공지사항-이벤트
	public ModelAndView listNotice(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView listEvent(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView viewNotice(@RequestParam("list_num") int list_num, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView viewEvent(@RequestParam("list_num") int list_num, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
