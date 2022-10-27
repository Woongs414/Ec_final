package com.spring.ec.user.service;

import java.util.List;
import java.util.Map;

import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.CommentVO;
import com.spring.ec.user.vo.LikedVO;

public interface BoardService {
	//플레이 리스트 게시판 목록
	public List<BoardVO> listBoards(int page)throws Exception;
	//먹플리 게시물목록만 노출
	public List<BoardVO> eatListBoards(int page)throws Exception;
	//볼플리 게시물 목록만 노출
	public List<BoardVO> seeListBoards(int page)throws Exception;
	//플레이리스트 페이지 갯수
	public int allListCount()throws Exception;
	//먹플리 페이지 갯수
	public int eatListCount()throws Exception;
	//볼플리 페이지 갯수
	public int seeListCount()throws Exception;	
	//게시물 상세창	
	public BoardVO viewBoard(int list_num) throws Exception;
	//게시물 클릭수
	public void addHits(int list_num)throws Exception;
	//게시글 쓰기
	public int addNewBoard(Map boardMap) throws Exception;
	// 댓글 불러오기
	public List<CommentVO> listComments(int list_num)throws Exception;
	// 댓글 작성
	public int addNewComment(Map commentMap) throws Exception;
	
	public int likedCheck(Map likedMap) throws Exception;
	
	public int likedUp(Map likedMap)throws Exception;
	
	public int likedDown(Map likedMap)throws Exception;
	
	public int badCheck(Map badMap) throws Exception;
	
	public int badUp(Map badMap)throws Exception;
	
	public int badDown(Map badMap)throws Exception;
	
	public int removeBoard(int list_num)throws Exception;
	
	public int modBoard(Map boardMap)throws Exception;
	
	
}
