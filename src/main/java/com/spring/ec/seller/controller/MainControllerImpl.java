package com.spring.ec.seller.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ec.seller.service.BookingService;
import com.spring.ec.seller.service.NoticeService;
import com.spring.ec.seller.service.ReviewAnsService;
import com.spring.ec.seller.service.WishService;
import com.spring.ec.seller.vo.BookingVO;
import com.spring.ec.seller.vo.GraphVO;
import com.spring.ec.seller.vo.SellerVO;

@Controller("sellerMainController")
public class MainControllerImpl implements MainController  {
	private static final Logger logger = LoggerFactory.getLogger(MainControllerImpl.class);
	@Autowired
	private BookingService bookService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private ReviewAnsService reAnsService;
	@Autowired
	private WishService wishService;
	@Autowired
	BookingVO bookingVO;
	@Autowired
	SellerVO sellerVO;
	
	/* 메인페이지 */
	@Override
	@RequestMapping(value = "/sellerMain", method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
		String seller_id = sellerVO.getSeller_id();
		List bookList = bookService.bookingAllList(seller_id);
		int todayBooking = bookService.todayBookingCount(seller_id);
		int todayReview = reAnsService.todayReviewCount(seller_id);
		int todayWish = wishService.todayWishCount(seller_id);
		int boardCount = noticeService.s_noticeCount();
		int displayNum = 5;
		int page = 0;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 0;
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
		ModelAndView mav = new ModelAndView();
		Map monthBook = new HashMap();
		Map monthReview = new HashMap();
		Map monthWish = new HashMap();
		List noticeList = noticeService.s_mainNoticeBoards(page);
		List<GraphVO> monthsBooking = bookService.monthsBookingCount(seller_id);
		List<GraphVO> monthsReview = reAnsService.monthsReviewCount(seller_id);
		List<GraphVO> monthsWish = wishService.monthsWishCount(seller_id);
		monthBook = monthsList(monthsBooking);
		monthReview = monthsList(monthsReview);
		monthWish = monthsList(monthsWish);
		mav.addObject("paging", paging);
		mav.addObject("noticeList", noticeList);
		mav.addObject("bookList", bookList);
		mav.addObject("todayBook",todayBooking);
		mav.addObject("monthBook",monthBook);
		mav.addObject("todayReview", todayReview);
		mav.addObject("monthReview", monthReview);
		mav.addObject("todayWish", todayWish);
		mav.addObject("monthWish", monthWish);
		mav.setViewName(viewName);
		return mav; 
	}
	
	//월 그래프 계산
	private Map monthsList(List<GraphVO> monthsList) throws Exception{
		Map monthBook = new HashMap();
		for (GraphVO graph : monthsList) {
			String month = graph.getMonths();
			switch (month) {
			case "01":
				monthBook.put("jan", graph.getCount());
				break;
			case "02":
				monthBook.put("feb", graph.getCount());
				break;
			case "03":
				monthBook.put("mar", graph.getCount());
				break;
			case "04":
				monthBook.put("apr", graph.getCount());
				break;
			case "05":
				monthBook.put("may", graph.getCount());
				break;
			case "06":
				monthBook.put("jun", graph.getCount());
				break;
			case "07":
				monthBook.put("jul", graph.getCount());
				break;
			case "08":
				monthBook.put("aug", graph.getCount());
				break;
			case "09":
				monthBook.put("sep", graph.getCount());
				break;
			case "10":
				monthBook.put("oct", graph.getCount());
				break;
			case "11":
				monthBook.put("nov", graph.getCount());
				break;
			case "12":
				monthBook.put("dec", graph.getCount());
				break;
			}
		}
		return monthBook;
	}
}
