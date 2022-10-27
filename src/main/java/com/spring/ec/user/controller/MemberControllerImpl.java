package com.spring.ec.user.controller;

import java.io.File;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ec.user.service.MemberService;
import com.spring.ec.user.vo.MemberVO;

@Controller("memberController")
public class MemberControllerImpl implements MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	@Autowired
	private MemberService memService;
	@Autowired
	MemberVO memberVO;

	// 메인 페이지
	@Override
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav; 
		/* interceptor의 getviewName()메서드로 인해서 viewName이 /main으로 잘리고 setAttribute한다.
		 * request.getAttribute로 받아온뒤 mav에 viewName저장하고 return mav(/main)하여서
		 * tiles_user.xml의 definition name과 동일해져서 template main_layout.jsp로 이동하고
		 * <tiles:inserAttribute name="body"에 main.jsp를 열어준다.
		 */
	}

	// 로그인
	@Override
	@RequestMapping(value = "/user/loginForm.do", method = RequestMethod.GET)
	public ModelAndView loginform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/user/memberForm_main.do", method = RequestMethod.GET)
	public ModelAndView memberform_main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;

	}

	@Override
	@RequestMapping(value = "/user/memberForm_udetail.do", method = RequestMethod.GET)
	public ModelAndView memberform_udetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName"); /* intercepotor getviewName메서드이용 */
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav; /* ModelAndView객체 이용하여 값을 전달 */
	}

	@Override
	@RequestMapping(value = "/user/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memService.login(member);
		if (memberVO != null) { /* DB에 있는 값과 일치하지않으면 */
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			String action = (String) session.getAttribute("action");
			session.removeAttribute("action");
			if (action != null) {
				mav.setViewName("redirect:" + action); /* action도메인 비어있음 */
			} else {
				mav.setViewName("redirect:/main.do"); /* 로그인 성공시 */
			}
		} else {
			rAttr.addFlashAttribute("result", "loginFailed"); /* login.jsp의 loginFailed <choose>구문 실행 */
			mav.setViewName("redirect:/user/loginForm.do"); /* login.jsp redirect한다 */
		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/user/u_regadmin.do", method = RequestMethod.GET)
	public ModelAndView regadmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/user/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/user/addMember.do", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		int result = 0;
		result = memService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/main.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/user/idCheck.do",  method = RequestMethod.POST )
	@ResponseBody
	public String idCheck(HttpServletRequest request) throws Exception {
		//param은 request.getParameter와 동일하고 jsp에 있는 매개변수를 받기위해 사용
		//RequestMapping을 통해 .do를 호출하고 호출한 곳에서 a키가 있을 경우
		//그 값은 자동으로 String user_id에 담기게 된다.
		String user_id= request.getParameter("id");
	
		JSONObject obj = new JSONObject();
		  int cnt = memService.idCheck(user_id);
		  if(cnt == 0) {
			  obj.put("result", "YES"); //DB에 아이디 미존재
		  }else {
			  obj.put("result", "NO"); //DB에 id존재
		  }
		
		  return obj.toJSONString();
	}
		  
		  @Override
		  @RequestMapping(value="/user/nickCheck.do", method = RequestMethod.POST)
		  @ResponseBody
		  public String nickCheck(HttpServletRequest request) throws Exception {
				//param은 request.getParameter와 동일하고 jsp에 있는 매개변수를 받기위해 사용
				//RequestMapping을 통해 .do를 호출하고 호출한 곳에서 a키가 있을 경우
				//그 값은 자동으로 String user_id에 담기게 된다.
			
				String user_nick= request.getParameter("nick");
			
				JSONObject obj = new JSONObject();
				  int cnt = memService.nickCheck(user_nick);
				  if(cnt == 0) {
					  obj.put("result", "YES");
				  }else {
					  obj.put("result", "NO");
				  }
				  
				  return obj.toJSONString();

	}
			 @Override
			 @RequestMapping(value="user/emailCheck.do", method = RequestMethod.POST)
			 @ResponseBody
			  public String emailCheck(HttpServletRequest request) throws Exception {
					//param은 request.getParameter와 동일하고 jsp에 있는 매개변수를 받기위해 사용
					//RequestMapping을 통해 .do를 호출하고 호출한 곳에서 a키가 있을 경우
					//그 값은 자동으로 String user_id에 담기게 된다.
				 		//ajax에서 getParameter는 키값을 기준으로 받아온다.
					String user_email= request.getParameter("user_email");
					
					JSONObject obj = new JSONObject();
					  int cnt = memService.emailCheck(user_email);
					  if(cnt == 0) {
						  obj.put("result", "YES");
					  }else {
						  obj.put("result", "NO");
					  }
				
					  return obj.toJSONString();

		}
		  
		 @Override
		 @RequestMapping(value="user/mobileCheck.do", method = RequestMethod.POST)
		 @ResponseBody
		  public String mobileCheck(HttpServletRequest request) throws Exception {
				//param은 request.getParameter와 동일하고 jsp에 있는 매개변수를 받기위해 사용
				//RequestMapping을 통해 .do를 호출하고 호출한 곳에서 a키가 있을 경우
				//그 값은 자동으로 String user_id에 담기게 된다.
				String mobile= request.getParameter("mobile");
		
				JSONObject obj = new JSONObject();
				  int cnt = memService.mobileCheck(mobile);
				  if(cnt == 0) {
					  obj.put("result", "YES");
				  }else {
					  obj.put("result", "NO");
				  }
				 
				  return obj.toJSONString();

	}

	@Override
	@RequestMapping(value = "/user/find_id.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView find_id(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*
		 * interceptor에서 gitviewname()메서드 잘라낸 도메인(viewName)을 setAttribute한걸
		 * getAttribute로받음
		 */
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/user/find_id_Result.do", method = RequestMethod.POST)
	public ModelAndView find_id_Result( HttpServletRequest request,HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		String user_name = request.getParameter("user_name");
		String tel = request.getParameter("tel");
		memberVO.setUser_name(user_name);
		memberVO.setTel(tel);
		String user_id = memService.find_id_Result(memberVO);
		if(user_id == null) {
			mav.addObject("check",1);
			mav.setViewName(viewName);
		}else {
		mav.addObject("check",0);
		mav.addObject("user_id", user_id);
		request.removeAttribute("member");
		mav.setViewName(viewName);
	}
	return mav;
	}

	@Override
	@RequestMapping(value = "/user/find_pwd.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView find_pwd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*
		 * interceptor에서 gitviewname()메서드 잘라낸 도메인(viewName)을 setAttribute한걸
		 * getAttribute로받음
		 */
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	@Override
	@RequestMapping(value = "/user/find_pwd_Result.do", method = RequestMethod.POST)
	public ModelAndView find_pwd_Result(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		String user_name = request.getParameter("user_name");
		String user_id = request.getParameter("user_id");
		String user_email = request.getParameter("user_email");
		memberVO.setUser_name(user_name);
		memberVO.setTel(user_id);
		memberVO.setUser_email(user_email);
		String user_pwd = memService.find_pwd_Result(memberVO);
		System.out.println("user_pwd : " +user_pwd);
		if(user_pwd == null) {
			
			mav.addObject("check",1);
			
			mav.setViewName(viewName);
		}else {
			mav.addObject("check",0);
			mav.addObject("user_pwd", user_pwd);
			mav.setViewName(viewName);
			
		}
		
		return mav;
	}
}