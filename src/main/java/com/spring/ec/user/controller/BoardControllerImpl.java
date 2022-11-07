package com.spring.ec.user.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ec.user.service.BoardService;
import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.CommentVO;
import com.spring.ec.user.vo.LikedVO;
import com.spring.ec.user.vo.MemberVO;

@Controller("BoardController")
public class BoardControllerImpl implements BoardController {
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	private static final String U_IMAGE_REPO = "C:\\board\\u_board_imagefile";
	public static final int pagePerList = 10;
	public static final int pagingCount = 10;
	@Autowired
	private BoardService boardService;
	@Autowired
	MemberVO memberVO;
	@Autowired
	BoardVO boardVO;
	@Autowired
	CommentVO commentVO;

	// playList page move
	@Override
	@RequestMapping(value = "/user/u_board", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listBoards(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		int boardCount = boardService.allListCount();
		int displayNum = 10;
		int page = 0;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}
		int endPage = (int) (Math.ceil(page / (double) displayNum) * displayNum);
		int tempEndPage = (int) (Math.ceil(boardCount / (double) displayNum));
		int startPage = (endPage - displayNum) + 1;
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		boolean prev = startPage == 1 ? false : true;
		boolean next = endPage * displayNum >= boardCount ? false : true;

		Map paging = new HashMap();
		paging.put("boardCount", boardCount);
		paging.put("displayNum", displayNum);
		paging.put("startPage", startPage);
		paging.put("nowPage", page);
		paging.put("endPage", endPage);
		paging.put("prev", prev);
		paging.put("next", next);
		List boardsList = boardService.listBoards(page);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("paging", paging);
		mav.addObject("boardsList", boardsList);
		return mav;
	}
	// EatplayList page move
	@Override
	@RequestMapping(value = "/user/u_board/eatpl", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listEatBoards(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		int boardCount = boardService.eatListCount();
		int displayNum = 10;
		int page = 0;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}
		int endPage = (int) (Math.ceil(page / (double) displayNum) * displayNum);
		int tempEndPage = (int) (Math.ceil(boardCount / (double) displayNum));
		int startPage = (endPage - displayNum) + 1;
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		boolean prev = startPage == 1 ? false : true;
		boolean next = endPage * displayNum >= boardCount ? false : true;

		Map paging = new HashMap();
		paging.put("boardCount", boardCount);
		paging.put("displayNum", displayNum);
		paging.put("startPage", startPage);
		paging.put("nowPage", page);
		paging.put("endPage", endPage);
		paging.put("prev", prev);
		paging.put("next", next);
		List boardsList = boardService.eatListBoards(page);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("paging", paging);
		mav.addObject("boardsList", boardsList);
		return mav;
	}
	// SeeplayList page move
	@Override
	@RequestMapping(value = "/user/u_board/seepl", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listSeeBoards(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");

		int boardCount = boardService.seeListCount();
		int displayNum = 10;
		int page = 0;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}
		int endPage = (int) (Math.ceil(page / (double) displayNum) * displayNum);
		int tempEndPage = (int) (Math.ceil(boardCount / (double) displayNum));
		int startPage = (endPage - displayNum) + 1;
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		boolean prev = startPage == 1 ? false : true;
		boolean next = endPage * displayNum >= boardCount ? false : true;

		Map paging = new HashMap();
		paging.put("boardCount", boardCount);
		paging.put("displayNum", displayNum);
		paging.put("startPage", startPage);
		paging.put("nowPage", page);
		paging.put("endPage", endPage);
		paging.put("prev", prev);
		paging.put("next", next);
		List boardsList = boardService.seeListBoards(page);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("paging", paging);
		mav.addObject("boardsList", boardsList);
		return mav;
	}
	// board detail page move
	@Override
	@RequestMapping(value = "/user/u_board/u_boardView", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView viewboard(@RequestParam("list_num") int list_num, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		boardService.addHits(list_num);
		BoardVO board = boardService.viewBoard(list_num);
		List commentsList = boardService.listComments(list_num);
		HttpSession session = request.getSession();
//		MemberVO memberVO = (MemberVO) session.getAttribute("member");
//		String user_id = null;
//		if(memberVO != null) {
//			user_id = memberVO.getUser_id();
//		}else {
//			user_id = "";
//		}
//		Map likedMap = new HashMap();
//		Map badMap = new HashMap();
//		likedMap.put("list_num", list_num);
//		likedMap.put("user_id", user_id);
//		badMap.put("list_num", list_num);
//		badMap.put("user_id", user_id);
//		int liked = boardService.likedCheck(likedMap);
//		int bad = boardService.badCheck(badMap);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
//		mav.addObject("liked",liked);
//		mav.addObject("bad",bad);
		mav.addObject("board", board);
		mav.addObject("comments", commentsList);
		return mav;
	}
//	@Override
//	@RequestMapping(value = "/user/u_board/likeUp", method = { RequestMethod.POST, RequestMethod.GET })
//	@ResponseBody
//	public int boardLikeUp(@RequestParam(value = "list_num") int list_num,@RequestParam(value = "user_id") String user_id,
//			HttpServletRequest request, HttpServletResponse response) throws Exception {
//		Map likedMap = new HashMap();
//		int liked = 1;
//		likedMap.put("user_id", user_id);
//		likedMap.put("list_num", list_num);
//		likedMap.put("liked", liked);
//		int liked2 = boardService.likedUp(likedMap);
//		return liked;
//	}
//	@Override
//	@RequestMapping(value = "/user/u_board/likeDown", method = { RequestMethod.POST, RequestMethod.GET })
//	@ResponseBody
//	public int boardLikeDown(@RequestParam(value = "list_num") int list_num,@RequestParam(value = "user_id") String user_id,
//			HttpServletRequest request, HttpServletResponse response) throws Exception {
//		Map likedMap = new HashMap();
//		int liked = 0;
//		likedMap.put("user_id", user_id);
//		likedMap.put("list_num", list_num);
//		likedMap.put("liked", liked);
//		int liked2 = boardService.likedDown(likedMap);
//		likedMap.put("totalLiked", liked2);
//		return liked;
//	}
//	@Override
//	@RequestMapping(value = "/user/u_board/badUp", method = { RequestMethod.POST, RequestMethod.GET })
//	@ResponseBody
//	public int boardBadUp(@RequestParam(value = "list_num") int list_num,@RequestParam(value = "user_id") String user_id,
//			HttpServletRequest request, HttpServletResponse response) throws Exception {
//		Map badMap = new HashMap();
//		int bad = 1;
//		badMap.put("user_id", user_id);
//		badMap.put("list_num", list_num);
//		badMap.put("bad", bad);
//		int bad2 = boardService.badUp(badMap);
//		return bad;
//	}
//	@Override
//	@RequestMapping(value = "/user/u_board/badDown", method = { RequestMethod.POST, RequestMethod.GET })
//	@ResponseBody
//	public int boardBadDown(@RequestParam(value = "list_num") int list_num,@RequestParam(value = "user_id") String user_id,
//			HttpServletRequest request, HttpServletResponse response) throws Exception {
//		Map badMap = new HashMap();
//		int bad = 0;
//		badMap.put("user_id", user_id);
//		badMap.put("list_num", list_num);
//		badMap.put("bad", bad);
//		int liked2 = boardService.badDown(badMap);
//		return bad;
//	}
	// board write page move
	@Override
	@RequestMapping(value = "/user/u_board/boardForm", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView boardform(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	// board write summit method
	@Override
	@RequestMapping(value = "/board/addNewboard", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewBoard(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		String image_fileName = null;
		Map boardMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			boardMap.put(name, value);
		}
		System.out.println(multipartRequest.getParameter("category_code"));
		int category_code = Integer.parseInt(multipartRequest.getParameter("category_code"));

		String category = null;
		if (category_code == 1) {
			category = "eatpl";
		} else if (category_code == 2) {
			category = "seepl";
		}
		image_fileName = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String user_id = memberVO.getUser_id();
		boardMap.put("user_id", user_id);
		boardMap.put("parent_num", 0);
		boardMap.put("category_code", category_code);
		boardMap.put("image_fileName", image_fileName);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int list_num = boardService.addNewBoard(boardMap);
			System.out.println(list_num);
			if (image_fileName != null && image_fileName.length() != 0) {
				File srcFile = new File(U_IMAGE_REPO + "\\" + "temp" + "\\" + image_fileName);
				File destDir = new File(U_IMAGE_REPO + "\\" + list_num);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
			message = "<script>";
			message += " alert('������ �߰��߽��ϴ�.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/user/u_board'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(U_IMAGE_REPO + "\\" + "temp" + "\\" + image_fileName);
			srcFile.delete();

			message = "<script>";
			message += " alert('오류가 발생하였습니다');";
			message += " location.href='" + multipartRequest.getContextPath() + "/user/u_board'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	// comment summit method
	@Override
	@RequestMapping(value = "/u_board/addcomment", method = RequestMethod.POST)
	public ModelAndView addComment(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map commentMap = new HashMap();
		String comment_id = request.getParameter("comment_id");
		String comments = request.getParameter("comments");
		int list_num = Integer.parseInt(request.getParameter("list_num"));
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String user_id = memberVO.getUser_id();
		commentMap.put("comment_id", comment_id);
		commentMap.put("comments", comments);
		commentMap.put("list_num", list_num);
		commentMap.put("parent_num", "0");
		boardService.addNewComment(commentMap);
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/user/u_board/u_boardView?list_num=" + list_num);
		return mav;
	}

	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String image_fileName = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			image_fileName = mFile.getOriginalFilename();
			File file = new File(U_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					file.getParentFile().mkdirs();
					mFile.transferTo(new File(U_IMAGE_REPO + "\\" + "temp" + "\\" + image_fileName));
				}
			}
		}
		return image_fileName;
	}
	//�Խñ� ����
	@Override
	@RequestMapping(value = "/user/removeBoard", method = RequestMethod.POST )
	public ModelAndView removeBoard(@RequestParam("list_num") int list_num, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		boardService.removeBoard(list_num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/user/u_board");
		return mav;
	}
	//�Խñ� ���������� �̵�
	@Override
	@RequestMapping(value = "/user/modBoard", method = {RequestMethod.POST,RequestMethod.GET })
	public ModelAndView modBoardForm(@RequestParam("list_num") int list_num, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		BoardVO board = boardService.viewBoard(list_num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("board", board);
		return mav;
	}
	//�Խñ� ���� �Ϸ�
	@Override
	@RequestMapping(value = "/board/modBoardCompl", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modBoardcompletion(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		String image_fileName = null;
		Map boardMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			boardMap.put(name, value);
		}
		image_fileName = upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		boardMap.put("parent_num", 0);
		boardMap.put("image_fileName", image_fileName);
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int list_num = Integer.parseInt(multipartRequest.getParameter("list_num"));
			boardMap.put("list_num", list_num);
			int modcompl = boardService.modBoard(boardMap);
			System.out.println(list_num);
			if (image_fileName != null && image_fileName.length() != 0) {
				File srcFile = new File(U_IMAGE_REPO + "\\" + "temp" + "\\" + image_fileName);
				File destDir = new File(U_IMAGE_REPO + "\\" + list_num);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}
			message = "<script>";
			message += " alert('수정이 완료되었습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/user/u_board/u_boardView?list_num=" + list_num+ "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(U_IMAGE_REPO + "\\" + "temp" + "\\" + image_fileName);
			srcFile.delete();

			message = "<script>";
			message += " alert('오류가 발생하였습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/user/u_board'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
}
