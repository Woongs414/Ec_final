package com.spring.ec.seller.controller;

import java.io.File;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.ec.seller.service.InfoService;
import com.spring.ec.seller.service.SmypageService;
import com.spring.ec.seller.vo.ProductVO;
import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.seller.vo.StoreinfosumVO;


@Controller("smypageController")
public class SmypageControllerImpl implements SmypageController  {
	private static final String MENU_IMAGE_REPO="C:\\EATSEE\\menu_image";
	private static final String STORE_IMAGE_REPO="C:\\EATSEE\\store";
	private static final Logger logger = LoggerFactory.getLogger(SmypageControllerImpl.class);
	@Autowired
	private SmypageService smypageService;
	@Autowired
	private InfoService infoService;
	
	
	
	// 본인확인창
	@Override
	@RequestMapping(value = "/checkuserpage.do", method = RequestMethod.GET)
	public ModelAndView checkuserpage(@RequestParam("code") String code,HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.addObject("code", code);
		mav.setViewName(viewName);
		return mav; 
	}
	
	// 본인확인
	@Override
	@RequestMapping(value = "/checkuser.do", method = RequestMethod.POST)
	public ModelAndView checkuser(@RequestParam("seller_pw") String seller_pw, @RequestParam("code") String code,RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		Map<String, Object> listMap = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
		//session에 남아있는 sellerid를 가져와야함
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
		String seller_id = sellerVO.getSeller_id();
		
		
		listMap.put("seller_id", seller_id);
		listMap.put("seller_pw", seller_pw);
		
		int result = smypageService.checkuser(listMap);
		
		if(result == 1) { 
			if(code.equals("info")) {
				mav.setViewName("redirect:/smypage.do");
			} else if(code.equals("pwd")) {
				rAttr.addFlashAttribute("result", "pwdsuccess");
				mav.setViewName("redirect:/changepwdpage.do");
			} else {
				rAttr.addFlashAttribute("result", "pwdfail");
				mav.setViewName("redirect:/error.do");
			}
 
		} else { 
			rAttr.addFlashAttribute("result", "pwdfail");
			mav.setViewName("redirect:/checkuserpage.do?code=" + code);
		}
		return mav; 
	}
	
	
	// 정보수정창
	@Override 
	@RequestMapping(value = "/smypage.do", method = RequestMethod.GET)
	public ModelAndView smypage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		
		//session에 남아있는 sellerid를 가져와야함
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
		String seller_id = sellerVO.getSeller_id();
		
		
		//해당 가게의 찜,리뷰,예약 조회
		StoreinfosumVO infosum = infoService.selectinfosum(seller_id);
		SellerVO seller = smypageService.sellerinfo(seller_id);
		StoreinfosumVO sellerdetail = smypageService.sellerdetail(seller_id);
		
		
		//가게 소개가 등록되어있는지 확인
		//Integer storeinfonum = sellerdetail.getStoreInfo_num();
		int infostatus;
	
		
		List<String> keyword = Arrays.asList(seller.getKeyword().split(","));
		
		if(sellerdetail == null) {
			infostatus = 0;
			/*
			 * seller.setImage_fileName("no_store_img.png");
			 * seller.setStore_introduce("가게 소개를 등록해주세요.");
			 * seller.setOpenTime("영업 시간을 등록해주세요."); seller.setCloseDay("휴무일을 등록해주세요.");
			 * seller.setStore_nic("상호명을 등록해주세요.");
			 * seller.setStore_benefit("편의 시설을 등록해주세요.");
			 */
		} else {
			infostatus = 1;
		}
		
