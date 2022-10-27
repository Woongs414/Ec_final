package com.spring.ec.user.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ec.user.dao.BoardDAO;
import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.CommentVO;
import com.spring.ec.user.vo.LikedVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> listBoards(int page)throws Exception{
		return boardDAO.selectAllBoardsList(page);
	}
	
	@Override
	public List<BoardVO> eatListBoards(int page)throws Exception{
		return boardDAO.selectEatBoardsList(page);
	}
	
	@Override
	public List<BoardVO> seeListBoards(int page)throws Exception{
		return boardDAO.selectSeeBoardsList(page);
	}
	
	@Override
	public int allListCount()throws Exception{
		return boardDAO.allBoardPaging();
	}
	
	@Override
	public int eatListCount()throws Exception{
		return boardDAO.eatBoardPaging();
	}
	
	@Override
	public int seeListCount()throws Exception{
		return boardDAO.seeBoardPaging();
	}
	@Override
	public BoardVO viewBoard(int list_num) throws Exception{
		return boardDAO.selectBoard(list_num);
		
	}
	
	@Override
	public int addNewBoard(Map boardMap) throws Exception {
		int list_num = boardDAO.insertNewBoard(boardMap);
		boardMap.put("list_num", list_num);
		boardDAO.insertNewImage(boardMap);
		return list_num;
	}
	
	@Override
	public void addHits(int list_num)throws Exception{
		boardDAO.addHits(list_num);
	}
	// 게시글 comment 메소드
	@Override
	public List<CommentVO> listComments(int list_num)throws Exception{
		return boardDAO.selectAllCommentsList(list_num);
	}
	@Override
	public int addNewComment(Map commentMap) throws Exception {
		int comment_num = boardDAO.insertNewComment(commentMap);
		commentMap.put("comment_num", comment_num);
		return comment_num;
	}
	//좋아요 눌렀는지 확인
	@Override
	public int likedCheck(Map likedMap) throws Exception {
		int likedOk = boardDAO.selectLiked(likedMap);
		return likedOk;
	}	
	// 좋아요 중가
	@Override
	public int likedUp(Map likedMap)throws Exception {
		int list_num = (Integer)likedMap.get("list_num");
		int liked = boardDAO.likeUp(list_num);
		boardDAO.updateLiked(likedMap);
		return liked;
	}
	// 좋아요 감소
	@Override
	public int likedDown(Map likedMap)throws Exception {
		int list_num = (Integer)likedMap.get("list_num");
		int liked = boardDAO.likeDown(list_num);
		boardDAO.updateLiked(likedMap);
		return liked;
	}
	
	//싫어요 눌렀는지 확인
		@Override
		public int badCheck(Map badMap) throws Exception {
			int badOk = boardDAO.selectBad(badMap);
			return badOk;
		}	
		// 싫어요 중가
		@Override
		public int badUp(Map badMap)throws Exception {
			int list_num = (Integer)badMap.get("list_num");
			int bad = boardDAO.badUp(list_num);
			boardDAO.updateBad(badMap);
			return bad;
		}
		// 싫어요 감소
		@Override
		public int badDown(Map badMap)throws Exception {
			int list_num = (Integer)badMap.get("list_num");
			int bad = boardDAO.badDown(list_num);
			boardDAO.updateBad(badMap);
			return bad;
		}
		
		// 게시글 삭제
		@Override
		public int removeBoard(int list_num)throws Exception{
			return boardDAO.deleteBoard(list_num);
		}
		
		// 게시글 수정
		public int modBoard(Map boardMap)throws Exception{
			boardDAO.updateImage(boardMap);
			return boardDAO.updateBoard(boardMap);
		}
}
