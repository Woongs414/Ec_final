package com.spring.ec.kakao.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ec.kakao.service.KakaoService;
import com.spring.ec.user.vo.MemberVO;

@Controller("kakaoController")
public class KakaoControllerImpl implements KakaoController {

	
	@Autowired
	private KakaoService kakaoService;
	
	@Autowired
	private HttpSession session;

	@Override
	@RequestMapping(value="/kakaoLogin", method = RequestMethod.GET) //localhost:8080/ec/kakao 濡� �샇異쒗빐�빞�맂�떎.
	//吏곸젒�샇異쒗븯硫� 移댁뭅�삤濡쒓렇�씤api�뿉�꽌 �젙蹂� 紐삳컺�븘�삤湲곕븣臾몄뿉 臾댁쓽誘명븯�떎.
    public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model, RedirectAttributes rAttr) throws Exception{
		 System.out.println("#########" + code);
		 String access_Token = kakaoService.getAccessToken(code);
		 
		 //userInfo�쓽 ���엯�쓣 kakaoVO濡� 蹂�寃� 諛� import
		 MemberVO userInfo = kakaoService.getUserInfo(access_Token);
//		 KakaoVO number = kakaoService.kakaoNumber(userInfo);
		 System.out.println("userInfo :"+userInfo);
		 if(userInfo != null) {
		 session.invalidate();
		 session.setAttribute("kakaoLogin",true); //카카오 로그인 세션유지
		 session.setAttribute("member", userInfo); //카카오 로그인 정보받아온거유지
		 
		  model.addAttribute("user_id",userInfo.getUser_id());
	      model.addAttribute("user_name",userInfo.getUser_name());  
	      model.addAttribute("user_email",userInfo.getUser_email()); 
		 return "/main";
		 } else {
			 rAttr.addFlashAttribute("k_result", "loginFailed");
			 return "/loginForm";
		 }
			/*
			 * session.setAttribute("user_name", userInfo.getUser_name());
			 * session.setAttribute("user_email", userInfo.getUser_email());
			 */

	       
//	        System.out.println("###access_Token#### : " + access_Token);
//	        System.out.println("###email#### : " + userInfo.get("email"));
//	        System.out.println("###nickname#### : " + userInfo.get("nickname"));
//	        System.out.println("###profile_image#### : " + userInfo.get("profile_image"));
		 
//	      model.addAttribute("birth_mm",userInfo.getBirth_mm());
//	      model.addAttribute("birth_dd",userInfo.getBirth_dd());
//	      model.addAttribute("gender", userInfo.getGender());
	        /* "/main"�쑝濡� �빐�빞�븿 */
    }
	
	@Override
	@RequestMapping(value = "/kakao/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("kakaoLogin");
		session.removeAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}
}
