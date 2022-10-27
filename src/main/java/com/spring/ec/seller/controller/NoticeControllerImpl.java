package com.spring.ec.seller.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ec.seller.service.NoticeService;
import com.spring.ec.user.vo.NoticeVO;


@Controller("sellerNoticeController")
public class NoticeControllerImpl implements NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeControllerImpl.class);
	
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private NoticeVO noticeVO;
	
	@Override
	@RequestMapping(value = "/seller/notice", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView s_listNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		int boardCount = noticeService.s_noticeCount();
		System.out.println("글숫자" + boardCount);
		int displayNum = 10;
		int page = 0;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}
		int endPage = (int) (Math.ceil(page / (double) displayNum) * displayNum);
		int tempEndPage = (int) (Math.ceil(boardCount / (double) displayNum));
		int startPage = (endPage - displayNum) + 1;
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		boolean prev = startPage == 1 ? false : true;
		boolean next = endPage * displayNum >= boardCount ? false : true;

		Map paging = new HashMap();
		paging.put("boardCount", boardCount);
		paging.put("displayNum", displayNum);
		paging.put("startPage", startPage);
		paging.put("nowPage", page);
		paging.put("endPage", endPage);
		paging.put("prev", prev);
		paging.put("next", next);
		System.out.println("시작페이지" + startPage);
		System.out.println("종료" + endPage);
		List noticeList = noticeService.s_noticeBoards(page);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("paging", paging);
		mav.addObject("noticeList", noticeList);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/seller/notice/view", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView s_viewNotice(@RequestParam("list_num") int list_num, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		noticeService.s_addNoticeHits(list_num);
		NoticeVO notice = noticeService.s_viewNotice(list_num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("notice", notice);
		return mav;
	}
}
