package com.spring.ec.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.ec.user.dao.MypageDAO;
import com.spring.ec.user.vo.AskVO;
import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.MemberVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;
import com.spring.ec.user.vo.WishVO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {
	@Autowired
	MypageDAO mypageDAO;
	
	//찜목록
	@Override
	public List<WishVO> selectwish(String user_id) throws Exception {
		List<WishVO> WishList = mypageDAO.selectwish(user_id);
		return WishList;
	}
	
	//리뷰목록
	@Override
	public List<ReviewVO> selectReview(String user_id) throws Exception {
		List<ReviewVO> ReviewList = mypageDAO.selectReview(user_id);
		return ReviewList;
	}
	
	//먹플리볼플리목록
	@Override
	public List<BoardVO> selectBoard(String user_id) throws Exception {
		List<BoardVO> BoardList = mypageDAO.selectBoard(user_id);
		return BoardList;
	}
	
	//예약목록
	@Override
	public List<ReservVO> selectBook(String user_id) throws Exception {
		List<ReservVO> ReservList = mypageDAO.selectBook(user_id);
		return ReservList;
	}
	
	//1:1문의목록
	@Override
	public List<AskVO> selectAsk(String user_id) throws Exception {
		List<AskVO> AskList = mypageDAO.selectAsk(user_id);
		return AskList;
	}
	
	 //패스워드 체크
    public int passChk(Map<String, String> listMap) throws Exception {
        int result = mypageDAO.passChk(listMap);
        return result;
    }
    
  //정보 수정(Changing Information)
    @Override
    public MemberVO userSelect(String user_id) throws Exception {
        MemberVO infovo = mypageDAO.userSelect(user_id);
        return infovo;
    }
    
  //회원정보 업데이트(update user Information)
  /*
   * public void userUpdate(MemberVO vo) throws Exception {
   * mypageDAO.userUpdate(vo);
   * }
   */
  /*
   * //비밀번호 변경(pwd change)
   * public void userPwdChange(MemberVO vo) throws Exception {
   * mypageDAO.userUpdate(vo);
   * }
   * 
   * //회원탈퇴
   * public void userDelete(String user_id) throws Exception {
   * return;
   * }
   */
    /*
     * //정보 수정(Changing Information)
     * 
     * @Override
     * public MemberVO userUpdate(Map<String, String> userMap) throws Exception {
     * MemberVO infovo = mypageDAO.userSelect(userMap);
     * return infovo;
     * }
     */
     /*
     
     */
    
   
/*
 * @Override
 * public List updatePwdUser(String user_id) throws Exception {
 * return mypageDAO.updatePwdUser(user_id);
 * }
 */
    
}