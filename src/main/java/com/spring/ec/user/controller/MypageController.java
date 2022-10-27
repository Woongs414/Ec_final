package com.spring.ec.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ec.user.vo.MemberVO;

public interface MypageController {
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myplist(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView uReview(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView uBook(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView uLike(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView uAsk(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView recentView(HttpServletRequest request, HttpServletResponse response) throws Exception;
    //내 정보 수정 누르면 비밀번호 확인창으로 이동
    public ModelAndView pwdCheckPage(HttpServletRequest request, HttpServletResponse response) throws Exception;
    //정보 수정 전 비밀번호 확인(update user information before password Check)
	public ModelAndView myinfo(@RequestParam("user_pwd") String user_pwd, HttpServletRequest request, HttpServletResponse response) throws Exception;
    /*
     * //회원정보 업데이트(update user Information)
     * public String my_infoview() throws Exception;
     * public String userUpdate(MemberVO vo) throws Exception;
     */
	/*
	 * public List<MemberVO> userUpdate(@ModelAttribute("member") MemberVO member,
	 * HttpServletRequest request, HttpServletResponse response) throws Exception;
	 */
    /*
     * //비밀번호 변경(pwd change)
     * public String changePwd() throws Exception;
     * public void userPwdChange(MemberVO vo) throws Exception;
     */
    /*
     * //회원탈퇴(delete user)
     * public ModelAndView userDelete(@RequestParam("user_id") String user_id,
     * HttpServletRequest request, HttpServletResponse response) throws Exception;
     */
}
