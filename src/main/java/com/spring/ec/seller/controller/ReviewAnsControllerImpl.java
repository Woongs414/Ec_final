package com.spring.ec.seller.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ec.seller.service.ReviewAnsService;
import com.spring.ec.seller.vo.ReviewAnsVO;
import com.spring.ec.seller.vo.SellerVO;

@Controller("reviewAnsController")
public class ReviewAnsControllerImpl implements ReviewAnsController {
	private static final Logger logger = LoggerFactory.getLogger(MainControllerImpl.class);
	
	@Autowired
	private ReviewAnsService reAnsService;
	@Autowired
	private ReviewAnsVO reAnsVO;
	
	@Override
	@RequestMapping(value = "/seller/reviewManage", method = RequestMethod.GET)
	public ModelAndView reviewManageList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
		String seller_id = sellerVO.getSeller_id();
		Map reAns = new HashMap();
		reAns.put("seller_id", seller_id);
		String period = request.getParameter("period");
		reAns.put("period", period);
		int boardCount = reAnsService.reAnsListCount(reAns);
		System.out.println(request.getParameter("page"));
		int displayNum = 4;
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
		reAns.put("page", page);
		List reAnsList = reAnsService.reAnsAllList(reAns);
		ModelAndView mav = new ModelAndView();
		mav.addObject("reAnsList", reAnsList);
		mav.addObject("paging", paging);
		mav.setViewName(viewName);
		return mav; 
	}
	
	@Override
	@RequestMapping(value = "/seller/review/addAnswer", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewAnswer(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
		String seller_id = sellerVO.getSeller_id(); 
		String re_ans_content = request.getParameter("re_ans");
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		Map answer = new HashMap();
		answer.put("seller_id", seller_id);
		answer.put("re_ans_content", re_ans_content);
		answer.put("review_num", review_num);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int list_num = reAnsService.addNewAnswer(answer);
			message = "<script>";
			message += " alert('댓글이 추가되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/seller/reviewManage'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다.');";
			message += " location.href='" + request.getContextPath() + "/seller/reviewManage'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	@Override
	@RequestMapping(value = "/seller/review/removeAnswer", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity removeAnswer(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
		String seller_id = sellerVO.getSeller_id(); 
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		Map answer = new HashMap();
		answer.put("seller_id", seller_id);
		answer.put("review_num", review_num);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int list_num = reAnsService.removeAnswer(answer);
			message = "<script>";
			message += " alert('댓글이 삭제되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/seller/reviewManage'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('오류가 발생하였습니다.');";
			message += " location.href='" + request.getContextPath() + "/seller/reviewManage'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
}
