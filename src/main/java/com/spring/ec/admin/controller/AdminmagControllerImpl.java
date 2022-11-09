package com.spring.ec.admin.controller;

import java.util.Collection;
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

import com.spring.ec.admin.service.AdminmagService;
import com.spring.ec.admin.vo.MemberVO;

@Controller("adminmagController")
public class AdminmagControllerImpl implements MainController {
	private static final Logger logger = LoggerFactory.getLogger(AdminmagControllerImpl.class);
	@Autowired
	private AdminmagService adminmagService;
	
	
	
	@Override
	@RequestMapping(value = "/admin/adminlist", method = {RequestMethod.POST,RequestMethod.GET} )
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		Map paging = new HashMap();
		
		//s:페이징
		int adminCount = adminmagService.selectadmincount();
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		/*
		 * int endPage = (int) (Math.ceil(page / (double) displayNum) * displayNum);
		 * //현재의 페이지 번호를 기준으로 연산
		 */		
		//Endpage는 전체 게시글 수 에 영향을 많이 받아 에러가 생길 수 있음
		/*
		 * int tempEndPage = (int) (Math.ceil(adminCount / (double) displayNum)); int
		 * startPage = (endPage - displayNum) + 1; if (endPage > tempEndPage) { endPage
		 * = tempEndPage; }
		 */
		/*boolean prev = page == 1 ? false : true;
		boolean next = endPage * displayNum >= adminCount ? false : true;*/
		
		
		List<MemberVO> adminlist = adminmagService.selectadminlist(page);
		int startlistindex = adminlist.get(0).getRownum();
		int endlistindex = 0;
		//rownum 최대값 구하기
		for(int i  = 0; i < adminlist.size(); i++ ) {
			if(adminlist.get(i).getRownum() > endlistindex) {
				endlistindex = adminlist.get(i).getRownum();
				
			}
			
		}
		
		//rownum 최소값 구하기
		for(int i  = 0; i < adminlist.size(); i++ ) {
			if(adminlist.get(i).getRownum() < startlistindex) {
				startlistindex = adminlist.get(i).getRownum();
			}
		}
		
		
		
		
		paging.put("adminCount", adminCount);
		paging.put("startlistindex", startlistindex);
		paging.put("nowPage", page);
		paging.put("endlistindex", endlistindex);
		
		mav.addObject("paging", paging);
		mav.addObject("adminList", adminlist);
		mav.setViewName(viewName);
		return mav;
	}
	
	
}
 