package com.spring.ec.seller.controller;

import java.io.File;
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
import com.spring.ec.seller.vo.ProductVO;
import com.spring.ec.seller.vo.SellerVO;
import com.spring.ec.seller.vo.StoreinfosumVO;


@Controller("infoController")
public class InfoControllerImpl implements InfoController  {
	private static final String MENU_IMAGE_REPO="C:\\EATSEE\\menu_image";
	private static final Logger logger = LoggerFactory.getLogger(InfoControllerImpl.class);
	@Autowired
	private InfoService infoService;
	
	
	// 에러페이지 이동
	@Override
	@RequestMapping(value = "/error.do", method = RequestMethod.GET)
	public ModelAndView error(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav; 
	}
	
	
	// 메뉴관리
	@Override
	@RequestMapping(value = "/menumanage.do", method = RequestMethod.GET)
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		//session에 남아있는 sellerid를 가져와야함
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
		String seller_id = sellerVO.getSeller_id();
		
		//해당 가게의 찜,리뷰,예약 조회
		StoreinfosumVO infosum = infoService.selectinfosum(seller_id);
		
		//해당 가게 메뉴 리스트
		List<ProductVO> MenuList = infoService.selectMenu(seller_id);
		
		mav.addObject("infosum", infosum);
		mav.addObject("menuList", MenuList);
		mav.setViewName(viewName);
		return mav; 
	}
	
	
	
	// 메뉴관리 - 검색

	@Override
	@ResponseBody 
	@RequestMapping(value = "/searchmenu.do", method = RequestMethod.GET)
	public ModelAndView searchmenu(@RequestParam("search") String search,HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		Map<String, String> listMap = new HashMap<String, String>();
		//session에 남아있는 sellerid를 가져와야함
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
		String seller_id = sellerVO.getSeller_id();
				
		
		listMap.put("seller_id", seller_id);
		listMap.put("search", search);
		
		List<ProductVO> MenuList = infoService.selectsearchMenu(listMap);
		
		mav.addObject("menuList", MenuList);
		mav.setViewName(viewName);
		return mav; 
	}
	
	// 메뉴관리 - 리스트 삭제
	@Override
	@ResponseBody 
	@RequestMapping(value = "/deletemenu.do", method = RequestMethod.GET)
	public ModelAndView deletemenu(@RequestParam("menucheck") String params,  RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> listMap = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();
		//session에 남아있는 sellerid를 가져와야함
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
		String seller_id = sellerVO.getSeller_id();
				
		String[] memuList = params.split(",");
		
		listMap.put("seller_id", seller_id);
		listMap.put("params", memuList);
		
		int result = infoService.deletemenu(listMap);
		if(result >= 1) { 
			rAttr.addFlashAttribute("result", "deletesuccess");
			mav.setViewName("redirect:/menumanage.do"); 
		} else { 
			rAttr.addFlashAttribute("result", "deletefail");
			mav.setViewName("redirect:/error.do");
		}

		return mav; 
	}
	
	
	// 메뉴관리 - 상세보기 삭제
	@Override
	@ResponseBody 
	@RequestMapping(value = "/delonemenu.do", method = RequestMethod.POST)
	public ModelAndView delonemenu(@RequestParam("seller_id") String seller_id, @RequestParam("pro_num") String pro_num, RedirectAttributes rAttr,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> listMap = new HashMap<String, Object>();
		ModelAndView mav = new ModelAndView();

		listMap.put("seller_id", seller_id);
		listMap.put("pro_num", pro_num);
		
		int result = infoService.delonemenu(listMap);
		if(result >= 1) { 
			rAttr.addFlashAttribute("result", "deletesuccess");
			mav.setViewName("redirect:/menumanage.do"); 
		} else { 
			rAttr.addFlashAttribute("result", "deletefail");
			mav.setViewName("redirect:/error.do");
		}

		return mav; 
	}
	
	
	// 메뉴관리 - 상세페이지
	@Override
	@ResponseBody
	@RequestMapping(value = "/menudetail.do", method = RequestMethod.POST)
	public ProductVO menudetail(@RequestParam("pro_num") String pro_num,HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String viewName = (String) request.getAttribute("viewName");
		Map<String, String> listMap = new HashMap<String, String>();
		ModelAndView mav = new ModelAndView();
		//session에 남아있는 sellerid를 가져와야함
		HttpSession session = request.getSession();
		SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
		String seller_id = sellerVO.getSeller_id();
				
		
		listMap.put("seller_id", seller_id);
		listMap.put("pro_num", pro_num);
		
		ProductVO menudetail = infoService.menudetail(listMap);
		
		//mav.addObject("menudetail", menudetail);
		//mav.setViewName(viewName);

		return menudetail; 
	}
	
	// 메뉴관리 - 수정
	@Override
	@RequestMapping(value = "/menumod.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity menumod(@ModelAttribute("menu") ProductVO menu,MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> menuMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			menuMap.put(name, value);
		}
		

		String imageFileName = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			infoService.modProduct(menuMap);
			if(imageFileName != null && imageFileName.length() != 0) {
				File srcFile = new File(MENU_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(MENU_IMAGE_REPO + "\\" + "menu" + "\\" + menu.getSeller_id());
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				
				String originalFileName = (String) menuMap.get("originalFileName");
				File oldFile = new File(MENU_IMAGE_REPO + "\\" +  "menu" + "\\" + menu.getSeller_id() + "\\" + originalFileName);
				oldFile.delete();
			}
			
			message = "<script>";
			message += " alert('메뉴를 수정했습니다.');";
			
			/*
			 * message += " location.href='" + multipartRequest.getContextPath() +
			 * "/menudetail.do?pro_num=" + menu.getPro_num() + "'; ";
			 */
			 
			message += " location.href='" + multipartRequest.getContextPath() +"/menumanage.do'";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(MENU_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
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
	
	
	
	// 메뉴관리 - 메뉴 등록
		@Override
		@RequestMapping(value = "/menumadd.do", method = RequestMethod.POST)
		@ResponseBody
		public ResponseEntity menumadd(@ModelAttribute("menu") ProductVO menu,MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
			response.setContentType("text/html; charset=UTF-8");
			multipartRequest.setCharacterEncoding("utf-8");
			Map<String, Object> menuMap  = new HashMap<String, Object>();
			Enumeration enu = multipartRequest.getParameterNames();
			while (enu.hasMoreElements()) {
				String name = (String) enu.nextElement();
				String value = multipartRequest.getParameter(name);
				menuMap.put(name, value);
			}
			
			//session에 남아있는 sellerid를 가져와야함
			HttpSession session = multipartRequest.getSession();
			SellerVO sellerVO = (SellerVO) session.getAttribute("sellerMember");
			String seller_id = sellerVO.getSeller_id();
			
			
			String category_code = "10";
			menuMap.put("seller_id", seller_id);
			menuMap.put("category_code", category_code);

			String imageFileName = upload(multipartRequest);
			menuMap.put("pro_img", imageFileName);
			

			String message;
			ResponseEntity resEnt = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			try {
				int articleNO = infoService.menumadd(menuMap);
				if (imageFileName != null && imageFileName.length() != 0) {
					File srcFile = new File(MENU_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
					File destDir = new File(MENU_IMAGE_REPO + "\\" + "menu" + "\\" + seller_id);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}

				message = "<script>";
				message += " alert('메뉴를 추가했습니다.');";
				message += " location.href='" + multipartRequest.getContextPath() +"/menumanage.do'";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			} catch (Exception e) {
				File srcFile = new File(MENU_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
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
				
				File file = new File(MENU_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
				if (mFile.getSize() != 0) {
					if (!file.exists()) {
						file.getParentFile().mkdirs();
						mFile.transferTo(new File(MENU_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName));
					}
				}
			}
			return imageFileName;
		}
	
	

}