		mav.addObject("infosum", infosum);
		mav.addObject("seller", seller);
		mav.addObject("sellerinfo", sellerdetail);
		mav.addObject("infostatus", infostatus);
		mav.addObject("keyword", keyword);
		mav.setViewName(viewName);
		return mav; 
	}
	
	// 비밀번호 변경창
	@Override 
	@RequestMapping(value = "/changepwdpage.do", method = RequestMethod.GET)
	public ModelAndView changepwdpage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav; 
	}
	
	
	// change pwd
	@Override 
	@RequestMapping(value = "/changepwd.do", method = RequestMethod.POST)
	public ModelAndView changepwd(@RequestParam("seller_pw") String seller_pw,RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> listMap = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
		//session에 남아있는 sellerid를 가져와야함
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
		String seller_id = sellerVO.getSeller_id();
		
		//String seller_id = "stest001";
		listMap.put("seller_id", seller_id);
		listMap.put("seller_pw", seller_pw);
		
		int result = smypageService.changepwd(listMap);
		
		
		if(result == 1) { 
			//세션 끊어서 다시 로그인하기
			session.removeAttribute("sellerMember");
			session.removeAttribute("isLogOn");
			rAttr.addFlashAttribute("result", "pwdchagesuccess");
			mav.setViewName("redirect:/seller/member/loginForm.do");
 
		} else { 
			rAttr.addFlashAttribute("result", "pwdchangefail");
			mav.setViewName("redirect:/error.do");
		}
		
		return mav; 
	}
	
	
	// mod seller 정보수정
	@Override 
	@RequestMapping(value = "/modseller.do", method = RequestMethod.POST)
	public ModelAndView modseller(@ModelAttribute("seller") SellerVO modseller, @RequestParam("key01") String key01,@RequestParam("key02") String key02,@RequestParam("key03") String key03, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		//session에 남아있는 sellerid를 가져와야함
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
		String seller_id = sellerVO.getSeller_id();
		
		modseller.setSeller_id(seller_id);
		modseller.setKeyword(key01 + ", " + key02 + ", " + key03);
		int result = smypageService.modseller(modseller);
		
		
		if(result == 1) { 
			rAttr.addFlashAttribute("result", "modinfosuccess");
			mav.setViewName("redirect:/smypage.do");
 
		} else { 
			rAttr.addFlashAttribute("result", "modinfofail");
			mav.setViewName("redirect:/error.do");
		}
		
		return mav; 
	}
	
	
	
	
	
	
	// add addinfo 소개등록
			@Override
			@RequestMapping(value = "/addinfo.do", method = RequestMethod.POST)
			@ResponseBody
			public ResponseEntity addinfo(@ModelAttribute("sellerinfo") StoreinfosumVO addinfo,MultipartHttpServletRequest multipartRequest, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {		
				response.setContentType("text/html; charset=UTF-8");
				multipartRequest.setCharacterEncoding("utf-8");
				Map<String, Object> addinfoMap = new HashMap<String, Object>();
				Enumeration enu = multipartRequest.getParameterNames();
				while (enu.hasMoreElements()) {
					String name = (String) enu.nextElement();
					String value = multipartRequest.getParameter(name);
					addinfoMap.put(name, value);
				}
				

				String imageFileName = upload(multipartRequest);
				HttpSession session = multipartRequest.getSession();
				
				//session에 남아있는 sellerid를 가져와야함
				SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
				String seller_id = sellerVO.getSeller_id();
				
				addinfoMap.put("seller_id",seller_id);
				addinfoMap.put("image_fileName", imageFileName);
				
				
				String message;
				ResponseEntity resEnt = null;
				HttpHeaders responseHeaders = new HttpHeaders();
				responseHeaders.add("Content-Type", "text/html; charset=utf-8");
				try {
					smypageService.addinfo(addinfoMap);
					
					if(imageFileName != null && imageFileName.length() != 0) {
						File srcFile = new File(STORE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
						File destDir = new File(STORE_IMAGE_REPO + "\\" + addinfoMap.get("seller_id"));
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
						
						/*
						 * String originalFileName = (String) menuMap.get("originalFileName"); File
						 * oldFile = new File(STORE_IMAGE_REPO + "\\" + modinfo.getSeller_id()) + "\\" +
						 * originalFileName); oldFile.delete();
						 */
					}
					
					message = "<script>";
					message += " alert('업체 소개를 등록하였습니다.');";
					 
					message += " location.href='" + multipartRequest.getContextPath() +"/smypage.do'";
					message += " </script>";
					resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				} catch (Exception e) {
					File srcFile = new File(STORE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
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
	
	
	// mod modinfo 소개수정
		@Override
		@RequestMapping(value = "/modinfo.do", method = RequestMethod.POST)
		@ResponseBody
		public ResponseEntity modinfo(@ModelAttribute("sellerinfo") StoreinfosumVO modinfo,MultipartHttpServletRequest multipartRequest, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {		
			response.setContentType("text/html; charset=UTF-8");
			multipartRequest.setCharacterEncoding("utf-8");
			Map<String, Object> modinfoMap = new HashMap<String, Object>();
			Enumeration enu = multipartRequest.getParameterNames();
			while (enu.hasMoreElements()) {
				String name = (String) enu.nextElement();
				String value = multipartRequest.getParameter(name);
				modinfoMap.put(name, value);
			}
			

			String imageFileName = upload(multipartRequest);
			HttpSession session = multipartRequest.getSession();
			
			//session에 남아있는 sellerid를 가져와야함
			SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
			String seller_id = sellerVO.getSeller_id();
			
			modinfoMap.put("seller_id",seller_id);
			modinfoMap.put("image_fileName", imageFileName);
			
			
			String message;
			ResponseEntity resEnt = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			try {
				smypageService.modinfo(modinfoMap);
				
				if(imageFileName != null && imageFileName.length() != 0) {
					File srcFile = new File(STORE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
					File destDir = new File(STORE_IMAGE_REPO + "\\" + modinfoMap.get("seller_id"));
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
					
					/*
					 * String originalFileName = (String) menuMap.get("originalFileName"); File
					 * oldFile = new File(STORE_IMAGE_REPO + "\\" + modinfo.getSeller_id()) + "\\" +
					 * originalFileName); oldFile.delete();
					 */
				}
				
				message = "<script>";
				message += " alert('업체 소개를 수정하였습니다.');";
				message += " location.href='" + multipartRequest.getContextPath() +"/smypage.do'";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			} catch (Exception e) {
				File srcFile = new File(STORE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
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
				private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
					String imageFileName = null;
					Map<String, String> menuMap = new HashMap<String, String>();
					Iterator<String> fileNames = multipartRequest.getFileNames();
					while (fileNames.hasNext()) {
						String fileName = fileNames.next();
						MultipartFile mFile = multipartRequest.getFile(fileName);
						imageFileName = mFile.getOriginalFilename();
						
						File file = new File(STORE_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
						if (mFile.getSize() != 0) {
							if (!file.exists()) {
								file.getParentFile().mkdirs();
								mFile.transferTo(new File(STORE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName));  // store/temp 폴더에 이미지 들어감
							}
						}
					}
					return imageFileName;
				}

	
	
	
	

	

}