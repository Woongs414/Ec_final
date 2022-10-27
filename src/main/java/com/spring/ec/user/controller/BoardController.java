package com.spring.ec.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ec.user.vo.LikedVO;

public interface BoardController {
	//사용자 게시판 연결 메소드
		public ModelAndView listBoards(HttpServletRequest request, HttpServletResponse response) throws Exception;
		
		public ModelAndView listEatBoards(HttpServletRequest request, HttpServletResponse response) throws Exception;
		
		public ModelAndView listSeeBoards(HttpServletRequest request, HttpServletResponse response) throws Exception;
		
		public ModelAndView viewboard(@RequestParam("list_num") int list_num, HttpServletRequest request,HttpServletResponse response) throws Exception;
			
		public ModelAndView boardform(HttpServletRequest request, HttpServletResponse response) throws Exception;
		
		public ResponseEntity addNewBoard(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
		
		public ModelAndView addComment(HttpServletRequest Request, HttpServletResponse response)throws Exception;
		
//		public int boardLikeUp(@RequestParam(value = "list_num") int list_num,@RequestParam(value = "user_id") String user_id,
//				HttpServletRequest request, HttpServletResponse response) throws Exception;
//		
//		public int boardLikeDown(@RequestParam(value = "list_num") int list_num,@RequestParam(value = "user_id") String user_id,
//				HttpServletRequest request, HttpServletResponse response) throws Exception;
//		
//		public int boardBadUp(@RequestParam(value = "list_num") int list_num,@RequestParam(value = "user_id") String user_id,
//				HttpServletRequest request, HttpServletResponse response) throws Exception;
//		
//		public int boardBadDown(@RequestParam(value = "list_num") int list_num,@RequestParam(value = "user_id") String user_id,
//				HttpServletRequest request, HttpServletResponse response) throws Exception;
		
		public ModelAndView removeBoard(@RequestParam("list_num") int list_num, HttpServletRequest request,
				HttpServletResponse response) throws Exception;
		
		public ModelAndView modBoardForm(@RequestParam("list_num") int list_num, HttpServletRequest request,
				HttpServletResponse response) throws Exception;
		
		public ResponseEntity modBoardcompletion(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
				throws Exception;
		
		
}
