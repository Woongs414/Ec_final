package com.spring.ec.seller.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ec.seller.service.MemberService;
import com.spring.ec.seller.vo.SellerVO;

@Controller("sellerController")
public class MemberControllerImpl implements MemberController {
	@Autowired
	private MemberService memService;
	@Autowired
	SellerVO sellerVO;
	// �뙋留ㅼ옄 硫붿씤

	@Override
	@RequestMapping(value = "/seller/member/loginForm.do", method = RequestMethod.GET)
	public ModelAndView loginform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/seller/member/s_regadmin.do", method = RequestMethod.GET)
	public ModelAndView regadmin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// String viewName = getViewName(request); interceptor�씠�슜�븯湲곗뿉 �븘�옒 getviewName二쇱꽍泥섎━
		String viewName = (String) request.getAttribute("viewName"); /* intercepotor getviewName硫붿꽌�뱶�씠�슜 */
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav; /* ModelAndView媛앹껜 �씠�슜�븯�뿬 媛믪쓣 �쟾�떖 */
	}
	
	@Override
	@RequestMapping(value = "/seller/member/memberForm_sdetail.do", method = RequestMethod.GET)
	public ModelAndView memberform_sdetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;

	}
	
	@Override
	@RequestMapping(value = "/seller/addMember.do", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") SellerVO sellerVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text;charset=utf-8");
		int result = 0;
		sellerVO.setKeyword(request.getParameter("keyword"));
		result = memService.addMember(sellerVO);
		ModelAndView mav = new ModelAndView("redirect:/seller/member/loginForm.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/seller/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") SellerVO sellerVO, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		sellerVO = memService.login(sellerVO);
		if (sellerVO != null) { /* DB�뿉 �엳�뒗 媛믨낵 �씪移섑븯吏��븡�쑝硫� */
			HttpSession session = request.getSession();
			session.setAttribute("sellerMember", sellerVO);
			session.setAttribute("isLogOn", true);
			String action = (String) session.getAttribute("action");
			session.removeAttribute("action");
			if (action != null) {
				mav.setViewName("redirect:" + action); /* action�룄硫붿씤 鍮꾩뼱�엳�쓬 */
			} else {
				mav.setViewName("redirect:/sellerMain"); /* 濡쒓렇�씤 �꽦怨듭떆 */
			}
		} else {
			rAttr.addFlashAttribute("result", "loginFailed"); /* login.jsp�쓽 loginFailed <choose>援щЦ �떎�뻾 */
			mav.setViewName("redirect:/seller/member/loginForm.do"); /* login.jsp redirect�븳�떎 */
		}
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/seller/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("sellerMember");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/seller/member/loginForm.do");
		return mav;
	}
	
	/*
	 * @Override
	 * 
	 * @RequestMapping(value="seller/emailCheck.do", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public String emailCheck(HttpServletRequest request) throws
	 * Exception { //param�� request.getParameter�� �룞�씪�븯怨� jsp�뿉 �엳�뒗 留ㅺ컻蹂��닔瑜� 諛쏄린�쐞�빐 �궗�슜
	 * //RequestMapping�쓣 �넻�빐 .do瑜� �샇異쒗븯怨� �샇異쒗븳 怨녹뿉�꽌 a�궎媛� �엳�쓣 寃쎌슦 //洹� 媛믪� �옄�룞�쑝濡� String user_id�뿉
	 * �떞湲곌쾶 �맂�떎. //ajax�뿉�꽌 getParameter�뒗 �궎媛믪쓣 湲곗��쑝濡� 諛쏆븘�삩�떎. String seller_email=
	 * request.getParameter("seller_email");
	 * 
	 * JSONObject obj = new JSONObject(); int cnt =
	 * memService.emailCheck(seller_email); if(cnt == 0) { obj.put("result", "YES");
	 * }else { obj.put("result", "NO"); }
	 * 
	 * return obj.toJSONString();
	 * 
	 * }
	 */
	



}