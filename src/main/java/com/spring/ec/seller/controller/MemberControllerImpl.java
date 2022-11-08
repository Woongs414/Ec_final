package com.spring.ec.seller.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ec.seller.service.MemberService;
import com.spring.ec.seller.vo.SellerVO;

@Controller("sellerController")
public class MemberControllerImpl implements MemberController {
	private static final String S_IMAGE_REPO = "C:\\board\\bizReg_image_name";
	@Autowired
	private MemberService memService;
	@Autowired
	SellerVO sellerVO;
	// 로그인 화면 이동

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
	@ResponseBody
	public ResponseEntity addMember(MultipartHttpServletRequest multipartRequest, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map sdetailMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames(); //폼에 있는(input name)파라미터 값을 한꺼번에 받아온다.
		while(enu.hasMoreElements()) { // 폼에서 넘어온 파라이터값이 더 있는동안
			String name = (String)enu.nextElement(); //nextElement() 메소드를 통해 파라미터 값을 차례대로 가져와 name 변수에 저장한다.
			String value = multipartRequest.getParameter(name); //폼에서 가져온 값을 value 저장한다.
			sdetailMap.put(name, value);
		}
		
		String bizReg_image_name = upload(multipartRequest); //upload메소드를 통해서 temp폴더생성하고 이미지파일 넣어준다.
		sdetailMap.put("bizReg_image_name", bizReg_image_name);
		HttpSession session = multipartRequest.getSession();
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			
			response.setContentType("html/text;charset=utf-8");
			int result = 0;
			sdetailMap.put("keyword", request.getParameter("keyword"));
			
			result = memService.addMember(sdetailMap);
			if(bizReg_image_name !=null && bizReg_image_name.length() != 0) {
				File srcFile = new File(S_IMAGE_REPO + "\\" + "temp" + "\\" + bizReg_image_name);
				File destDir = new File(S_IMAGE_REPO + "\\" + sdetailMap.get("seller_id"));
				FileUtils.moveFileToDirectory(srcFile, destDir, true); //temp폴더에 있는 이미지파일을 seller_id폴더 만들어서 이동시켜준다.
			}			
			message = "<script>";
			message += " alert('회원가입이 완료되었습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() +"/seller/member/loginForm.do'";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(S_IMAGE_REPO + "\\" + "temp" + "\\" + bizReg_image_name);
			srcFile.delete();
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='" + multipartRequest.getContextPath() + "/error.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}	

	
	
	//이미지 한개 수정/등록
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		String bizReg_image_name = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			bizReg_image_name = mFile.getOriginalFilename();
			
			File file = new File(S_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
			if(mFile.getSize() !=0) {
				if(!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(S_IMAGE_REPO + "\\" + "temp" + "\\" + bizReg_image_name));
				}
			}
		}
		return bizReg_image_name;
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
	
	@Override
	@RequestMapping(value ="/seller/member/find_id.do", method = RequestMethod.GET)
	public ModelAndView find_id(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value ="/seller/member/find_pwd.do", method = RequestMethod.GET)
	public ModelAndView find_pw(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/seller/member/find_id_result.do", method = RequestMethod.POST)
	public ModelAndView find_id_result( HttpServletRequest request,HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		String s_name = request.getParameter("s_name");
		String seller_bizReg = request.getParameter("seller_bizReg");
		sellerVO.setS_name(s_name); //db값과 비교하기위해 sellerVO의 set메서드를 이용해 값 저장
		sellerVO.setSeller_bizReg(seller_bizReg);
		String seller_id = memService.find_id_result(sellerVO);
		if(seller_id == null) {
			mav.addObject("check",1);
			mav.setViewName(viewName);
		}else {
		mav.addObject("check",0);
		mav.addObject("seller_id", seller_id);
		/* request.removeAttribute("member"); */
		mav.setViewName(viewName);
	}
	return mav;
	}
	
	@Override
	@RequestMapping(value = "/seller/member/find_pwd_result.do", method = RequestMethod.POST)
	public ModelAndView find_pwd_result(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		String seller_id = request.getParameter("seller_id");
		String seller_bizReg = request.getParameter("seller_bizReg");
		String seller_email = request.getParameter("seller_email");
		sellerVO.setSeller_id(seller_id);
		sellerVO.setSeller_bizReg(seller_bizReg);
		sellerVO.setSeller_email(seller_email);
		String seller_pw = memService.find_pwd_result(sellerVO);
		if(seller_pw == null) {
			mav.addObject("check",1);
			mav.setViewName(viewName);
		}else {
			mav.addObject("check",0);
			mav.addObject("seller_pw", seller_pw);
			mav.setViewName(viewName);
			
		}
		
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