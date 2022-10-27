package com.spring.ec.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.LikedVO;

public interface BoardDAO {
	public List selectAllBoardsList(int page) throws DataAccessException;

	public List selectEatBoardsList(int page) throws DataAccessException;

	public List selectSeeBoardsList(int page) throws DataAccessException;

	public int eatBoardPaging() throws DataAccessException;

	public int seeBoardPaging() throws DataAccessException;

	public int allBoardPaging() throws DataAccessException;

	public BoardVO selectBoard(int list_num) throws DataAccessException;

	public List selectImageFileList(int list_num) throws DataAccessException;

	public void addHits(int list_num) throws DataAccessException;

	public int insertNewBoard(Map boardMap) throws Exception;

	public void insertNewImage(Map boardMap) throws DataAccessException;

	public List selectAllCommentsList(int list_num) throws DataAccessException;

	public int insertNewComment(Map commentMap) throws Exception;
	
	public int selectLiked(Map likedMap) throws DataAccessException;
	
	public int insertNewLiked(LikedVO likedVO) throws DataAccessException;
	
	public int updateLiked(Map likedMap)throws DataAccessException;
	
	public int likeUp(int list_num) throws DataAccessException;
	
	public int likeDown(int list_num) throws DataAccessException;
	
	public int selectBad(Map badMap) throws DataAccessException;
	
	public int updateBad(Map badMap)throws DataAccessException;
	
	public int badUp(int list_num) throws DataAccessException;
	
	public int badDown(int list_num) throws DataAccessException;
	
	public int deleteBoard(int list_num) throws DataAccessException;
	
	public int updateBoard(Map boardMap) throws Exception;
	
	public void updateImage(Map boardMap) throws DataAccessException;
}
