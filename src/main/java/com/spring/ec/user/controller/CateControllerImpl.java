package com.spring.ec.user.controller;

import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ec.seller.vo.StoreVO;
import com.spring.ec.user.service.CateService;
import com.spring.ec.user.vo.MemberVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;

@Controller("categoryController")
public class CateControllerImpl implements CateController {
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	private static final String REVIEW_IMAGE_REPO = "C:\\EATSEE\\review_imagefile";
	@Autowired
	private CateService cateService;
	@Autowired
	StoreVO storeVO;
	@Autowired
	MemberVO memberVO;
	@Autowired
	ReservVO reservVO;
	@Autowired
	ReviewVO reviewVO;
	
	// ī�װ�
	@Override
	@RequestMapping(value = "/category.do", method = RequestMethod.GET)
	public ModelAndView category(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "/category/categorymain";
		System.out.println("viewName::" + viewName);
		List StoreList = cateService.selectAllStores();
		List MenuList = cateService.selectMenu();
		List ReviewList = cateService.selectReview();
		List Reviewavgsum = cateService.selectReviewavgsum();
		List prosumList = cateService.selectprosum();
		List wishList = null;
		HttpSession session = request.getSession();

		if (session.getAttribute("member") != null) {
			MemberVO mm = (MemberVO) session.getAttribute("member");
			wishList = cateService.selectwish(mm.getUser_id());
		}

		List wishsum = cateService.selectwishsum();


		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("StoreList", StoreList);
		mav.addObject("menuList", MenuList);
		mav.addObject("reviewList", ReviewList);
		mav.addObject("reviewavgsum", Reviewavgsum);
		mav.addObject("wishList", wishList);
		mav.addObject("wishsum", wishsum);
		mav.addObject("prosumList", prosumList);
		return mav;
	}

	/* �˻� */
	@Override
	@RequestMapping(value = "/searchcategory.do", method = RequestMethod.GET)
	public ModelAndView searchcategory(@RequestParam(value = "search") String search,
			@RequestParam(value = "kind") String kind, @RequestParam(value = "area") String area,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "/category/searchcategory";
		System.out.println("viewName::" + viewName);
		ModelAndView mav = new ModelAndView(viewName);
		List<String> searchword = Arrays.asList(search.split(" "));
		Map<String, String> listMap = new HashMap<String, String>();
		for (int i = 0; i < searchword.size(); i++) {
			listMap.put("key0" + (i + 1), searchword.get(i));

		}
		System.out.println("listMap::::" + listMap);
		System.out.println("Type is: " + listMap.getClass());

		if (area == null || area.equals("null") || area.equals("지역")) {
			listMap.put("area", "null");
		} else {
			listMap.put("area", area);
		}
		
		if (kind == null || kind.equals("null")|| kind.equals("업종")) {
			listMap.put("kind", "null");
		} else if (kind.equals("먹거리")) {
			listMap.put("kind", "10");
		} else if (kind.equals("볼거리")) {
			listMap.put("kind", "20");
		} else {
			listMap.put("kind", kind);
		}

		/*
		 * if (area.equals("null") && kind.equals("null") && search == null) {
		 * mav.setViewName("redirect:/category.do"); }
		 */
		List StoreList = cateService.selectSearchStores(listMap);
		List MenuList = cateService.selectMenu();
		List ReviewList = cateService.selectReview();
		List Reviewavgsum = cateService.selectReviewavgsum();
		List prosumList = cateService.selectprosum();
		List wishList = null;
		HttpSession session = request.getSession();

		if (session.getAttribute("member") != null) {
			MemberVO mm = (MemberVO) session.getAttribute("member");
			wishList = cateService.selectwish(mm.getUser_id());
		}

		List wishsum = cateService.selectwishsum();

		
		// ModelAndView mav = new ModelAndView("redirect:/category.do");
		// ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("StoreList", StoreList);
		mav.addObject("menuList", MenuList);
		mav.addObject("reviewList", ReviewList);
		mav.addObject("reviewavgsum", Reviewavgsum);
		mav.addObject("wishList", wishList);
		mav.addObject("wishsum", wishsum);
		mav.addObject("prosumList", prosumList);
		return mav;
	}

