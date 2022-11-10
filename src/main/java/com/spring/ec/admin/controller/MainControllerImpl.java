package com.spring.ec.admin.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.spring.ec.admin.service.MainService;
import com.spring.ec.seller.vo.GraphVO;


@Controller("adminController")
public class MainControllerImpl implements MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainControllerImpl.class);
	
	@Autowired
	private MainService mainService;
	
	
	@Override
	@RequestMapping(value = "/admin/main", method = {RequestMethod.POST,RequestMethod.GET} )
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(); 
		Map<String, Object> userChartList = new HashMap<String, Object>();
		Map<String, Object> sellerChartList = new HashMap<String, Object>();
		Map<String, Object> commuChartList = new HashMap<String, Object>();
		userChartList = mainService.userChartList();
		sellerChartList = mainService.sellerChartList();
		commuChartList = mainService.commuChartList();
		List<GraphVO> tempVisitList = (List<GraphVO>) userChartList.get("visitList");
		List<GraphVO> tempReservList = (List<GraphVO>) userChartList.get("reservList");
		List<GraphVO> tempReviewList = (List<GraphVO>) userChartList.get("reviewList");
		List<GraphVO> tempSignUpList = (List<GraphVO>) userChartList.get("signUpList");
		List<GraphVO> tempS_VisitList = (List<GraphVO>) sellerChartList.get("visitList");
		List<GraphVO> tempBlackList = (List<GraphVO>) sellerChartList.get("blackList");
		List<GraphVO> tempWhiteList = (List<GraphVO>) sellerChartList.get("whiteList");
		List<GraphVO> tempS_SignUpList = (List<GraphVO>) sellerChartList.get("signUpList");
		List<GraphVO> tempU_CommuList = (List<GraphVO>) commuChartList.get("u_commuList");
		List<GraphVO> tempS_CommuList = (List<GraphVO>) commuChartList.get("s_commuList");
		List<GraphVO> tempU_CommentList = (List<GraphVO>) commuChartList.get("u_commentList");
		List<GraphVO> tempS_CommentList = (List<GraphVO>) commuChartList.get("s_commentList");
		Map visitList = new HashMap();
		Map reservList = new HashMap();
		Map reviewList = new HashMap();
		Map signUpList = new HashMap();
		Map s_visitList = new HashMap();
		Map blackList = new HashMap();
		Map whiteList = new HashMap();
		Map s_signUpList = new HashMap();
		Map u_commuList = new HashMap();
		Map s_commuList = new HashMap();
		Map u_commentList = new HashMap();
		Map s_commentList = new HashMap();
		visitList = monthsList(tempVisitList);
		reservList = monthsList(tempReservList);
		reviewList = monthsList(tempReviewList);
		signUpList = monthsList(tempSignUpList);
		s_visitList = monthsList(tempS_VisitList);
		blackList = monthsList(tempBlackList);
		whiteList = monthsList(tempWhiteList);
		s_signUpList = monthsList(tempS_SignUpList);
		u_commuList = monthsList(tempU_CommuList);
		s_commuList = monthsList(tempS_CommuList);
		u_commentList = monthsList(tempU_CommentList);
		s_commentList = monthsList(tempS_CommentList);
		mav.addObject("visit", visitList);
		mav.addObject("reserv", reservList);
		mav.addObject("review", reviewList);
		mav.addObject("signUp", signUpList);
		mav.addObject("s_visit", s_visitList);
		mav.addObject("black", blackList);
		mav.addObject("white", whiteList);
		mav.addObject("s_signUp", s_signUpList);
		mav.addObject("u_commu", u_commuList);
		mav.addObject("s_commu", s_commuList);
		mav.addObject("u_comment", u_commentList);
		mav.addObject("s_comment", s_commentList);
		mav.setViewName(viewName);
		return mav;
	}
	
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
