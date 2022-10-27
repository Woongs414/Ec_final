package com.spring.ec.seller.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Case;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ec.seller.service.BookingService;
import com.spring.ec.seller.vo.BookingVO;
import com.spring.ec.seller.vo.SellerVO;


@Controller("sellerBookingController")
public class BookingControllerImpl implements BookingController {
	private static final Logger logger = LoggerFactory.getLogger(MainControllerImpl.class);
	@Autowired
	private BookingService bookService;
	@Autowired
	BookingVO bookingVO;
	@Autowired
	SellerVO sellerVO;
	//예약 현황 페이지 호출
	@Override
	@RequestMapping(value = "/seller/bookingStatus", method = RequestMethod.GET)
	public ModelAndView bookingStatus(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
		String seller_id = sellerVO.getSeller_id();
		List bookList = bookService.bookingAllList(seller_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("bookList", bookList);
		mav.setViewName(viewName);
		return mav; 
	}
	
	@Override
	@RequestMapping(value = "/seller/bookingSign", method = RequestMethod.GET)
	public ModelAndView bookingSign(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
		String seller_id = sellerVO.getSeller_id();
		
		int boardCount = bookService.s_bookingCount(seller_id);
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
		
		Map bookSign = new HashMap();
		bookSign.put("page", page);
		bookSign.put("seller_id", seller_id);
		String period = request.getParameter("period");
		bookSign.put("period", period);
		List bookList = bookService.bookingAllSignList(bookSign);
		ModelAndView mav = new ModelAndView();
		mav.addObject("paging", paging);
		mav.addObject("bookList", bookList);
		mav.setViewName(viewName);
		return mav; 
	}
	
	@Override
	@ResponseBody 
	@RequestMapping(value = "/seller/groupBookSignOn", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView groupBookSignOn(@RequestParam("bookCheck") String order_ids,  RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> listMap = new HashMap();
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
		String seller_id = sellerVO.getSeller_id();
		String[] signList = order_ids.split(",");
		listMap.put("order_ids", signList);
		int result = bookService.groupBookSignOn(listMap);
		if(result >= 1) { 
			rAttr.addFlashAttribute("result", "success");
			mav.setViewName("redirect:/seller/bookingSign"); 
		} else { 
			rAttr.addFlashAttribute("result", "fail");
			mav.setViewName("redirect:/error.do");
		}

		return mav; 
	}
	@Override
	@ResponseBody 
	@RequestMapping(value = "/seller/groupBookSignOff", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView groupBookSignOff(@RequestParam("bookCheck") String order_ids,  RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> listMap = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
		String seller_id = sellerVO.getSeller_id();
		String[] signList = order_ids.split(",");
		listMap.put("order_ids", signList);
		int result = bookService.groupBookSignOff(listMap);
		if(result >= 1) { 
			rAttr.addFlashAttribute("result", "success");
			mav.setViewName("redirect:/seller/bookingSign"); 
		} else { 
			rAttr.addFlashAttribute("result", "fail");
			mav.setViewName("redirect:/error.do");
		}

		return mav; 
	}
	
	@Override
	@ResponseBody 
	@RequestMapping(value = "/seller/bookingSignOn", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView bookingSignOn(@RequestParam("order_id") String order_id, RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map listMap = new HashMap();
		ModelAndView mav = new ModelAndView();
		int result = bookService.bookingSignOn(order_id);
		if(result >= 1) { 
			rAttr.addFlashAttribute("result", "success");
			mav.setViewName("redirect:/seller/bookingSign"); 
		} else { 
			rAttr.addFlashAttribute("result", "fail");
			mav.setViewName("redirect:/error.do");
		}

		return mav; 
	}
	@Override
	@ResponseBody 
	@RequestMapping(value = "/seller/bookingSignOff", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView bookingSignOff(@RequestParam("order_id") String order_id, RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map listMap = new HashMap();
		ModelAndView mav = new ModelAndView();
		int result = bookService.bookingSignOff(order_id);
		if(result >= 1) { 
			rAttr.addFlashAttribute("result", "success");
			mav.setViewName("redirect:/seller/bookingSign"); 
		} else { 
			rAttr.addFlashAttribute("result", "fail");
			mav.setViewName("redirect:/error.do");
		}

		return mav; 
	}
}