	/* ����ȸ */
	@Override
	@RequestMapping(value = "/storeInfo.do", method = RequestMethod.GET)
	public ModelAndView storeInfo(@RequestParam(value = "seller_id") String seller_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = "/category/storeInfo";
		System.out.println("viewName::" + viewName);
		// Map<String, String> listMap = new HashMap<String, String>();

		StoreVO StoreList = cateService.selectstoreInfo(seller_id);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("StoreList", StoreList);
		return mav;
	}

	/* ���� ���ƿ� up */
	@Override
	@RequestMapping(value = "/reviewlike.do", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String reviewlike(@RequestParam(value = "review_num") int reviewnum,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		cateService.updatereviewlike(reviewnum);
		String result = cateService.selectreviewlike(reviewnum);
		System.out.println("result::" + result);
		return result;
	}

	
	//221005
	// ���ϱ�
	@Override
	@RequestMapping(value = "/addwish.do", method = RequestMethod.POST)
	public @ResponseBody String addwish(@RequestParam(value = "seller_id") String seller_id,
			@RequestParam(value = "user_id") String user_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		Map<String, String> listMap = new HashMap<String, String>();
		listMap.put("seller_id", seller_id);
		listMap.put("user_id", user_id);
		int result = cateService.addwish(listMap);
		// �򰳼� ��������
		String wishsellsum = cateService.selectsellerwishsum(seller_id);


		String state = "";
		if (result == 1) {
			state = "true";
		} else {
			state = "false";
		}
		return wishsellsum;
	}

	
	//221005
	// �����
	@Override
	@RequestMapping(value = "/delwish.do", method = RequestMethod.POST)
	public @ResponseBody String delwish(@RequestParam(value = "seller_id") String seller_id,
			@RequestParam(value = "user_id") String user_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		Map<String, String> listMap = new HashMap<String, String>();
		listMap.put("seller_id", seller_id);
		listMap.put("user_id", user_id);
		int result = cateService.delwish(listMap);
		String wishsellsum = cateService.selectsellerwishsum(seller_id);
		String state = "";
		if (result == 1) {
			state = "false";
		} else {
			state = "true";
		}
		return wishsellsum;
	}

	// ���� �̹��� �� �߰��ϱ�
	/*
	 * @Override
	 * 
	 * @RequestMapping(value="/addreview.do", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public ResponseEntity addreview(@RequestParam(value =
	 * "seller_id") String seller_id, MultipartHttpServletRequest multipartRequest,
	 * HttpServletResponse response) throws Exception {
	 * multipartRequest.setCharacterEncoding("utf-8"); String imageFileName = null;
	 * 
	 * Map reviewMap = new HashMap(); Enumeration enu =
	 * multipartRequest.getParameterNames(); while(enu.hasMoreElements()) { String
	 * name = (String)enu.nextElement(); String value =
	 * multipartRequest.getParameter(name); reviewMap.put(name, value); }
	 * 
	 * //�α��� �� ���ǿ� ����� ȸ�� �������� �۾��� ���̵� ���ͼ� Map�� �����մϴ�. HttpSession session =
	 * multipartRequest.getSession(); MemberVO memberVO =
	 * (MemberVO)session.getAttribute("member"); String id = memberVO.getUser_id();
	 * reviewMap.put("user_id", id); reviewMap.put("seller_id", seller_id);
	 * 
	 * List<String> fileList = upload(multipartRequest); List<ImageVO> imageFileList
	 * = new ArrayList<ImageVO>(); if(fileList != null && fileList.size() !=0) {
	 * for(String fileName : fileList){ ImageVO imageVO = new ImageVO();
	 * imageVO.setImage_fileName(fileName); imageFileList.add(imageVO); }
	 * reviewMap.put("imageFileList",imageFileList ); } String message;
	 * ResponseEntity resEnt = null; HttpHeaders responseHeaders = new
	 * HttpHeaders();
	 * responseHeaders.add("Content-Type","text/html; charset=utf-8"); try { int
	 * review_num = cateService.addReview(reviewMap); if(imageFileList != null &&
	 * imageFileList.size() != 0) { for(ImageVO imageVO:imageFileList) {
	 * imageFileName = imageVO.getImage_fileName(); File srcFile = new
	 * File(REVIEW_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName); File destDir
	 * = new File(REVIEW_IMAGE_REPO + "\\" + review_num); //destDir.mkdirs();
	 * FileUtils.moveFileToDirectory(srcFile, destDir, true); } }
	 * 
	 * message = "<script>"; message += " alert('���並 �߰��߽��ϴ�.');";
	 * 
	 * message += " location.href='" + multipartRequest.getContextPath() +
	 * "/board/listArticles.do'; ";
	 * 
	 * message += " </script>"; resEnt = new ResponseEntity(message,
	 * responseHeaders,HttpStatus.CREATED); } catch(Exception e) { if(imageFileList
	 * != null && imageFileList.size() != 0) { for(ImageVO imageVO:imageFileList) {
	 * imageFileName = imageVO.getImage_fileName(); File srcFile = new
	 * File(REVIEW_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
	 * srcFile.delete(); } }
	 * 
	 * message = "<script>"; message += " alert('������ �߻��߽��ϴ�. �ٽ� �õ��� �ּ���');"; message
	 * += " location.href='" + multipartRequest.getContextPath() +
	 * "/board/articleForm.do'; "; message += " </script>"; resEnt = new
	 * ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	 * e.printStackTrace(); } return resEnt; }
	 */
	
	
	
	//���� ���
	@Override
	@RequestMapping(value="/addreview.do", method = RequestMethod.POST)
	public ModelAndView addreview(@ModelAttribute("review") ReviewVO review, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO mm = (MemberVO) session.getAttribute("member");
		System.out.println(mm.getUser_nick());
		review.setUser_id(mm.getUser_id());
		review.setUser_nick(mm.getUser_nick());
		int result = cateService.addreview(review);
		//result = cateService.addreview(review);
		ModelAndView mav = new ModelAndView("redirect:/category.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/reservation.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView reservation(@RequestParam(value = "seller_id") String seller_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ReservVO reservInfo = cateService.selectStoreInfo(seller_id);
		HttpSession session = request.getSession();
		session.setAttribute("reservInfo", reservInfo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("reservInfo", reservInfo);
		return mav;
	}

	@Override
	@RequestMapping(value = "/reservCheck/nonpay", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView reservCheck(@RequestParam(value = "seller_id") String seller_id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String user_name = request.getParameter("user_name");
		int user_tel = Integer.parseInt(request.getParameter("user_tel"));
		String user_email = request.getParameter("user_email");
		String user_id = memberVO.getUser_id();
		ReservVO reservInfo = cateService.selectStoreInfo(seller_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/reservCheck", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView unreservCheck(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		Map booking = new HashMap();
		HttpSession session = request.getSession();
		ReservVO reservInfo = (ReservVO)session.getAttribute("reservInfo");
		MemberVO member = (MemberVO)session.getAttribute("member");
		String user_id = null;
		if(member != null) {
			user_id = member.getUser_id();
			booking.put("user_id", user_id);
		}
		String user_name = request.getParameter("user_name");
		String user_tel = request.getParameter("user_tel");
		String user_email = request.getParameter("user_email");
		String user_hope = request.getParameter("user_hope");
		String reserv_date = request.getParameter("reserv_date");
		String reserv_time2 = request.getParameter("reserv_time");
		String reserv_time = reserv_time2.trim();
		String count_pp = request.getParameter("count_pp");
		String order_id = request.getParameter("order_id");
		String seller_id = request.getParameter("seller_id");
		int reserv_pay = reservInfo.getReserv_pay();
		booking.put("user_name", user_name);
		booking.put("user_tel", user_tel);
		booking.put("user_email", user_email);
		booking.put("user_hope", user_hope);
		booking.put("reserv_date", reserv_date);
		booking.put("reserv_time", reserv_time);
		booking.put("count_pp", count_pp);
		booking.put("order_id", order_id);
		booking.put("seller_id", seller_id);
		booking.put("reserv_pay", reserv_pay);
		if(member != null) {
		cateService.addBooking(booking);
		}else {
		cateService.addNoUserBooking(booking);	
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("booking", booking);
		mav.setViewName(viewName);
		return mav;
	}
}
