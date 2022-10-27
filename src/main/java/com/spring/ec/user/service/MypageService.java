package com.spring.ec.user.service;

import java.util.List;
import java.util.Map;

import com.spring.ec.user.vo.AskVO;
import com.spring.ec.user.vo.BoardVO;
import com.spring.ec.user.vo.MemberVO;
import com.spring.ec.user.vo.ReservVO;
import com.spring.ec.user.vo.ReviewVO;
import com.spring.ec.user.vo.WishVO;

public interface MypageService {
	public List<WishVO> selectwish(String user_id) throws Exception;
	public List<ReviewVO> selectReview(String user_id) throws Exception;
	public List<BoardVO> selectBoard(String user_id) throws Exception;
	public List<ReservVO> selectBook(String user_id) throws Exception;
	public List<AskVO> selectAsk(String user_id) throws Exception;
	
	//회원정보 업데이트(update user Information)
    public MemberVO userSelect(String user_id) throws Exception;
	public int passChk(Map<String, String> listMap) throws Exception;
    /* public void userUpdate(MemberVO vo) throws Exception; */
    /*
     * //비밀번호 변경(pwd change)
     * public void userPwdChange(MemberVO vo) throws Exception;
     * //회원탈퇴(userDelete)
     * public void userDelete(String user_id) throws Exception;
     */
    /* public MemberVO userUpdate(Map<String, String> userMap) throws Exception; */
    /*
     * public int updatePwdUser(Map<String, String> listMap) throws Exception;
     * public List<MemberVO> userUpdate(String user_id) throws Exception;
     * public List updatePwdUser(String user_id) throws DataAccessException,
     * Exception;
     */
}
