package com.spring.ec.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ec.user.vo.AskVO;
import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.MemberVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;
import com.spring.ec.user.vo.WishVO;

@Repository("mypageDAO")
public class MypageDAOImpl implements MypageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	//찜목록
	@Override
	public List<WishVO> selectwish(String user_id) throws Exception {
		List<WishVO> articlesList = sqlSession.selectList("mapper.mypage.selectwish", user_id);
		return articlesList;
	}
	
	//리뷰목록
	@Override
	public List<ReviewVO> selectReview(String user_id) throws Exception {
		List<ReviewVO> articlesList = sqlSession.selectList("mapper.mypage.selectReview", user_id);
		return articlesList;
	}
	
	
	//먹플리볼플리목록
	@Override
	public List<BoardVO> selectBoard(String user_id) throws Exception {
		List<BoardVO> BoardList = sqlSession.selectList("mapper.mypage.selectBoard", user_id);
		return BoardList;
	}

	// 예약목록
	@Override
	public List<ReservVO> selectBook(String user_id) throws Exception {
		List<ReservVO> ReservList = sqlSession.selectList("mapper.mypage.selectBook", user_id);
		return ReservList;
	}

	// 1:1문의목록
	@Override
	public List<AskVO> selectAsk(String user_id) throws Exception {
		List<AskVO> AskList = sqlSession.selectList("mapper.mypage.selectAsk", user_id);
		return AskList;
	}
	
    // 비밀번호 확인(user_pwd check)
	@Override
	public int passChk(Map<String, String> listMap) throws DataAccessException {
	    int result = sqlSession.selectOne("mapper.mypage.passChk", listMap);
	    return result;
	}
	
	// 정보 보여주기(When MyPage is opened, user information is loaded)
	@Override
	public MemberVO userSelect(String user_id) throws Exception {
	    MemberVO infovo = sqlSession.selectOne("mapper.mypage.userSelect",user_id);
	    return infovo;
    }
	
	//회원정보 업데이트(update user Information)
    @Override
    public void userUpdate(MemberVO vo) throws Exception {
        sqlSession.update("mapper.mypage.userUpdate", vo);
    }
    
    //비밀번호 변경(pwd change)
    public void userPwdChange(MemberVO vo) throws Exception {
    	sqlSession.update("mapper.mypage.userPwdChange", vo);
    }
    
      //회원 탈퇴
      @Override
      public void userDelete(String user_id) throws Exception {
      int result = sqlSession.delete("mapper.member.userDelete", user_id);
      return;
      }
     
}
