package com.spring.ec.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ec.admin.service.MemberService;
import com.spring.ec.admin.vo.MemberVO;

@Controller("amemberController")
public class MemberControllerImpl implements MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	
	
	@Autowired
	private MemberService memberService;
	 
	 

	// 로그인 화면 이동
	@Override
	@RequestMapping(value = "/admin/loginForm", method = RequestMethod.GET)
	public ModelAndView loginform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	//로그인
	@Override
	@RequestMapping(value = "/admin/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO admin, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO result = memberService.adminlogin(admin);
		if (result != null ) { 
			HttpSession session = request.getSession();
			session.setAttribute("adminMember", result);
			session.setAttribute("isLogOn", true);
			
			rAttr.addFlashAttribute("result", "login");
			mav.setViewName("redirect:/admin/main"); 
		} else {
			rAttr.addFlashAttribute("result", "loginFailed"); 
			mav.setViewName("redirect:/admin/loginForm"); 
		}
		return mav;
	}
	
	//로그아웃
	@Override
	@RequestMapping(value = "/admin/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("adminMember");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/admin/loginForm");
		return mav;
	}
	
	
	// 관리자 삭제
	@Override
	@RequestMapping(value = "/admin/deletadmin", method = RequestMethod.GET)
	public ModelAndView deletadmin(@RequestParam("admincheck") String params, RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		Map<String, Object> listMap = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
		
		//세션 받아옴
		MemberVO admin = (MemberVO) session.getAttribute("adminMember");

		//체크된관리자를 list로 받아옴
		String[] adminList = params.split(",");
		
		listMap.put("params", adminList);
		
		
		if (admin.getLevel() == 0) {   //권한 0 : 삭제 가능한 관리자
			int result = memberService.deladmin(listMap);
			
			rAttr.addFlashAttribute("result", "delete");
			mav.setViewName("redirect:/admin/adminlist"); 
			
		} else if (admin.getLevel() != 0) {   //권한 0 이 아닐경우 : 삭제 불가능한 관리자
			rAttr.addFlashAttribute("result", "nodelete"); 
			mav.setViewName("redirect:/admin/adminlist"); 
		}
		

		return mav;
	}
	
	

	
}
