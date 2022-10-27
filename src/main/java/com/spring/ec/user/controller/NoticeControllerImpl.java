package com.spring.ec.user.controller;

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

import com.spring.ec.user.service.NoticeService;
import com.spring.ec.user.vo.NoticeVO;

@Controller("noticeController")
public class NoticeControllerImpl implements NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	private static final String U_IMAGE_REPO = "C:\\board\\u_board_imagefile";
	public static final int pagePerList = 10;
	public static final int pagingCount = 10;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	NoticeVO noticeVO;
	// 공지사항-이벤트 보드
	@Override
	@RequestMapping(value = "/user/notice", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listNotice(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		int boardCount = noticeService.noticeCount();
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
		List noticeList = noticeService.noticeBoards(page);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("paging", paging);
		mav.addObject("noticeList", noticeList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/user/event", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listEvent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		int boardCount = noticeService.eventCount();
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
		System.out.println(boardCount);
		System.out.println(displayNum);
		System.out.println(page);
		System.out.println(endPage);
		List eventList = noticeService.eventBoards(page);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("paging", paging);
		mav.addObject("eventList", eventList);
		return mav;
	}

	@Override
	@RequestMapping(value = "/user/notice/view", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView viewNotice(@RequestParam("list_num") int list_num, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		noticeService.addNoticeHits(list_num);
		NoticeVO notice = noticeService.viewNotice(list_num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("notice", notice);
		return mav;
	}

	@Override
	@RequestMapping(value = "/user/event/view", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView viewEvent(@RequestParam("list_num") int list_num, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		noticeService.addNoticeHits(list_num);
		NoticeVO notice = noticeService.viewNotice(list_num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("notice", notice);
		return mav;
	}
}
