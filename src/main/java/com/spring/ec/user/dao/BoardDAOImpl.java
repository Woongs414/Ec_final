package com.spring.ec.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.CommentVO;
import com.spring.ec.user.vo.ImageVO;
import com.spring.ec.user.vo.LikedVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;

	// 먹플리 볼플리
	@Override
	public List selectAllBoardsList(int page) throws DataAccessException {
		page = (page - 1) * 10;
		List<BoardVO> boardsList = sqlSession.selectList("mapper.board.selectAllBoardsList", page);
		return boardsList;
	}

	@Override
	public List selectEatBoardsList(int page) throws DataAccessException {
		page = (page - 1) * 10;
		List<BoardVO> boardsList = sqlSession.selectList("mapper.board.selectEatBoardsList", page);

		return boardsList;
	}

	@Override
	public List selectSeeBoardsList(int page) throws DataAccessException {
		page = (page - 1) * 10;
		List<BoardVO> boardsList = sqlSession.selectList("mapper.board.selectSeeBoardsList", page);
		return boardsList;
	}

	@Override
	public BoardVO selectBoard(int list_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectBoard", list_num);
	}

	// 이미지 파일 리스트 호출
	@Override
	public List selectImageFileList(int list_num) throws DataAccessException {
		List<ImageVO> imageFileList = null;
		imageFileList = sqlSession.selectList("mapper.board.selectImageFileList", list_num);
		return imageFileList;
	}

	@Override
	public void addHits(int list_num) throws DataAccessException {
		sqlSession.update("mapper.board.addHits", list_num);
	}

	@Override
	public int insertNewBoard(Map boardMap) throws Exception {
		int list_num = selectNewList_num();
		boardMap.put("list_num", list_num);
		sqlSession.insert("mapper.board.insertNewBoard", boardMap);
		return list_num;
	}

	@Override
	public void insertNewImage(Map boardMap) throws DataAccessException {
		String image_fileName = (String) boardMap.get("image_fileName");
		System.out.println("DAO" + image_fileName);
		int list_num = (Integer) boardMap.get("list_num");
		int image_num = selectNewImage_num();
		ImageVO imageVO = new ImageVO();
		imageVO.setImage_num(image_num);
		imageVO.setList_num(list_num);
		imageVO.setOrigin_fileName(image_fileName);
		imageVO.setImage_fileName(image_fileName);

		sqlSession.insert("mapper.board.insertNewImage", imageVO);
	}

	@Override
	public List selectAllCommentsList(int list_num) throws DataAccessException {
		List<CommentVO> commentsList = sqlSession.selectList("mapper.board.selectAllCommentsList", list_num);
		return commentsList;
	}

	@Override
	public int insertNewComment(Map commentMap) throws Exception {
		int comment_num = selectNewComment_num();
		commentMap.put("comment_num", comment_num);
		sqlSession.insert("mapper.board.insertNewComment", commentMap);
		return comment_num;
	}

	private int selectNewList_num() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewList_num");
	}

	private int selectNewImage_num() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewImage_num");
	}

	private int selectNewComment_num() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewComment_num");
	}

	@Override
	public int eatBoardPaging() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectEatBoardCount");
	}

	@Override
	public int seeBoardPaging() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectSeeBoardCount");
	}

	@Override
	public int allBoardPaging() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectAllBoardCount");
	}
	
	@Override
	public int selectLiked(Map likedMap) throws DataAccessException{
		String liked = sqlSession.selectOne("mapper.board.selectLiked", likedMap);
		int liked2 = 0;
		if(liked == null) {
			liked2 = 0;
		}else {
			liked2 = Integer.parseInt(liked);
		}
		return liked2;
	}
	
	@Override
	public int insertNewLiked(LikedVO likedVO) throws DataAccessException{
		int liked_num = sqlSession.selectOne("mapper.board.selectNewLiked_num");
		likedVO.setLiked_num(liked_num);
		int liked = sqlSession.insert("mapper.board.insertNewLiked", likedVO);
		return liked;
	}
	
	@Override
	public int updateLiked(Map likedMap)throws DataAccessException{
		String liked = sqlSession.selectOne("mapper.board.selectLiked", likedMap);
		System.out.println(liked);
		int liked2 = 0;
		if(liked == null) {
			int liked_num = sqlSession.selectOne("mapper.board.selectNewLiked_num");
			likedMap.put("liked_num", liked_num);
			liked2 = sqlSession.insert("mapper.board.insertNewLiked", likedMap);
		}else {
			liked2 = sqlSession.update("mapper.board.modLiked", likedMap);
		}
		return liked2;
	}
	
	@Override
	public int likeUp(int list_num) throws DataAccessException {
		sqlSession.update("mapper.board.likeUp", list_num);
		return sqlSession.selectOne("mapper.board.selectBoardLiked", list_num);
	}
	
	@Override
	public int likeDown(int list_num) throws DataAccessException {
		sqlSession.update("mapper.board.likeDown", list_num);
		return sqlSession.selectOne("mapper.board.selectBoardLiked", list_num);
	}
	
	@Override
	public int selectBad(Map badMap) throws DataAccessException{
		String bad = sqlSession.selectOne("mapper.board.selectBad", badMap);
		int bad2 = 0;
		if(bad == null) {
			bad2 = 0;
		}else {
			bad2 = Integer.parseInt(bad);
		}
		return bad2;
	}
	
	@Override
	public int updateBad(Map badMap)throws DataAccessException{
		String bad = sqlSession.selectOne("mapper.board.selectBad", badMap);
		int bad2 = 0;
		if(bad == null) {
			int bad_num = sqlSession.selectOne("mapper.board.selectNewBad_num");
			badMap.put("bad_num", bad_num);
			bad2 = sqlSession.insert("mapper.board.insertNewBad", badMap);
		}else {
			bad2 = sqlSession.update("mapper.board.modBad", badMap);
		}
		return bad2;
	}
	
	@Override
	public int badUp(int list_num) throws DataAccessException {
		sqlSession.update("mapper.board.badUp", list_num);
		return sqlSession.selectOne("mapper.board.selectBoardBad", list_num);
	}
	
	@Override
	public int badDown(int list_num) throws DataAccessException {
		sqlSession.update("mapper.board.badDown", list_num);
		return sqlSession.selectOne("mapper.board.selectBoardBad", list_num);
	}
	
	@Override
	public int deleteBoard(int list_num) throws DataAccessException{
		return sqlSession.delete("mapper.board.deleteBoard", list_num);
	}
	
	@Override
	public int updateBoard(Map boardMap) throws Exception {
		return sqlSession.insert("mapper.board.updateBoard", boardMap);
	}

	@Override
	public void updateImage(Map boardMap) throws DataAccessException {
		String image_fileName = (String) boardMap.get("image_fileName");
		int list_num = (Integer) boardMap.get("list_num");
		int image_num = selectNewImage_num();
		ImageVO imageVO = new ImageVO();
		imageVO.setImage_num(image_num);
		imageVO.setList_num(list_num);
		imageVO.setOrigin_fileName(image_fileName);
		imageVO.setImage_fileName(image_fileName);

		sqlSession.insert("mapper.board.updateImage", imageVO);
	}
}
