package com.spring.ec.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.spring.ec.user.vo.AskVO;
import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.MemberVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;
import com.spring.ec.user.vo.WishVO;

public interface MypageDAO {
	public List<WishVO> selectwish(String user_id) throws Exception;
	public List<ReviewVO> selectReview(String user_id) throws Exception;
	public List<BoardVO> selectBoard(String user_id) throws Exception;
	public List<ReservVO> selectBook(String user_id) throws Exception;
	public List<AskVO> selectAsk(String user_id) throws Exception;
    //비밀번호 체크(Check Password)
    public int passChk(Map<String, String> listMap) throws DataAccessException;
	//회원정보 들어가기 전 정보 보여주기
	public MemberVO userSelect(String user_id) throws Exception;
	//회원정보 업데이트(update user Information)
    public void userUpdate(MemberVO vo) throws Exception;
    //비밀번호 변경(pwd change)
    public void userPwdChange(MemberVO vo) throws Exception;
    //회원탈퇴
    public void userDelete(String user_id) throws Exception;
		
	
    
    /*
     * //비밀번호 변경
     * int updatePwdUser(Map<String, String> ppp) throws DataAccessException;
     * 
     */
	
}
